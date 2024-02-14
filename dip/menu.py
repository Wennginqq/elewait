from flask import Flask, render_template, request, redirect, url_for, session, Blueprint
from config import mysql
from datetime import date
import MySQLdb.cursors

menuBlueprint = Blueprint("menu", __name__, template_folder="templates")

@menuBlueprint.route('/admin/menu', methods =['GET', 'POST'])
def showAdminMenu():
    if session['loggedin'] == False:
        return redirect('/user/menu/hot')
    else:
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('select * from menu')
        items = cursor.fetchall()
        cursor.close()
        return render_template('admin-menu.html', items=items)

@menuBlueprint.route('/admin/menu/intostoplist', methods =['GET', 'POST'])
def intoStoplist():
    foodId = request.args.get('foodId')
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute('update menu set stoplist = "недоступно" where foodId=%s',(foodId,) )
    mysql.connection.commit()
    cursor.close()
    return redirect('/admin/menu')

@menuBlueprint.route('/admin/menu/fromstoplist', methods =['GET', 'POST'])
def fromStoplist():
    foodId = request.args.get('foodId')
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute('update menu set stoplist = "доступно" where foodId=%s',(foodId,) )
    mysql.connection.commit()
    cursor.close()
    return redirect('/admin/menu')