from django.conf import settings
from django.shortcuts import render, redirect
from django.contrib import messages
from django.core.mail import send_mail

from django.db import connection
from rest_framework.views import APIView
from rest_framework.response import Response
from django.views.generic import View

import sys

# Create your views here.
from happypawpetstore_Admin.forms import CustForm, orderform, shelterform, doctorform, categoryform, subcategoryform, \
    productform, orderitemform, galleryform, feedbackform, appointmentform, areaform
from happypawpetstore_Admin.models import customer, shelter_home, doctor, category, sub_category, product, order, order_item, \
    gallery, feedback, appointment, area, cart, wishlist

# <--------Data Show of Data Dictionary------->
from happypawpetstore_Admin.function import handle_upload_file
import secrets


def show_user(request):
    return render(request, "user_table.html")


def show(request):
    cust = customer.objects.all()
    return render(request, "user_table.html", {'customers': cust})


def show_shelter(request):
    shel = shelter_home.objects.all()
    return render(request, "shelterhome_table.html", {'shelter': shel})


def show_doctor(request):
    doc = doctor.objects.all()
    return render(request, "doctor.html", {'doctors': doc})


def show_category(request):
    cat = category.objects.all()
    return render(request, "category.html", {'categorys': cat})


def show_subcategory(request):
    sub_cat = sub_category.objects.all()
    return render(request, "sub_category.html", {'sub_categorys': sub_cat})


def show_product(request):
    pro = product.objects.all()
    return render(request, "product.html", {'products': pro})


def cart_table(request):
    emp = cart.objects.all()
    return render(request, "cart_table.html", {'cart': emp})

def wishlist_table(request):
    emp = wishlist.objects.all()
    return render(request, "wishlist_table.html", {'wishlist': emp})


def show_order(request):
    ord = order.objects.all()
    return render(request, "order.html", {'orders': ord})


def show_order_item(request):
    ordi = order_item.objects.all()
    return render(request, "order_item.html", {'orderitems': ordi})


def show_gallery(request):
    gal = gallery.objects.all()
    return render(request, "gallery.html", {'gallerys': gal})


def show_feedback(request):
    feed = feedback.objects.all()
    return render(request, "feedback.html", {'feedbacks': feed})


def show_appointment(request):
    app = appointment.objects.all()
    return render(request, "appointment.html", {'appointments': app})


def show_area(request):
    are = area.objects.all()
    return render(request, "area.html", {'areas': are})


# <--------Data Delete of Data Dictionary------->


def destory(request, id):
    custo = shelter_home.objects.get(shelter_id=id)
    custo.delete()
    return redirect("/show_f")


def destory_doctor(request, id):
    custo = doctor.objects.get(doctor_id=id)
    custo.delete()
    return redirect("/show_do")


def destory_category(request, id):
    custo = category.objects.get(category_id=id)
    custo.delete()
    return redirect("/show_cat")


def destory_subcategory(request, id):
    custo = sub_category.objects.get(sub_category_id=id)
    custo.delete()
    return redirect("/show_subcat")


def destory_product(request, id):
    custo = product.objects.get(product_id=id)
    custo.delete()
    return redirect("/show_pro")

def delete_cart(request, id):
    cart1 = cart.objects.get(cart_id=id)
    cart1.delete()
    return redirect("/cart_table")

def delete_wishlist(request, id):
    wish1 = wishlist.objects.get(wishlist_id=id)
    wish1.delete()
    return redirect("/wish_table")


def destory_order(request, id):
    custo = order.objects.get(order_id=id)
    custo.delete()
    return redirect("/show_ord")


def destory_order_item(request, id):
    custo = order_item.objects.get(order_item_id=id)
    custo.delete()
    return redirect("/show_item")


def destory_gallery(request, id):
    custo = gallery.objects.get(gallery_id=id)
    custo.delete()
    return redirect("/show_gal")


def destory_feedback(request, id):
    custo = feedback.objects.get(feedback_id=id)
    custo.delete()
    return redirect("/show_feed")


def destory_appointment(request, id):
    custo = appointment.objects.get(appointment=id)
    custo.delete()
    return redirect("/show_app")


def destory_area(request, id):
    custo = area.objects.get(area_id=id)
    custo.delete()
    return redirect("/show_are")


# <--------Data Insert of Data Dictionary------->


def insert_user(request):
    area_all = area.objects.all()
    if request.method == "POST":
        print("||||||||||||||||||||||||||||||||||")
        form = CustForm(request.POST)
        print("-------------", form.errors)

        if form.is_valid():
            try:
                form.save()
                return redirect('/show_name')
            except:
                print("---------------", sys.exc_info())
    else:
        form = CustForm()

    return render(request, 'insert_customer.html', {'form': form, 'area_all': area_all})


def insert_order(request):
    customer_all = customer.objects.all()
    if request.method == "POST":
        form = orderform(request.POST)
        print("-------------", form.errors)

        if form.is_valid():
            try:
                form.save()
                return redirect('/show_ord/')
            except:
                print("---------------", sys.exc_info())
    else:
        form = orderform()

    return render(request, 'insert__order.html', {'form': form, 'customer_all': customer_all})


def insert_shelter(request):
    if request.method == "POST":
        form = shelterform(request.POST, request.FILES)
        print("-------------", form.errors)

        if form.is_valid():
            try:
                handle_upload_file(request.FILES['shelter_image'])
                form.save()
                return redirect('/show_f/')
            except:
                print("---------------", sys.exc_info())
    else:
        form = shelterform()

    return render(request, 'insert_shelterhome.html', {'form': form})


def insert_doctor(request):
    if request.method == "POST":
        form = doctorform(request.POST, request.FILES)
        print("-------------", form.errors)

        if form.is_valid():
            try:
                handle_upload_file(request.FILES['doctor_image'])
                form.save()
                return redirect('/show_do/')
            except:
                print("---------------", sys.exc_info())
    else:
        form = doctorform()

    return render(request, 'insert_doctor.html', {'form': form})


def insert_category(request):
    if request.method == "POST":
        form = categoryform(request.POST)
        print("-------------", form.errors)

        if form.is_valid():
            try:
                form.save()
                return redirect('/show_cat/')
            except:
                print("---------------", sys.exc_info())
    else:
        form = categoryform()

    return render(request, 'insert_category.html', {'form': form})


def insert_subcategory(request):
    category_all = category.objects.all()
    if request.method == "POST":
        form = subcategoryform(request.POST)
        print("-------------", form.errors)

        if form.is_valid():
            try:
                form.save()
                return redirect('/show_subcat/')
            except:
                print("---------------", sys.exc_info())
    else:
        form = subcategoryform()

    return render(request, 'insert_subcategory.html', {'form': form, 'category_all': category_all})


def insert_product(request):
    subcategory_all = sub_category.objects.all()
    if request.method == "POST":
        print("||||||||||||||||||||||||||||||||||")
        form = productform(request.POST, request.FILES)
        print("-------------", form.errors)

        if form.is_valid():
            try:
                handle_upload_file(request.FILES['product_image'])
                form.save()
                return redirect('/show_pro')
            except:
                print("---------------", sys.exc_info())
    else:
        form = productform()

    return render(request, 'insert_product.html', {'form': form, 'subcategory_all': subcategory_all})


def insert_orderitem(request):
    order_all = order.objects.all()
    product_all = product.objects.all()
    if request.method == "POST":
        print("||||||||||||||||||||||||||||||||||")
        form = orderitemform(request.POST)
        print("-------------", form.errors)

        if form.is_valid():
            try:
                form.save()
                return redirect('/show_item')
            except:
                print("---------------", sys.exc_info())
    else:
        form = orderitemform()

    return render(request, 'insert_orderitem.html', {'form': form, 'order_all': order_all, 'product_all': product_all})


def insert_gallery(request):
    product_all = product.objects.all()
    if request.method == "POST":
        form = galleryform(request.POST, request.FILES)
        print("-------------", form.errors)

        if form.is_valid():
            try:
                handle_upload_file(request.FILES['image_path'])
                form.save()
                return redirect('/show_gal')
            except:
                print("---------------", sys.exc_info())
    else:
        form = galleryform()

    return render(request, 'insert_gallery.html', {'form': form, 'product_all': product_all})


def insert_feedback(request):
    customer_all = customer.objects.all()
    product_all = product.objects.all()
    if request.method == "POST":
        print("||||||||||||||||||||||||||||||||||")
        form = feedbackform(request.POST)
        print("-------------", form.errors)

        if form.is_valid():
            try:
                form.save()
                return redirect('/show_feed')
            except:
                print("---------------", sys.exc_info())
    else:
        form = feedbackform()

    return render(request, 'insert_feedback.html',
                  {'form': form, 'customer_all': customer_all, 'product_all': product_all})


def insert_appointment(request):
    customer_all = customer.objects.all()
    doctor_all = doctor.objects.all()
    if request.method == "POST":
        print("||||||||||||||||||||||||||||||||||")
        form = appointmentform(request.POST)
        print("-------------", form.errors)

        if form.is_valid():
            try:
                form.save()
                return redirect('/show_app')
            except:
                print("---------------", sys.exc_info())
    else:
        form = appointmentform()

    return render(request, 'insert_appointment.html',
                  {'form': form, 'customer_all': customer_all, 'doctor_all': doctor_all})


def insert_area(request):
    if request.method == "POST":
        print("||||||||||||||||||||||||||||||||||")
        form = areaform(request.POST)
        print("-------------", form.errors)

        if form.is_valid():
            try:
                form.save()
                return redirect('/show_are')
            except:
                print("---------------", sys.exc_info())
    else:
        form = areaform()

    return render(request, 'insert_area.html', {'form': form})


# <--------Data Select & Update of Data Dictionary------->

def select_shelter(request, id):
    cat = shelter_home.objects.get(shelter_id=id)
    return render(request, 'update_shelter.html', {'cat': cat})


def update_shelter(request, id):
    cat = shelter_home.objects.get(shelter_id=id)
    print("=============", cat)
    form = shelterform(request.POST, instance=cat)
    print("++++++++++++++", form.errors)
    if form.is_valid():
        print("=============INSIDEIFFFFF")
        form.save()
        return redirect("/show_f/")
    return render(request, 'update_shelter.html', {'from': form})


def select_feedback(request, id):
    car = feedback.objects.get(feedback_id=id)
    customer_all_all = customer.objects.all()
    product_all_all = product.objects.all()
    d = car.feedback_date
    d = d.strftime("%Y-%m-%d")
    print("======", d)
    return render(request, 'update_feedback.html',
                  {'car': car, 'customer_all_all': customer_all_all, 'product_all_all': product_all_all, 'fdate': d})


def update_feedback(request, id):
    car = feedback.objects.get(feedback_id=id)
    customer_all_all = customer.objects.all()
    product_all_all = product.objects.all()
    form = feedbackform(request.POST, instance=car)
    print("++++++++++++++", form.errors)
    if form.is_valid():
        print("=============", car.feedback_date)
        print("=============INSIDEIFFFFF")
        form.save()
        return redirect("/show_feed/")
    return render(request, 'update_feedback.html',
                  {'form': form, 'customer_all_all': customer_all_all, 'product_all_all': product_all_all})


def select_doctor(request, id):
    doc = doctor.objects.get(doctor_id=id)
    return render(request, 'update_doctor.html', {'doc': doc})


def update_doctor(request, id):
    print("]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]")
    doc = doctor.objects.get(doctor_id=id)
    print("=============", doc)
    form = doctorform(request.POST, instance=doc)
    print("++++++++++++++", form.errors)
    if form.is_valid():
        print("=============INSIDEIFFFFF")
        form.save()
        return redirect("/show_do/")
    return render(request, 'update_doctor.html', {'form': form})


def select_category(request, id):
    dcat = category.objects.get(category_id=id)
    return render(request, 'update_category.html', {'dcat': dcat})


def update_category(request, id):
    dcat = category.objects.get(category_id=id)
    print("=============", dcat)
    form = categoryform(request.POST, instance=dcat)
    print("++++++++++++++", form.errors)
    if form.is_valid():
        print("=============INSIDEIFFFFF")
        form.save()
        return redirect("/show_cat/")
    return render(request, 'update_category.html', {'form': form})


def select_subcategory(request, id):
    subcat = sub_category.objects.get(sub_category_id=id)
    category_all = category.objects.all()
    return render(request, 'update_subcategory.html', {'subcat': subcat, 'category_all': category_all})


def update_subcategory(request, id):
    subcat = sub_category.objects.get(sub_category_id=id)
    category_all = category.objects.all()
    print("=============", subcat)
    form = subcategoryform(request.POST, instance=subcat)
    print("++++++++++++++", form.errors)
    if form.is_valid():
        print("=============INSIDEIFFFFF")
        form.save()
        return redirect("/show_subcat/")
    return render(request, 'update_subcategory.html', {'form': form, 'category_all': category_all})


def select_product(request, id):
    prod = product.objects.get(product_id=id)
    subcategory_all_all = sub_category.objects.all()
    return render(request, 'update_product.html', {'prod': prod, 'subcategory_all_all': subcategory_all_all})


def update_product(request, id):
    prod = product.objects.get(product_id=id)
    subcategory_all_all = sub_category.objects.all()
    print("=============", prod)
    form = productform(request.POST, instance=prod)
    print("++++++++++++++", form.errors)
    if form.is_valid():
        print("=============INSIDEIFFFFF")
        form.save()
        return redirect("/show_pro/")
    return render(request, 'update_product.html', {'form': form, 'subcategory_all_all': subcategory_all_all})


def select_order(request, id):
    orde = order.objects.get(order_id=id)
    customer_all_ord = customer.objects.all()
    d = orde.order_date
    d = d.strftime("%Y-%m-%d")
    print("======", d)
    return render(request, 'update_order.html', {'orde': orde, 'customer_all_ord': customer_all_ord, 'odate': d})


def update_order(request, id):
    orde = order.objects.get(order_id=id)
    customer_all_ord = customer.objects.all()
    print("=============", orde)
    form = productform(request.POST, instance=orde)
    print("++++++++++++++", form.errors)
    if form.is_valid():
        print("=============INSIDEIFFFFF")
        form.save()
        return redirect("/show_ord/")
    return render(request, 'update_order.html', {'form': form, 'customer_all_ord': customer_all_ord})


def select_orderitem(request, id):
    ordi = order_item.objects.get(order_item_id=id)
    order_all_all = order.objects.all()
    product_all_item = product.objects.all()
    return render(request, 'update_orderitem.html',
                  {'ordi': ordi, 'order_all_all': order_all_all, 'product_all_item': product_all_item})


def update_orderitem(request, id):
    ordi = order_item.objects.get(order_item_id=id)
    order_all_all = order.objects.all()
    product_all_item = product.objects.all()
    form = orderitemform(request.POST, instance=ordi)
    print("++++++++++++++", form.errors)
    if form.is_valid():
        print("=============INSIDEIFFFFF")
        form.save()
        return redirect("/show_item/")
    return render(request, 'update_orderitem.html',
                  {'form': form, 'order_all_all': order_all_all, 'product_all_item': product_all_item})


def select_gallery(request, id):
    gal = gallery.objects.get(gallery_id=id)
    product_all_gal = product.objects.all()
    return render(request, 'update_gallery.html', {'gal': gal, 'product_all_gal': product_all_gal})


def update_gallery(request, id):
    gal = gallery.objects.get(gallery_id=id)
    product_all_gal = product.objects.all()
    form = galleryform(request.POST, instance=gal)
    print("++++++++++++++", form.errors)
    if form.is_valid():
        print("=============INSIDEIFFFFF")
        form.save()
        return redirect("/show_gal/")
    return render(request, 'update_gallery.html', {'form': form, 'product_all_gal': product_all_gal})


def select_appointment(request, id):
    appo = appointment.objects.get(appointment=id)
    customer_all_app = customer.objects.all()
    doctor_all_app = doctor.objects.all()
    d = appo.appointment_date
    d = d.strftime("%Y-%m-%d")
    print("======", d)
    return render(request, 'update_appointment.html',
                  {'appo': appo, 'customer_all_app': customer_all_app, 'doctor_all_app': doctor_all_app, 'adate': d})


def update_appointment(request, id):
    appo = appointment.objects.get(appointment=id)
    customer_all_app = customer.objects.all()
    doctor_all_app = doctor.objects.all()
    form = appointmentform(request.POST, instance=appo)
    print("++++++++++++++", form.errors)
    if form.is_valid():
        print("=============", appo.appointment_date)
        print("=============INSIDEIFFFFF")
        form.save()
        return redirect("/show_app/")
    return render(request, 'update_appointment.html',
                  {'form': form, 'customer_all_app': customer_all_app, 'doctor_all_app': doctor_all_app})


def select_area(request, id):
    are = area.objects.get(area_id=id)
    return render(request, 'update_area.html', {'are': are})


def update_area(request, id):
    are = area.objects.get(area_id=id)
    form = areaform(request.POST, instance=are)
    print("++++++++++++++", form.errors)
    if form.is_valid():
        print("=============INSIDEIFFFFF")
        form.save()
        return redirect("/show_are/")
    return render(request, 'update_area.html', {'form': form})


# ---------------Login Page------------------

def login(request):
    if request.method == "POST":
        email = request.POST["email"]
        password = request.POST["password"]
        val = customer.objects.filter(c_email=email, c_password=password, is_admin=1).count()

        if val == 1:
            data = customer.objects.filter(c_email=email, c_password=password, is_admin=1)
            for i in data:
                request.session['admin_email'] = i.c_email
                request.session['admin_password'] = i.c_password
                request.session['admin_id'] = i.c_id

            if request.POST.get("remember"):
                response = redirect('/admin_dash/')

                response.set_cookie('admin_email', request.POST["email"], 3600 * 24 * 365 * 2)
                response.set_cookie('admin_password', request.POST["password"], 3600 * 24 * 365 * 2)
                return response
            return redirect("/admin_dash/")

        else:
            messages.error(request, "Invalid user name and password")
            return render(request, "login.html")

    else:
        if request.COOKIES.get("admin_email"):
            return render(request, "login.html",
                          {'admin_email_cookie': request.COOKIES['admin_email'],
                           'admin_password_cookie': request.COOKIES['admin_password']})

        else:
            return render(request, "login.html")


def admin_logout(request):
    try:
        print("====INSIDE LOGOUT BEFORRRR")
        del request.session['admin_email']
        del request.session['admin_password']
        del request.session['admin_id']
        print("====INSIDE LOGOUT BEFORRRR")

    except:
        pass
    return redirect("/login/")


def forgotpassword(request):
    return render(request, 'forgotpassword.html')


def sendotp(request):
    otp1 = secrets.SystemRandom().randint(10000, 99999)
    e = request.POST['email']

    request.session['temail'] = e
    print("-------------", e)

    obj = customer.objects.filter(c_email=e).count()

    if obj == 1:
        val = customer.objects.filter(c_email=e).update(c_otp=otp1, c_otp_used=0)

        subject = 'OTP Verification'
        message = str(otp1)
        email_from = settings.EMAIL_HOST_USER
        recipient_list = [e, ]

        send_mail(subject, message, email_from, recipient_list)
        return render(request, 'reset_password.html')


def reset_password(request):
    if request.method == "POST":

        T_otp = request.POST['OTP']
        T_pass = request.POST['pass']
        T_cpass = request.POST['cpass']

        if T_pass == T_cpass:
            e = request.session['temail']

            val = customer.objects.filter(c_email=e, c_otp=T_otp, c_otp_used=0).count()

            if val == 1:
                customer.objects.filter(c_email=e).update(c_otp_used=1, c_password=T_pass)
                return redirect("/login")
            else:
                messages.error(request, "Invalid OTP")
                return render(request, "forgotpassword.html")

        else:
            messages.error(request, "New password and Confirm password does not match ")
            return render(request, "forgotpassword.html")

    else:
        return redirect("/forgotpassword")


#
# def show_editprofile(request):
#     return render(request, "edit_profile.html")

def admin_edit(request):
    if request.session.has_key('admin_id'):
        print("===INSIDE IFFFFFFF")
        cid = request.session['admin_id']
        c = customer.objects.get(c_id=cid)
        a = area.objects.all()
        return render(request, "edit_profile.html", {'customer': c, 'area': a})


    else:
        return redirect("/login/")

    return render(request, "edit_profile.html")


def admin_update(request):
    if request.session.has_key('admin_id'):
        cid = request.session['admin_id']
        c = customer.objects.get(c_id=cid)
        a = area.objects.all()
        form = CustForm(request.POST, instance=c)
        print("-------------", form.errors)

        if form.is_valid():
            try:

                form.save()
                return redirect("/admin_dash/")
            except:
                print("-------------------", sys.exc_info())
        else:
            pass
        return render(request, "edit_profile.html", {'customer': c, 'area': a})
    else:
        return redirect("/login/")
    return render(request, "edit_profile.html")


def show_admindashboard(request):
    p = product.objects.all().count()
    c = customer.objects.all().count()
    o = order.objects.all().count()
    a = appointment.objects.all().count()
    dash = order.objects.all()
    return render(request, "admin_dashboard.html", {'orderlist': dash,'products': p,'customers': c, 'orders': o, 'appointments': a})


# -----------------Chart------------------
class HomeView(View):
    def get(self, request, *args, **kwargs):
        return render(request, "admin_dashboard.html")


class ProjectChart(APIView):
    authentication_classes = []
    permission_classes = []

    def get(self, request, format=None):
        cursor = connection.cursor()
        cursor.execute(
            '''SELECT (select product_name from product where product_id = i.product_id_id) as name , sum(i.product_price) as amount FROM order_item i join product p where i.product_id_id = p.product_id  GROUP by product_id_id''')
        qs = cursor.fetchall()

        labels = []
        default_items = []
        for item in qs:
            labels.append(item[0])
            default_items.append(item[1])
        data = {
            "labels": labels,
            "default": default_items,
        }
        return Response(data)

def accept_order(request, id):
    o = order.objects.get(order_id=id)
    o.order_status = 1
    o.save()
    return redirect("/show_ord/")

def reject_order(request, id):
    o = order.objects.get(order_id=id)
    o.order_status = 2
    o.save()
    return redirect("/show_ord/")

def accept_appointment(request, id):
    a = appointment.objects.get(appointment=id)
    a.appointment_status= 1
    a.save()
    return redirect("/show_app/")

def reject_appointment(request, id):
    a = appointment.objects.get(appointment=id)
    a.appointment_status= 2
    a.save()
    return redirect("/show_app/")

def accept_payment(request, id):
    o = order.objects.get(order_id=id)
    o.payment_status = 1
    o.save()
    return redirect("/show_ord/")

def reject_payment(request, id):
    o = order.objects.get(order_id=id)
    o.payment_status = 2
    o.save()
    return redirect("/show_ord/")
