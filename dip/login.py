from flask import Flask, render_template, request, redirect, url_for, session, Blueprint
from config import mysql
import MySQLdb.cursors

loginBlueprint = Blueprint("login", __name__, template_folder="templates")

@loginBlueprint.route('/login', methods =['GET', 'POST'])
def login():
        mesage=''
        if request.method == 'POST' and 'username' in request.form and 'password' in request.form:
                username = request.form['username']
                password = request.form['password']
                cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
                cursor.execute('select username, password from users WHERE username = % s AND password = % s', (username, password, ))
                user = cursor.fetchone()
                cursor.close()
                if user:
                        session['loggedin'] = True
                        session['username'] = user['username']
                        session['password'] = user['password']
                        return redirect(url_for('table.tableList'))
                else:
                        mesage = 'Неверный логин или пароль !'
        return render_template('login.html', mesage=mesage)


#Обработчик формы выхода
@loginBlueprint.route('/logout')
def logout():
        session.pop('loggedin', None)
        session.pop('userid', None)
        session.pop('username', None)
        return redirect(url_for('login.login'))