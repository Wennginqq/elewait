from flask_mysqldb import MySQL
import MySQLdb.cursors
SECRET_KEY = "ASDDASDkqwerqrqwawrqrq"
UPLOAD_FOLDER = 'static/images/'

MYSQL_HOST = 'mysql'
MYSQL_USER = 'root'
MYSQL_PASSWORD = 'root'
MYSQL_DB = 'begemot'
MYSQL_CURSORCLASS = 'DictCursor'

mysql = MySQL()
