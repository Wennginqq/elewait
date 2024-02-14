from flask import Flask, render_template, request, redirect, url_for, session, Blueprint
from config import mysql
from datetime import date
import MySQLdb.cursors

userBlueprint = Blueprint("user", __name__, template_folder="templates")

@userBlueprint.route('/user/<userID>', methods =['GET', 'POST'])
def getTable(userID):
    session['tableId'] = userID
    session['cart'] = {}
    session['orderId'] = ''
    session['calling'] = 0

    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute('update tablelist set status = "Ожидает" where tableId = %s',(userID,))
    mysql.connection.commit()
    cursor.close()
    return redirect('/user/menu/hot')

@userBlueprint.route('/user/menu/hot', methods =['GET', 'POST'])
def showMenuHot():
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute('select * from menu where food_category_categoryId = %s',(1,))
    data = cursor.fetchall()
    cursor.close()

    return render_template('user.html', data=data)

@userBlueprint.route('/user/menu/cold', methods =['GET', 'POST'])
def showMenuCold():
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute('select * from menu where food_category_categoryId = %s',(2,))
    data = cursor.fetchall()
    cursor.close()

    return render_template('user.html', data=data)

@userBlueprint.route('/user/menu/salad', methods =['GET', 'POST'])
def showMenuSalad():
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute('select * from menu where food_category_categoryId = %s',(6,))
    data = cursor.fetchall()
    cursor.close()

    return render_template('user.html', data=data)

@userBlueprint.route('/user/menu/soup', methods =['GET', 'POST'])
def showMenuSoup():
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute('select * from menu where food_category_categoryId = %s',(3,))
    data = cursor.fetchall()
    cursor.close()

    return render_template('user.html', data=data)

@userBlueprint.route('/user/menu/drinks', methods =['GET', 'POST'])
def showMenuDrinks():
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute('select * from menu where food_category_categoryId = %s',(5,))
    data = cursor.fetchall()
    cursor.close()

    return render_template('user.html', data=data)

@userBlueprint.route('/user/menu/snaks', methods =['GET', 'POST'])
def showMenuSnaks():
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute('select * from menu where food_category_categoryId = %s',(4,))
    data = cursor.fetchall()
    cursor.close()

    return render_template('user.html', data=data)

@userBlueprint.route('/user/addtocart', methods =['GET', 'POST'])
def addToCart():
    fID = request.args.get('foodId')
    fromcart = request.args.get('fromcart')
    fList = session['cart']
    if fID in fList:
        fList[fID] += 1
    else:
        fList[fID] = 1
    session['cart'] = fList
    print(request.args.get('fromcart'))
    if fromcart != None:
        return redirect('/user/cart')
    else:
        return redirect('/user/menu/hot')

@userBlueprint.route('/user/removefromcart', methods =['GET', 'POST'])
def removeFromCart():
    fID = request.args.get('foodId')
    fromcart = request.args.get('fromcart')
    fList = session['cart']
    if fID in fList:
        if fList[fID] < 2:
            fList.pop(fID)
            session['cart'] = fList
            print(type(session['cart']))
            
            return redirect('/user/cart')
        else:
            fList[fID] -= 1
    else:
        fList[fID] = 1
    session['cart'] = fList
    print(request.args.get('fromcart'))
    if fromcart != None:
        return redirect('/user/cart')
    else:
        return redirect('/user/menu/hot')
    
@userBlueprint.route('/user/cart', methods =['GET', 'POST'])
def cart():
    cartList = session['cart']
    temp = []
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    for el in cartList:
        cursor.execute('select foodId, name, price from menu where foodId = %s', (el,))
        temp.append(cursor.fetchone())
    
    cursor.execute('select orderId, orders_has_menu.ordered_amount, menu.name from orders join orders_has_menu on orderId=orders_orderId join menu on foodId=menu_foodId where orderId = %s', (session['orderId'],))
    orderList = cursor.fetchall()
    cursor.close()

    return render_template('cart.html', cartList = cartList, temp=temp, orderList=orderList)
    
@userBlueprint.route('/user/aboutfood', methods =['GET', 'POST'])
def aboutFood():
    foodId = request.args.get('foodId')
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute('select *from menu where foodId = %s', (foodId,))
    items = cursor.fetchone()
    cursor.close()
    return render_template('aboutfood.html', items=items)


@userBlueprint.route('/user/cart/addorder', methods =['GET', 'POST'])
def addOrder():
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute('select status from tablelist where tableId = %s', (session['tableId'],))
    tableStatus = cursor.fetchone()
    print(tableStatus['status'])
    cursor.close()
    if tableStatus['status'] == 'Обслуживается':
        session['message'] = ''
        if session['cart'] == {}:
            return redirect('/user/cart')
        elif session['cart'] != {} and session['orderId'] == '':
            cartList = session['cart']
            check = 0
            cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
            for item in cartList:
                cursor.execute('select foodId, price from menu where foodId = %s', (item,))
                checkall = cursor.fetchone()
                check += checkall['price']*cartList[item]
            cursor.execute('insert into orders (tableId, order_date, bill) values(%s,%s,%s)', (session['tableId'], date.today(), check))
            mysql.connection.commit()
            session['orderId'] = cursor.lastrowid
            for item in cartList:
                cursor.execute('insert into orders_has_menu (orders_orderId, menu_foodId, ordered_amount) values(%s, %s, %s)', (session['orderId'], item, cartList[item]))
                mysql.connection.commit()
            cursor.close()
            session['cart'] = {}
            return redirect('/user/cart')
        
        elif session['cart'] != {} and session['orderId'] != '':
            cartList = session['cart']
            cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
            cursor.execute('select bill from orders where orderId =%s', (session['orderId'],))
            billFromBD = cursor.fetchone()
            check = billFromBD['bill']

            for item in cartList:
                cursor.execute('select foodId, price from menu where foodId = %s', (item,))
                checkall = cursor.fetchone()
                check += checkall['price']*cartList[item]
                print(check)
            cursor.execute('update orders set bill =%s where orderId = %s', (check, session['orderId'],))
            mysql.connection.commit()

            for item in cartList:
                    cursor.execute('select ordered_amount from orders_has_menu where menu_foodId = %s and orders_orderId = %s', (item, session['orderId']))
                    f = cursor.fetchone()
                    if f:
                        print(f['ordered_amount'])
                        cursor.execute('update orders_has_menu set ordered_amount = %s where menu_foodId = %s and orders_orderId = %s', (f['ordered_amount']+cartList[item], item, session['orderId']))
                        mysql.connection.commit()
                    else:
                        cursor.execute('insert into orders_has_menu (orders_orderId, menu_foodId, ordered_amount) values(%s, %s, %s)', (session['orderId'], item, cartList[item]))
                        mysql.connection.commit()
            cursor.close()
            session['cart'] = {}
            return redirect('/user/cart')
    else:
        session['message'] = 'Вы не можете ничего заказывать, пока вам не подтвердит сессию администратор'
        return redirect('/user/cart')
    
@userBlueprint.route('/user/call', methods =['GET', 'POST'])
def startCall():
    session['tableId']
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute('update tablelist set waiter=1 where tableId = %s', (session['tableId'],))
    mysql.connection.commit()
    cursor.close()
    session['calling'] = 1
    return redirect('/user/menu/hot')

@userBlueprint.route('/user/endcall', methods =['GET', 'POST'])
def endCall():
    session['tableId']
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute('update tablelist set waiter=0 where tableId = %s', (session['tableId'],))
    mysql.connection.commit()
    cursor.close()
    session['calling'] = 0
    return redirect('/user/menu/hot')