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

@tableBlueprint.route('/table/orders', methods =['GET', 'POST'])
def showOrders():
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute('select * from orders')
    orders = cursor.fetchall()
    cursor.close()
    return render_template('orders.html', orders=orders)

@tableBlueprint.route('/table/aboutorder')
def aboutOrder():
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute('select * from orders join employee on orders.employeeId=employee.employeeId where orderId = %s', (request.args.get('orderId'),))
    order = cursor.fetchone()
    cursor.execute('select orderId, menu.name, orders_has_menu.ordered_amount from orders join orders_has_menu on orders.orderId=orders_has_menu.orders_orderId join menu on orders_has_menu.menu_foodId=menu.foodId where orderId=%s',(request.args.get('orderId'),))
    foodInOrder = cursor.fetchall()
    return render_template('aboutorder.html', order=order, foodInOrder=foodInOrder)

