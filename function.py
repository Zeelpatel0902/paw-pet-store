def handle_upload_file(f):
    with open('happypawpetstore_Admin/static/assets/img/'+f.name, 'wb+') as destination:
        for chunk in f.chunks():
            destination.write(chunk)