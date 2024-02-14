from flask import Flask, render_template, request, redirect, jsonify, blueprints

from login import loginBlueprint
from tablelist import tableBlueprint
from user import userBlueprint
from menu import menuBlueprint
import config
from config import mysql

app = Flask(__name__)
app.secret_key = config.SECRET_KEY

app.secret_key = config.SECRET_KEY
app.config['MYSQL_HOST'] = config.MYSQL_HOST
app.config['MYSQL_USER'] = config.MYSQL_USER
app.config['MYSQL_PASSWORD'] = config.MYSQL_PASSWORD
app.config['MYSQL_DB'] = config.MYSQL_DB
app.config['MYSQL_CURSORCLASS'] = config.MYSQL_CURSORCLASS

mysql.init_app(app)

app.register_blueprint(loginBlueprint)
app.register_blueprint(tableBlueprint)
app.register_blueprint(userBlueprint)
app.register_blueprint(menuBlueprint)

@app.route('/', methods=['GET', 'POST'])
def default():
    return redirect('/login')

if __name__ == "__main__":
    app.run(host='0.0.0.0',debug=True)