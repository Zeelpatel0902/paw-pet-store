"""happypawpetstore URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include,re_path
# from django.conf.urls import url
from happypawpetstore_Admin.views import HomeView, ProjectChart

from happypawpetstore_Admin import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('show_user/', views.show),
    path('show_name/', views.show),
    path('insert/', views.insert_user),
    path('show_f/', views.show_shelter),
    path('show_d/<int:id>', views.destory),
    path('insert_shelter/', views.insert_shelter),
    path('show_do/', views.show_doctor),
    path('show_dd/<int:id>', views.destory_doctor),
    path('insert_do/', views.insert_doctor),
    path('show_cat/', views.show_category),
    path('show_dcat/<int:id>', views.destory_category),
    path('insert_cat/', views.insert_category),
    path('show_subcat/', views.show_subcategory),
    path('show_dsubcat/<int:id>', views.destory_subcategory),
    path('insert_subcat/', views.insert_subcategory),
    path('show_pro/', views.show_product),
    path('show_dpro/<int:id>', views.destory_product),
    path('insert_pro/', views.insert_product),
    path('cart_table/', views.cart_table),
    path('delete_cart/<int:id>', views.delete_cart),
    path('wish_table/', views.wishlist_table),
    path('delete_wish/<int:id>', views.delete_wishlist),
    path('show_ord/', views.show_order),
    path('show_dorder/<int:id>', views.destory_order),
    path('insert_order/', views.insert_order),
    path('show_item/', views.show_order_item),
    path('show_ditem/<int:id>', views.destory_order_item),
    path('insert_item/', views.insert_orderitem),
    path('show_gal/', views.show_gallery),
    path('show_dgal/<int:id>', views.destory_gallery),
    path('insert_gal/', views.insert_gallery),
    path('show_feed/', views.show_feedback),
    path('show_dfeed/<int:id>', views.destory_feedback),
    path('insert_feed/', views.insert_feedback),
    path('show_app/', views.show_appointment),
    path('show_dapp/<int:id>', views.destory_appointment),
    path('insert_app/', views.insert_appointment),
    path('show_are/', views.show_area),
    path('show_darea/<int:id>', views.destory_area),
    path('insert_are/', views.insert_area),
    # ---------update & select--------#
    path('select_shelter/<int:id>', views.select_shelter),
    path('update_shelter/<int:id>', views.update_shelter),
    path('select_feedback/<int:id>', views.select_feedback),
    path('update_feedback/<int:id>', views.update_feedback),
    path('select_doctor/<int:id>', views.select_doctor),
    path('update_doctor/<int:id>', views.update_doctor),
    path('select_category/<int:id>', views.select_category),
    path('update_category/<int:id>', views.update_category),
    path('select_subcategory/<int:id>', views.select_subcategory),
    path('update_subcategory/<int:id>', views.update_subcategory),
    path('select_product/<int:id>', views.select_product),
    path('update_product/<int:id>', views.update_product),
    path('select_order/<int:id>', views.select_order),
    path('update_order/<int:id>', views.update_order),
    path('select_orderitem/<int:id>', views.select_orderitem),
    path('update_orderitem/<int:id>', views.update_orderitem),
    path('select_gal/<int:id>', views.select_gallery),
    path('update_gal/<int:id>', views.update_gallery),
    path('select_app/<int:id>', views.select_appointment),
    path('update_app/<int:id>', views.update_appointment),
    path('select_area/<int:id>', views.select_area),
    path('update_area/<int:id>', views.update_area),
    # ---------Login & Forgot Password-----
    path('login/', views.login),
    path('logout/', views.admin_logout),
    path('forgotpassword/', views.forgotpassword),
    path('send_otp/', views.sendotp),
    path('reset/', views.reset_password),
    # path('edit_profile/',views.show_editprofile),
    path('select_edit/', views.admin_edit),
    path('update_edit/', views.admin_update),
    path('admin_dash/', views.show_admindashboard),
    # --------------DashBoard---------
    re_path(r'charthome', HomeView.as_view(), name='home'),
    re_path(r'^api/chart/data/$', ProjectChart.as_view(), name="api-data"),
    # ------------------------------------
    path('accept/<int:id>', views.accept_order),
    path('reject/<int:id>', views.reject_order),
    path('accept_app/<int:id>', views.accept_appointment),
    path('reject_app/<int:id>', views.reject_appointment),
    path('accept_pay/<int:id>', views.accept_payment),
    path('reject_pay/<int:id>', views.reject_payment),

    # ---------client------------
    path('client/', include('happypawpetstore_Client.client_urls')),
]
