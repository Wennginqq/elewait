from flask import Flask, render_template, request, redirect, url_for, session, Blueprint
from config import mysql
import MySQLdb.cursors

tableBlueprint = Blueprint("table", __name__, template_folder="templates")

@tableBlueprint.route('/table', methods =['GET', 'POST'])
def tableList():
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute('select * from tablelist')
    tblist = cursor.fetchall()
    cursor.close()
    return render_template('tablelist.html', tblist=tblist)

@tableBlueprint.route('/table/start', methods =['GET', 'POST'])
def startTableSession():
    tableID = request.args.get('tableID')
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute('update tablelist set status = "Обслуживается" where tableId = %s',(tableID,))
    mysql.connection.commit()
    cursor.close()
    return redirect('/table')

@tableBlueprint.route('/table/over', methods =['GET', 'POST'])
def endTableSession():
    tableID = request.args.get('tableID')
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute('update tablelist set status = "Пустой" where tableId = %s',(tableID,))
    mysql.connection.commit()
    cursor.close()
    return redirect('/table')
