from flask import Flask, request
import os
import time
import mysql.connector
import redis


if 'MYSQL_PASSWORD' and 'MYSQL_USER' and 'MYSQL_PASSWORD' and 'REDIS_HOST' and 'DB_NAME' in os.environ:
    print('Required environment variables set')
else:
    print('Required environment variables are not set!!\n Check if DB related variables are set')
    quit()

mysql_password = os.environ.get("MYSQL_PASSWORD")
mysql_user = os.environ.get("MYSQL_USER")
mysql_hostname = os.environ.get("MYSQL_HOST")
db_name = os.environ.get("DB_NAME")

def dbseed():
     print('create database and tables')
     mydb = mysql.connector.connect(
     host=str(mysql_hostname),
     user=str(mysql_user),
     password=str(mysql_password),
     database=str(db_name)
     )

     mycursor = mydb.cursor()
     mycursor.execute("CREATE DATABASE IF NOT EXISTS mydatabase")
     mycursor.execute("CREATE TABLE IF NOT EXISTS players(firstname VARCHAR(50) NOT NULL,lastname VARCHAR(50) NOT NULL,club VARCHAR(50) NOT NULL )")
     mydb.close()

     return "database created"

dbseed()

app = Flask(__name__)
cache = redis.Redis(host=os.environ.get("REDIS_HOST"), port=6379)

def get_hit_count():
    retries = 5
    while True:
        try:
            return cache.incr('hits')
        except redis.exceptions.ConnectionError as exc:
            if retries == 0:
                raise exc
            retries -= 1
            time.sleep(0.5)

@app.route('/')
def hello():
    count = get_hit_count()
    return 'Hello World! I have been seen {} times.\n'.format(count)

@app.route('/player', methods=['POST'])
def createplayerFromUrl():
     allparameters = request.args.to_dict()
     first_name = allparameters['firstname']
     last_name = allparameters['lastname']
     club = allparameters['club']  
     #TODO: validate that all arguments have value

     mydb = mysql.connector.connect(
     host=str(mysql_hostname),
     user=str(mysql_user),
     password=str(mysql_password),
     database="mydatabase"
     )

     mycursor = mydb.cursor()
 
     insert_stmt = (
          "INSERT INTO players VALUES (%s, %s, %s)"
     )

     sql_data = (str(first_name), str(last_name), str(club))

     try:
     # Executing the SQL command
         mycursor.execute(insert_stmt, sql_data)

     # Commit your changes in the database
         mydb.commit()

     except:
     # Rolling back in case of error
         mydb.rollback()

     # Closing the connection
     mydb.close()  
     
     return "data entered"

@app.route('/newplayer', methods=['POST'])
def createplayerFromBody():
     content_type = request.headers.get('Content-Type')
     if (content_type == 'application/json'):
        json = request.json
        return json
     else:
        return 'Content-Type not supported! Must be JSON'


     allparameters = request.get_json()
     first_name = allparameters['firstname']
     last_name = allparameters['lastname']
     club = allparameters['club']  
     #TODO: validate that all arguments have value

     mydb = mysql.connector.connect(
     host=str(mysql_hostname),
     user=str(mysql_user),
     password=str(mysql_password),
     database="mydatabase"
     )

     mycursor = mydb.cursor()
 
     insert_stmt = (
          "INSERT INTO players VALUES (%s, %s, %s)"
     )

     sql_data = (str(first_name), str(last_name), str(club))

     try:
     # Executing the SQL command
         mycursor.execute(insert_stmt, sql_data)

     # Commit your changes in the database
         mydb.commit()

     except:
     # Rolling back in case of error
         mydb.rollback()

     # Closing the connection
     mydb.close()  
     
     return "data entered"

if __name__ == '__main__':
	app.run(host='0.0.0.0', port=8080, debug=True)      

