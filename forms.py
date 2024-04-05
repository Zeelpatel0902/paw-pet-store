from django import forms
from happypawpetstore_Admin.models import customer, order, shelter_home, doctor, category, sub_category, product, order_item, \
    gallery, feedback, appointment, area, cart


class CustForm(forms.ModelForm):
    class Meta:
        model = customer
        fields = ["c_name","c_email","c_contact","c_address","c_password","is_admin","area_id"]


class orderform(forms.ModelForm):
    class Meta:
        model = order
        fields = ["c_id", "total_amount", "order_status", "payment_status","order_date"]

class shelterform(forms.ModelForm):
    shelter_image=forms.FileField()
    class Meta:
        model = shelter_home
        fields = ["shelter_name","owner_name","shelter_email","shelter_password","shelter_address","shelter_contact","shelter_image", "shelter_location"]

class doctorform(forms.ModelForm):
    doctor_image = forms.FileField()
    class Meta:
        model = doctor
        fields = ["doctor_name","doctor_email","doctor_password","doctor_contact","doctor_address","doctor_image"]

class categoryform(forms.ModelForm):
    class Meta:
        model = category
        fields = ["category_name","category_descripation"]

class subcategoryform(forms.ModelForm):
    class Meta:
        model = sub_category
        fields = ["category_id","sub_category_name","sub_category_descripation"]


class productform(forms.ModelForm):
    product_image=forms.FileField()
    class Meta:
        model = product
        fields = ["sub_category_id","product_name","product_description","product_price","product_quantity","product_image"]

class cartform(forms.ModelForm):
    class Meta:
        model = cart
        fields = ["product_id", "c_id", "c_date", "c_qty", "total_amt"]


class orderitemform(forms.ModelForm):
    class Meta:
        model = order_item
        fields = ["order_id","product_id","qty_id","product_price","total_amount"]

class galleryform(forms.ModelForm):
    image_path = forms.FileField()
    class Meta:
        model = gallery
        fields = ["image_path","product_id"]

class feedbackform(forms.ModelForm):
    class Meta:
        model = feedback
        fields = ["c_id","product_id","feedback_message","feedback_date"]

class appointmentform(forms.ModelForm):
    class Meta:
        model = appointment
        fields = ["c_id","doctor_id","appointment_time","appointment_date","appointment_status"]

class areaform(forms.ModelForm):
    class Meta:
        model = area
        fields = ["area_name"]
