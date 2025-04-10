"""
The modules are necessary to handle the request and redirect correctly
"""
from django.urls import path
from . import views
urlpatterns = [
    path('', views.handle_login, name='handle_login'),
    path('signup/', views.singup, name='singup'),
    path('handle_signup/', views.handle_singup, name='handle_singup'),
    path('stock/<int:userid>/', views.stock_view, name='stock_view'),
    path('update/<int:userid>/<int:pid>/', views.update_stock, name='update_stock'),
    path('delete/<int:userid>/<int:pid>/', views.delete_user, name='delete_user'),
    ################ admin ###############
     path('home/<int:userid>/', views.home, name='home'),
    path('home/<int:userid>/<str:category_name>/', views.home, name='home_by_category'),
    path('update/<int:userid>/', views.update_cus, name='update_cus'),
    path('cart/<int:item_id>/<int:userid>/', views.add_to_cart, name='add_to_cart'),
    path('showcart/<int:userid>/', views.orders, name='orders'),
    path('checkout/<int:userid>/', views.checkout, name='checkout'),
    path('orders/<int:userid>/', views.orderss, name='orderss'),
    ########################## user #######################
    path("send_otp/", views.otp, name="send_otp"),
    path("verify_otp_and_reset_password/", views.verify_otp_and_reset_password,
          name="verify_otp_and_reset_password"),
    path('cart/dec_quantity/<int:cartid>/', views.decrese_quantity, name='decrese_quantity'),
    path('cart/increase_quantity/<int:cartid>/', views.increse_quantity, name='increase_quantity'),
    path('logout/', views.logout, name='logout'),
]
