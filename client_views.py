from django.http import JsonResponse
from django.shortcuts import render, redirect
from datetime import date
from happypawpetstore_Admin.models import customer, area, category, sub_category, product, feedback, cart, wishlist, order, \
    order_item, shelter_home, doctor, appointment, gallery
from happypawpetstore_Admin.forms import CustForm, areaform, categoryform, subcategoryform, productform
from django.contrib import messages
from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage
from django.conf import settings
from django.core.mail import send_mail
import sys
import random

# Create your views here.
from happypawpetstore_Client.cart import client_Cart


def home(request):
    pro = product.objects.all()
    return render(request, "homepage.html", {'pro': pro})


def c_login(request):
    if request.method == "POST":
        email = request.POST["email"]
        password = request.POST["password"]
        val = customer.objects.filter(c_email=email, c_password=password, is_admin=0).count()

        if val == 1:
            data = customer.objects.filter(c_email=email, c_password=password, is_admin=0)
            for i in data:
                request.session['client_email'] = i.c_email
                request.session['client_password'] = i.c_password
                request.session['client_id'] = i.c_id
                print(request.session['client_id'], "=======================")
            if request.POST.get("remember"):
                response = redirect('/client/show_home/')

                response.set_cookie('client_email', request.POST["email"], 3600 * 24 * 365 * 2)
                response.set_cookie('client_password', request.POST["password"], 3600 * 24 * 365 * 2)
                return response
            return redirect("/client/show_home/")

        else:
            messages.error(request, "Invalid user name and password")
            return render(request, "client_login.html")

    else:
        if request.COOKIES.get("client_email"):
            return render(request, "client_login.html",
                          {'client_email_cookie': request.COOKIES['client_email'],
                           'client_password_cookie': request.COOKIES['client_password']})


        else:
            return render(request, "client_login.html")


def client_logout(request):
    try:
        print("====INSIDE LOGOUT BEFORRRR")
        del request.session['client_email']
        del request.session['client_password']
        del request.session['client_id']
        print("====INSIDE LOGOUT BEFORRRR")

    except:
        pass
    return redirect("/client/c_login/")


def c_register(request):
    area_all_cli = area.objects.all()
    if request.method == "POST":
        print("||||||||||||||||||||||||||||||||||")
        form = CustForm(request.POST)
        print("-------------", form.errors)

        if form.is_valid():
            try:
                form.save()
                return redirect('/client/show_home/')
            except:
                print("---------------", sys.exc_info())
    else:
        form = CustForm()

    return render(request, 'c_register.html', {'form': form, 'area_all_cli': area_all_cli})


def c_forgotpass(request):
    return render(request, 'c_forgotpassword.html')


def c_sendotp(request):
    otp1 = random.randint(10000, 99999)
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
        return render(request, 'c_resetpassword.html')


def c_reset_password(request):
    if request.method == "POST":

        T_otp = request.POST['OTP']
        T_pass = request.POST['pass']
        T_cpass = request.POST['cpass']

        if T_pass == T_cpass:
            e = request.session['temail']

            val = customer.objects.filter(c_email=e, c_otp=T_otp, c_otp_used=0).count()

            if val == 1:
                customer.objects.filter(c_email=e).update(c_otp_used=1, c_password=T_pass)
                return redirect("/client/c_login/")
            else:
                messages.error(request, "Invalid OTP")
                return render(request, "c_forgotpassword.html")

        else:
            messages.error(request, "New password and Confirm password does not match ")
            return render(request, "c_forgotpassword.html")

    else:
        return redirect("/client/c_forgot/")


# ----------------Edit PROFILE----------------------------
def client_edit(request):
    if request.session.has_key('client_id'):
        print("===INSIDE IFFFFFFF")
        cid = request.session['client_id']
        c = customer.objects.get(c_id=cid)
        a = area.objects.all()
        return render(request, "c_profile.html", {'customer': c, 'area': a})


    else:
        return redirect("/client/c_login/")

    return render(request, "c_profile.html")


def client_update(request):
    if request.session.has_key('client_id'):
        cid = request.session['client_id']
        c = customer.objects.get(c_id=cid)
        a = area.objects.all()
        form = CustForm(request.POST, instance=c)
        print("-------------", form.errors)

        if form.is_valid():
            try:

                form.save()
                return redirect("/client/show_home/")
            except:
                print("-------------------", sys.exc_info())
        else:
            pass
        return render(request, "c_profile.html", {'customer': c, 'area': a})
    else:
        return redirect("/client/c_login/")
    return render(request, "c_profile.html")


# ---------------------------------

def load_menu(request):
    c = category.objects.all()
    s = sub_category.objects.all()
    return render(request, "test.html", {"cat": c, "sub": s})


def load_menu1(request):
    c = category.objects.all()
    s = sub_category.objects.all()
    return render(request, "test1.html", {"cat": c, "sub": s})


def shop(request, id):
    prod = product.objects.filter(sub_category_id=id)
    page = request.GET.get('page', 1)

    print("page ----------------", page)
    paginator = Paginator(prod, 5)

    try:
        pro = paginator.page(page)
    except PageNotAnInteger:
        pro = paginator.page(1)
    except EmptyPage:
        pro = paginator.page(paginator.num_pages)

    return render(request, "shop.html", {'pro': pro})


def pro_detail(request, id):
    pro = product.objects.get(product_id=id)
    feed = feedback.objects.filter(product_id=id)
    feed_count = feedback.objects.filter(product_id=id).count()
    rating = 0
    for data in feed:
        rating += data.rate
    count_rate = 0
    if feed_count > 0:
        count_rate = rating / feed_count
    print("=====================", count_rate)
    return render(request, 'product_detail.html',
                  {'pro': pro, 'feed': feed, 'feed_count': feed_count, 'count_rate': count_rate})


def insert_feedback(request):
    if request.method == "POST":
        try:
            description = request.POST['feedback_message']
            product_id = request.POST['product_id']
            c_id = request.session['client_id']
            fdate = date.today()
            rating = request.POST['rate']

            feed = feedback(c_id_id=c_id, product_id_id=product_id, feedback_message=description, feedback_date=fdate,
                            rate=rating)

            feed.save()
            return redirect("/client/pro_det/%s" % product_id)
        except:
            print("=========", sys.exc_info())
    else:
        pass
    return render(request, "product_detail.html")


def c_cart(request):
    if 'client_id' in request.session:
        user_id = request.session["client_id"]
        emp = cart.objects.filter(c_id=user_id)
        sum = 0
        for val in emp:
            sum = sum + (val.product_id.product_price * val.c_qty)
        return render(request, "cart.html", {'cart': emp, 'total': sum})
    else:
        z = cart.objects.all()
        # return render(request, "Cart.html", {"cart": z})
        c = client_Cart(request)
        total = c.get_total_price()
        print(total)
        # cart = client_Cart(request)
        # total = cart.get_total_price()
        # print(total)
        return render(request, "cart.html", {"cart": z, 'total': total})


def delete_c_cart(request, id):
    if 'client_id' in request.session:
        cart1 = cart.objects.get(cart_id=id)
        cart1.delete()
        return redirect("/client/cart/")
    else:
        c = client_Cart(request)
        p = product.objects.get(product_id=id)
        c.remove(p)
        return redirect("/client/cart/")


def clear_cart(request):
    if 'client_id' in request.session:
        c_id = request.session['client_id']
        c = cart.objects.filter(c_id=c_id)
        c.delete()
        return redirect("/client/cart/")
    else:
        c = client_Cart(request)
        c.clear()
        return redirect("/client/cart/")


def c_wishlist(request):
    emp = wishlist.objects.all()
    return render(request, "wishlist.html", {'wishlist': emp})


def insert_wishlist(request):
    try:
        d = date.today()
        id = request.POST.get("product_id")
        print("|||||", id)
        vid = request.session["client_id"]
        odject = wishlist(w_date=d, product_id_id=id, c_id_id=vid)
        odject.save()
        return redirect('/client/wishlist')
    except:
        print("-----------------", sys.exc_info())
        return render(request, "product_detail.html")


def delete_c_wishlist(request, id):
    cart1 = wishlist.objects.get(wishlist_id=id)
    cart1.delete()
    return redirect("/client/wishlist/")


def insert_cart(request, id):
    if "client_id" in request.session:
        if request.method == "POST":
            user_id = request.session["client_id"]
            c = cart.objects.filter(product_id_id=id,c_id_id=user_id).count()
            if c == 1:
                try:
                    c1 = cart.objects.get(product_id_id=id, c_id_id=user_id)
                    qty = request.POST["c_qty"]
                    c1.c_qty = c1.c_qty + int(qty)
                    c1.total_amt = int(c1.c_qty) * int(c1.product_id.product_price)
                    c1.save()
                    return redirect('/client/cart/')
                except:
                    print("-------", sys.exc_info())
            else:
                try:
                    products = product.objects.get(product_id=id)
                    product_price = products.product_price
                    user_id = request.session["client_id"]
                    d = date.today().strftime("%Y-%m-%d")
                    qty = request.POST["c_qty"]
                    total_amt = int(product_price) * int(qty)
                    prd_id = id
                    C = cart(product_id_id=prd_id, c_id_id=user_id, c_date=d, c_qty=qty, total_amt=total_amt)
                    C.save()
                    return redirect('/client/cart/')
                except:
                    print("-------", sys.exc_info())

        return render(request, "product_detail.html")
    else:
        print("inside cart function")
        try:
            qty = request.POST['c_qty']
            c = client_Cart(request)
            p = product.objects.get(product_id=id)
            print(p)
            c.add(product=p, quantity=int(qty))
            print(c)
            return redirect('/client/cart/')
        except:
            print("-------", sys.exc_info())
    return redirect("/client/c_login")


def update_quantity(request, id):
    qty = request.GET.get('qty')
    val = cart.objects.get(cart_id=id)
    new_qty = int(qty)
    total = new_qty * val.product_id.product_price
    val = cart.objects.filter(cart_id=id).update(c_qty=new_qty,total_amt=total)
    val.save()

def c_order(request):
    u = request.session['client_id']
    ord = order.objects.filter(c_id=u)
    for data in ord:
        print("====================", data.total_amount)
    return render(request, "c_order.html", {'orders': ord})


def c_orderitem(request, id):
    pro = product.objects.filter(product_id=id)
    ord = order_item.objects.filter(order_id=id)

    return render(request, 'c_orderitem.html',
                  {'orderitems': ord, 'pro': pro, 'ord': ord})


def checkout(request):
    u = request.session['client_id']
    c = customer.objects.get(c_id=u)
    ca = cart.objects.filter(c_id_id=u)
    sum = 0
    for val in ca:
        sum = sum + (val.product_id.product_price * val.c_qty)
    return render(request, "c_checkout.html", {'customer': c, 'total': sum, 'product': ca})


def place_order(request, total):
    if 'client_id' in request.session:
        pay = request.POST['payment_status']
        amt = total
        print(amt)
        uid = request.session['client_id']
        date1 = date.today().strftime("%Y-%m-%d")
        o = order(c_id_id=uid, total_amount=int(amt), order_date=date1, payment_status=pay, order_status=0)
        o.save()
        id = order.objects.latest('order_id')
        c = cart.objects.filter(c_id_id=uid)

        flag = 0
        for data in c:
            pid = data.product_id_id
            qty = data.c_qty
            pri = data.product_id.product_price
            print("=====\n\n\n\n\n", pri)
            total = int(qty) * pri
            print("========", total)
        od = order_item(order_id_id=id.order_id, product_id_id=pid, qty_id=qty, product_price=pri, total_amount=total)
        od.save()

        # c_delete = cart.objects.filter(c_id_id=uid)
        # c_delete.delete()
        return redirect("/client/c_order/")

    return render(request, "c_checkout.html")


def c_shelter(request):
    sh = shelter_home.objects.all()
    return render(request, "c_shelterhome.html", {'shelter': sh})


def autosuggest(request):
    if 'term' in request.GET:
        qs = product.objects.filter(product_name__istartswith=request.GET.get('term'))

        names = list()

        for x in qs:
            names.append(x.product_name)
        return JsonResponse(names, safe=False)
    return render(request, "client_header.html")


def search(request):
    if request.method == "POST":
        name = request.POST["product_name"]
        pro = product.objects.filter(product_name=name)

    else:
        pro = product.objects.all()

    return render(request, "shop.html", {"pro": pro})


#
# def cart_count(request):
#     print("=========",)
#     u = request.session['client_id']
#     cartt_count = cart.objects.filter(c_id_id=u).count()
#     if cartt_count == None:
#         cartt_count = 0
#     return render(request, "client_header.html", {'cart_count':cartt_count})

def c_doctor(request):
    u = request.session['client_id']
    do = doctor.objects.all()
    return render(request, "c_doctor.html", {'doctor': do})


def doctor_detail(request, id):
    doc = doctor.objects.filter(doctor_id=id)
    return render(request, "doctor_detail.html", {'doctor_detail': doc, 'doc': doc})


def c_appointment(request,id):
    if request.method == "POST":
        try:
            customer = request.session['client_id']
            dat = request.POST.get('appointment_date')
            tim = request.POST['appointment_time']
            book = appointment(c_id_id=customer, doctor_id_id=id, appointment_date=dat, appointment_time=tim,
                               appointment_status=0)
            book.save()
            return redirect("/client/appoint_detail/")
        except:
            print("---------------", sys.exc_info())
    return render(request, "c_appointment.html",{'doc':id})



def all_appointment(request):
    app = appointment.objects.all()
    return render(request, "all_appointment.html", {'all_appoint': app})

def about_us(request):
    return render(request, "about_us.html")

def contact_us(request):
    return render(request, "contact_us.html")

def sucess_pay(request,id):
    o =order.objects.get(order_id=id)
    o.payment_status = 3
    o.save()
    return render(request, "sucessfullpayment.html",)

def fail_pay(request, id):
    o = order.objects.get(order_id=id)
    o.payment_status = 3
    o.save()
    return render(request, "failedpayment.html")

def c_gallery(request):
    gal = gallery.objects.all()
    return  render(request, "c_gallery.html",{'gallerys': gal})




