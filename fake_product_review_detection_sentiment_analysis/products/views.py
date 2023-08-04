from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.conf import settings
from django.db.models import Q
from django.core.files.storage import FileSystemStorage
from .models import product
from django.contrib import messages
from django.db import connection
from fake_product_review_detection_sentiment_analysis.utils import getDropDown, dictfetchall
import datetime
from products.SentimentAnalysis import SentimentAnalysis

sentiments = SentimentAnalysis()

# Create your views here.
def comment_listing(request):
    cursor = connection.cursor()
    if (request.session.get('user_level_id', None) == 1):
        SQL = "SELECT * FROM `comment`,`users_user`,`products_product` WHERE comment_product_id = product_id AND comment_user_id = user_id"
    else:
        customerID = str(request.session.get('user_id', None))
        SQL = "SELECT * FROM `comment`,`users_user`,`products_product` WHERE comment_product_id = product_id AND comment_user_id = user_id AND user_id = " + customerID
    cursor.execute(SQL)
    commentlist = dictfetchall(cursor)

    context = {
        "commentlist": commentlist
    }

    # Message according Product #
    context['heading'] = "Comments Reports"
    return render(request, 'comment-listing.html', context)

# Create your views here.
def get_ip_comment_listing(request, IP):
    cursor = connection.cursor()
    SQL = "SELECT * FROM `comment`,`users_user`,`products_product` WHERE comment_product_id = product_id AND comment_user_id = user_id AND comment_ip = '" + IP +"'"
    cursor.execute(SQL)
    commentlist = dictfetchall(cursor)

    context = {
        "commentlist": commentlist
    }

    # Message according Product #
    context['heading'] = "IP Comments Reports"
    return render(request, 'comment-listing.html', context)


# Create your views here.
def get_user_comment_listing(request, userID):
    cursor = connection.cursor()
    SQL = "SELECT * FROM `comment`,`users_user`,`products_product` WHERE comment_product_id = product_id AND comment_user_id = user_id AND comment_user_id = " + userID
    cursor.execute(SQL)
    commentlist = dictfetchall(cursor)

    context = {
        "commentlist": commentlist
    }

    # Message according Product #
    context['heading'] = "User Comments Report"
    return render(request, 'comment-listing.html', context)

# Create your views here.
def ip_comment_listing(request):
    cursor = connection.cursor()
    SQL = "SELECT count(*) as comment_count, comment_ip FROM `comment` GROUP BY comment_ip"
    cursor.execute(SQL)
    commentlist = dictfetchall(cursor)

    context = {
        "commentlist": commentlist
    }

    # Message according Product #
    context['heading'] = "Comments IP Reports"
    return render(request, 'ip-comment-listing.html', context)

# Create your views here.
def user_comment_listing(request):
    cursor = connection.cursor()
    SQL = "SELECT count(*) as comment_count, comment_user_id, user_name, user_image FROM `comment`, users_user WHERE comment_user_id = user_id GROUP BY comment_user_id, user_name, user_image ORDER BY comment_count DESC"
    cursor.execute(SQL)
    commentlist = dictfetchall(cursor)

    context = {
        "commentlist": commentlist
    }

    # Message according Product #
    context['heading'] = "Comments IP Reports"
    return render(request, 'user-comment-listing.html', context)

def getComments(id):
    cursor = connection.cursor()
    cursor.execute("SELECT * FROM comment, users_user WHERE comment_user_id = user_id AND comment_product_id = " + id)
    dataList = dictfetchall(cursor)
    return dataList

# Create your views here.
def productlisting(request):
    cursor = connection.cursor()
    cursor.execute("SELECT products_product.*, type.*, company.*, AVG(comment_rating) as average FROM products_product LEFT JOIN company ON company.company_id = products_product.product_company_id LEFT JOIN `type` ON type_id = product_type_id LEFT JOIN `comment` ON comment_product_id = product_id GROUP by product_id")
    productlist = dictfetchall(cursor)

    context = {
        "productlist": productlist
    }

    # Message according Product #
    context['heading'] = "Products Details";
    return render(request, 'products-listing.html', context)

# Create your views here.
def payment(request):
    orderID = request.session.get('order_id', None);
    cursor = connection.cursor()
    cursor.execute("SELECT SUM(oi_total) as TotalCartValue FROM order_item WHERE oi_order_id = " + str(orderID))
    orderTotal = dictfetchall(cursor)
    context = {
        "orderTotal": orderTotal[0]
    }
    if (request.method == "POST"):
        request.session['order_id'] = "0"
        return redirect('order-items/'+str(orderID))
    # Message according Product #
    context['heading'] = "Products Details";
    return render(request, 'payment.html', context)

# Create your views here.
def cancel_order(request, orderID):
    cursor = connection.cursor()
    cursor.execute("""
                UPDATE `order`
                SET order_status= '5' WHERE order_id = %s
            """, (
        orderID
    ))
    messages.add_message(request, messages.INFO, "Your order has been cancelled successfully !!!")
    return redirect('orderlisting')

# Create your views here.
def comment_details(request, commentID):
    cursor = connection.cursor()

    ### Get the Comment Details Listing  ####
    cursor.execute("SELECT *  FROM `comment`, `users_user`,`products_product` WHERE product_id = comment_product_id AND user_id =  comment_user_id  AND comment_id = "+ str(commentID))
    commentDetails = dictfetchall(cursor)
    
    context = {
        "commentDetails": commentDetails[0],
    }

    # Message according Product #
    context['heading'] = "Products Details";
    return render(request, 'comment-details.html', context)

# Create your views here.
def products(request):
    cursor = connection.cursor()
    cursor.execute(
        "SELECT * FROM products_product, company, type WHERE company_id = product_company_id AND type_id = product_type_id")
    productlist = dictfetchall(cursor)

    context = {
        "productlist": productlist
    }

    # Message according Product #
    context['heading'] = "Products Details";
    return render(request, 'products.html', context)

# Create your views here.
def product_filter(request, typeID):
    cursor = connection.cursor()
    cursor.execute(
        "SELECT * FROM products_product, company, type WHERE company_id = product_company_id AND type_id = product_type_id AND type_id = "+ str(typeID))
    productlist = dictfetchall(cursor)

    context = {
        "productlist": productlist
    }

    # Message according Product #
    context['heading'] = "Products Details";
    return render(request, 'products.html', context)

def update(request, productId):
    productdetails = product.objects.get(product_id=productId)
    context = {
        "fn": "add",
        "procompanylist":getDropDown('company', 'company_id', 'company_name', productdetails.product_company_id, '1'),
        "protypelist":getDropDown('type', 'type_id', 'type_name', productdetails.product_type_id, '1'),
        "productdetails":productdetails
    }
    if (request.method == "POST"):
        try:
            product_image = None
            product_image = productdetails.product_image
            if(request.FILES and request.FILES['product_image']):
                productImage = request.FILES['product_image']
                fs = FileSystemStorage()
                filename = fs.save(productImage.name, productImage)
                product_image = "/uploads/"+str(productImage)

            addProduct = product(
            product_id = productId,
            product_name = request.POST['product_name'],
            product_type_id = request.POST['product_type_id'],
            product_company_id = request.POST['product_company_id'],
            product_price = request.POST['product_price'],
            product_image = product_image,                  
            product_description = request.POST['product_description'],
            product_stock = request.POST['product_stock'])
            addProduct.save()
        except Exception as e:
            return HttpResponse('Something went wrong. Error Message : '+ str(e))

        context["productdetails"] = product.objects.get(product_id = productId)
        messages.add_message(request, messages.INFO, "Product updated succesfully !!!")
        return redirect('productlisting')

    else:
        return render(request,'products-add.html', context)

def product_details(request, productId):
    cursor = connection.cursor()
    cursor.execute(
        "SELECT * FROM products_product, company, type WHERE company_id = product_company_id AND type_id = product_type_id AND product_id = "+productId)
    productdetails = dictfetchall(cursor)

    context = {
        "fn": "add",
        "productdetails":productdetails[0],
        "allComments": getComments(productId)
    }
    if (request.method == "POST"):
        try:
            if(request.session.get('order_id', None) == "0" or request.session.get('order_id', False) == False):
                customerID = request.session.get('user_id', None)
                orderDate = datetime.datetime.now().strftime("%I:%M%p on %B %d, %Y")
                cursor = connection.cursor()
                cursor.execute("""
                INSERT INTO `order`
                SET order_user_id=%s, order_date=%s, order_status=%s, order_total=%s
                """, (
                    customerID,
                    orderDate,
                    1,
                    0))
                request.session['order_id'] = cursor.lastrowid    
            
            orderID = request.session.get('order_id', None);
            cursor = connection.cursor()
            totalAmount = int(request.POST['product_price']) * int(request.POST['product_quantity']);
            cursor.execute("""
            INSERT INTO order_item
            SET oi_order_id=%s, oi_product_id=%s, oi_price_per_unit=%s, oi_cart_quantity=%s, oi_total=%s
        """, (
            orderID,
            request.POST['product_id'],
            request.POST['product_price'],
            request.POST['product_quantity'],
            totalAmount))
        except Exception as e:
            return HttpResponse('Something went wrong. Error Message : '+ str(e))

        context["productdetails"] = product.objects.get(product_id = productId)
        messages.add_message(request, messages.INFO, "Product updated succesfully !!!")
        return redirect('cart_listing')
    else:
        return render(request,'products-details.html', context)

def add(request):
    context = {
        "fn": "add",
        "procompanylist":getDropDown('company', 'company_id', 'company_name',0, '1'),
        "protypelist":getDropDown('type', 'type_id', 'type_name',0, '1'),
        "heading": 'Product add'
    }
    if (request.method == "POST"):
        try:
            product_image = None

            if(request.FILES and request.FILES['product_image']):
                productImage = request.FILES['product_image']
                fs = FileSystemStorage()
                filename = fs.save(productImage.name, productImage)
                product_image = "/uploads/"+str(productImage)

            addProduct = product(product_name = request.POST['product_name'],
            product_type_id = request.POST['product_type_id'],
            product_company_id = request.POST['product_company_id'],
            product_price = request.POST['product_price'],
            product_image = product_image,                  
            product_description = request.POST['product_description'],
            product_stock = request.POST['product_stock'])
            addProduct.save()
        except Exception as e:
            return HttpResponse('Something went wrong. Error Message : '+ str(e))

        return redirect('productlisting')

    else:
        return render(request,'products-add.html', context)

def post_comment(request):
    if (request.method == "POST"):
        try:
            rating = sentiments.performAnalysis(request.POST['comment_description'])
            ratingTitle = sentiments.getTitle(rating)
            ratingColor = sentiments.getColor(rating)
            now = datetime.datetime.now()
            userID = orderID = request.session.get('user_id', None)
            date = now.strftime("%Y-%m-%d %H:%M")
            cursor = connection.cursor()
            cursor.execute("""
		    INSERT INTO comment
		    SET comment_rating_title=%s, comment_rating_color = %s, comment_user_id=%s, comment_rating=%s, comment_product_id=%s, comment_title=%s, comment_description=%s, comment_date = %s, comment_ip = %s
		    """, (
            ratingTitle,
            ratingColor,
            userID,
            rating,
            request.POST['product_id'],
            request.POST['comment_title'],
            request.POST['comment_description'],
            date,
            get_client_ip(request)            
            ))
        except Exception as e:
            return HttpResponse('Something went wrong. Error Message : '+ str(e))

        return redirect('/products/product-details/'+request.POST['product_id']+'/')

def delete_comment(request, commentId):
    cursor = connection.cursor()
    sql = 'DELETE FROM comment WHERE comment_id=' + commentId
    cursor.execute(sql)
    messages.add_message(request, messages.INFO, "Comment Deleted Successfully !!!")
    return redirect('comment_listing')

def delete(request, prodId):
    try:
        deleteProduct = product.objects.get(product_id = prodId)
        deleteProduct.delete()
    except Exception as e:
        return HttpResponse('Something went wrong. Error Message : '+ str(e))
    messages.add_message(request, messages.INFO, "Product Deleted Successfully !!!")
    return redirect('productlisting')

def stock(request):
    cursor = connection.cursor()
    cursor.execute(
        "SELECT * FROM stock, products_product WHERE product_id = stock_product_id")
    stocklist = dictfetchall(cursor)

    context = {
        "stocklist": stocklist
    }

    # Message according Product #
    context['heading'] = "Products Stock Details";
    return render(request, 'stock.html', context)

def deletestock(request, id):
    cursor = connection.cursor()
    sql = 'DELETE FROM stock WHERE stock_id=' + id
    cursor.execute(sql)
    return redirect('stock')

def companylisting(request):
    cursor = connection.cursor()
    cursor.execute(
        "SELECT * FROM company")
    companylist = dictfetchall(cursor)

    context = {
        "companylist": companylist
    }

    # Message according Product #
    context['heading'] = "Products Company";
    return render(request, 'viewcompany.html', context)

def deletecompany(request, id):
    cursor = connection.cursor()
    sql = 'DELETE FROM company WHERE company_id=' + id
    cursor.execute(sql)
    return redirect('company')

def addcompany(request):
    context = {
        "fn": "add",
        "heading": 'Add Company'
    }
    if (request.method == "POST"):
        cursor = connection.cursor()
        cursor.execute("""
		   INSERT INTO company
		   SET company_name=%s
		""", (
            request.POST['company_name']))
        return redirect('companylisting')
    return render(request, 'addcompany.html', context)


def get_graph(request, productID):
    cursor = connection.cursor()

    ### Get the Comment Details Listing  ####
    cursor.execute("SELECT products_product.*, type.*, company.*, comment.comment_rating_color, comment.comment_rating_title, COUNT(comment_rating) as average FROM products_product LEFT JOIN company ON company.company_id = products_product.product_company_id LEFT JOIN `type` ON type_id = product_type_id LEFT JOIN `comment` ON comment_product_id = product_id where product_id = "+productID+" GROUP by comment_rating, comment_rating_color, comment_rating_title")
    reviewDetails = dictfetchall(cursor)
    
    context = {
        "reviewDetails": reviewDetails,
        "productDetails": reviewDetails[0]
    }

    # Message according Product #
    context['heading'] = "Product Graph";
    return render(request, 'review-graph.html', context)

def get_client_ip(request):
    x_forwarded_for = request.META.get('HTTP_X_FORWARDED_FOR')
    if x_forwarded_for:
        ip = x_forwarded_for.split(',')[0]
    else:
        ip = request.META.get('REMOTE_ADDR')
    return ip