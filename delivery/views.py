"""
The modules are necessary to to haspassowrd and create the object
"""

import random  # Standard library import

# Third-party imports
import razorpay
from django.http import HttpResponse
from django.conf import settings
from django.contrib.auth.hashers import make_password, check_password
from django.core.mail import send_mail
from django.db import IntegrityError
from django.shortcuts import get_object_or_404, render, redirect
from django.utils.timezone import now
from django.contrib.sessions.models import Session

# Local application imports
from delivery.sms_conform import send_sms
from delivery.security_token import generate_token
from .models import Register, Posts, Cart, Otp, CartItem, security_toke

# Create your views here.
# token local variable
Check_token = ""
Token_user_id = ""
# Login page
def handle_login(request):
    """
    Handles user login by validating credentials
    and redirecting users based on their roles.
    """
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        try:
            user = Register.objects.get(username=username)# pylint: disable=no-member
            if check_password(password, user.password):
                if user.role == "customer":
                    global Check_token
                    global Token_user_id
                    Check_token = generate_token()
                    cus = get_object_or_404(Register, username = username)
                    t = security_toke(userid = cus,token = Check_token)
                    t.save()
                    Token_user_id = cus.id
                    print(f"secure token {Token_user_id}")
                    print(type(Token_user_id))
                    return redirect('home', userid=user.id)
                else:
                    Check_token = generate_token()
                    cus = get_object_or_404(Register, username = username)
                    t = security_toke(userid = cus,token = Check_token)
                    t.save()
                    Token_user_id = user.id
                    return redirect('stock_view', userid=user.id)
            else:
                error_message = "Invalid username or password"
                return render(request, 'delivery/login.html', {"error_message": error_message})
        except Register.DoesNotExist: # pylint: disable=no-member
            error_message = "User does not exist"
            return render(request, 'delivery/login.html', {"error_message": error_message})
    return render(request, 'delivery/login.html')


def singup(request):
    """
    Renders the signup page for new users.
    """
    return render(request, 'delivery/singup.html')


# Signup
def handle_singup(request):
    """
    Handles user signup by creating a new user in the database.
    Validates for duplicate email or phone number.
    """
    try:
        if request.method == 'POST':
            username = request.POST.get('username')
            password = request.POST.get('password')
            email = request.POST.get('email')
            address = request.POST.get('address')
            phonenumber = request.POST.get('phonenumber')
            role = request.POST.get('role')
            if (
    			Register.objects.filter(email=email).exists() # pylint: disable=no-member
    			or Register.objects.filter(phonenumber=phonenumber).exists()): # pylint: disable=no-member
                error_message = "Email or phone number already exists"
                return render(request, 'delivery/singup.html', {"error_message": error_message})
            hashed_password = make_password(password)
            reg = Register(username=username, password=hashed_password,
             email=email, address=address,
            phonenumber=phonenumber, role=role)
            reg.save()
            return render(request, 'delivery/login.html')
    except IntegrityError:
        error_message = "An unexpected error occurred. Please try again."
        return render(request, 'delivery/singup.html', {"error_message": error_message})
    return render(request, 'delivery/singup.html')


# View the stock of a specific user
def stock_view(request, userid):
    """
    Displays the stock items of a specific user.
    Allows users to add new stock items.
    """
    try:
        a = security_toke.objects.filter(userid = Token_user_id).first()
        if not a or not (a.token == Check_token and len(a.token) == 10):
            security_toke.objects.filter(userid=Token_user_id).all().delete() # pylint: disable=no-member
            return redirect('handle_login')
        else:
            p = get_object_or_404(Register, id=userid)
            error_message = None
            if request.method == 'POST':
                try:
                    name = request.POST.get('name')
                    bio = request.POST.get('bio')
                    picture = request.POST.get('picture')
                    price = request.POST.get('price')
                    discount = request.POST.get('discount')
                    catagery = request.POST.get('catagery')
                    discount_price = int(price) - (int(price) * int(discount) / 100)
                    post = Posts(name=name,
                                  bio=bio,
                                  picture=picture,
                                 price=price,
                                 discount=discount,
                                catagery=catagery,
                                discount_price=discount_price,
                                userId=p)
                    post.save()
                except IntegrityError:
                    error_message = "Please check the image URL"
                    return render(request,'delivery/store.html',{'p': p, "error_message": error_message}) # pylint: disable=line-too-long
            post = Posts.objects.filter(userId=p) # pylint: disable=no-member
            if len(post) == 0:
                error_message = (
                "No post available"  # Break long strings if necessary
            )
            return render(request,
        'delivery/store.html',
            {'post': post, 'p': p,
            "error_message": error_message})
    except:
        return HttpResponse("An error occurred", status=500)

# Update stock individually
def update_stock(request, userid, pid):
    """
    Updates a specific stock item for a user.
    Handles validation of updated data.
    """
    try:
        a = security_toke.objects.filter(userid = Token_user_id).first() # pylint: disable=no-member
        if not a or not (a.token == Check_token and len(a.token) == 10):
            security_toke.objects.filter(userid=Token_user_id).all().delete() # pylint: disable=no-member
            return redirect('handle_login')
        else:
            p = get_object_or_404(Register, id=userid)
            u = get_object_or_404(Posts, id=pid, userId=p)
            if request.method == 'POST':
                try:
                    u.name = request.POST.get('name')
                    u.bio = request.POST.get('bio')
                    u.picture = request.POST.get('picture')
                    u.price = request.POST.get('price')
                    u.discount = request.POST.get('discount')
                    u.catagery = request.POST.get('catagery')
                    u.discount_price = float(u.price) - (float(u.price) * float(u.discount) / 100)
                    u.save()
                    return redirect('stock_view', userid=p.id)
                except IntegrityError:
                    error_message = "Invalid url "
                    return render(request,
                    'delivery/update_stock.html',
                    {'u': u, 'p': p,
                    "error_message": error_message})
            post = Posts.objects.filter(id=pid).filter()  # pylint: disable=no-member
            return render(request, 'delivery/update_stock.html', {'u': u, 'p': p, 'post':post})
    except:
        return HttpResponse("An error occurred", status=500)


# Delete post
def delete_user(request, pid, userid):
    """
    Deletes a specific stock item from a user's stock."""
    try:
        a = security_toke.objects.filter(userid = Token_user_id).first() # pylint: disable=no-member
        if not a or not (a.token == Check_token and len(a.token) == 10):
            security_toke.objects.filter(userid=Token_user_id).all().delete() # pylint: disable=no-member
            return redirect('handle_login')
        else:
            p = get_object_or_404(Register, id=userid)
            u = get_object_or_404(Posts, id=pid, userId=p)
            if (request.method
            == 'POST'):
                u.delete()
                return redirect('stock_view', userid=p.id)
            return render(request, 'delivery/delete_confirm.html', {'p': p, 'u': u})
    except:
        return HttpResponse("An error occurred", status=500)

def home(request, userid, category_name=None):
    """
    Displays the home page with posts based on the selected category.
    If no category is selected, it displays all posts.
    """
    try:
        a = security_toke.objects.filter(userid = Token_user_id).first() # pylint: disable=no-member
        if not a or not (a.token == Check_token and len(a.token) == 10):
            security_toke.objects.filter(userid=Token_user_id).all().delete() # pylint: disable=no-member
            return redirect('handle_login')
        else:
            if category_name:
                post = Posts.objects.filter(catagery=category_name) # pylint: disable=no-member
                print(f"The security token is {Check_token}")
            else:
                post=Posts.objects.all() # pylint: disable=no-member
                print(f"The security token is {Check_token}")
            u = Register.objects.filter(id=userid).first() # pylint: disable=no-member
            c = Posts.objects.values_list('catagery', flat=True).distinct() # pylint: disable=no-member
            return render(request,
            'delivery/home.html',
            {'post': post,
            'u': u, 
            'c': c, 
            'category_name': category_name})
    except:
        return HttpResponse("An error occurred", status=500)


def update_cus(request, userid):
    """
    Updates customer details for a specific user.
    """
    print(f"The security token is {Check_token}")
    try:
        a = security_toke.objects.filter(userid = Token_user_id).first()# pylint: disable=no-member
        if not a or not (a.token == Check_token and len(a.token) == 10):
            security_toke.objects.filter(userid=Token_user_id).all().delete()# pylint: disable=no-member
            return redirect('handle_login')
        else:
            u = get_object_or_404(Register, id=userid)
            p = Register.objects.filter(id=userid).first() # pylint: disable=no-member
            if request.method == 'POST':
                try:
                    u.username = request.POST.get('username')
                    u.email = request.POST.get('email')
                    u.address = request.POST.get('address')
                    u.phonenumber = request.POST.get('phonenumber')
                    u.save()
                    return redirect('home', p.id)
                except IntegrityError as e:
                    print(e)
            details = Register.objects.filter(id=userid).filter() # pylint: disable=no-member
            return render(request, 'delivery/update_cus.html', {"details": details})
    except:
        return HttpResponse("An error occurred", status=500)


def add_to_cart(request, item_id, userid):
    """
    Adds an item to the user's cart with the given quantity.
    If the item is already in the cart, updates the quantity.
    """
    try:
        a = security_toke.objects.filter(userid = Token_user_id).first() # pylint: disable=no-member
        if not a or not (a.token == Check_token and len(a.token) == 10):
            security_toke.objects.filter(userid=Token_user_id).all().delete()# pylint: disable=no-member
            return redirect('handle_login')
        else:
            try:
                customer = get_object_or_404(Register, id=userid)
                item = get_object_or_404(Posts, id=item_id)
                quantity = int(request.POST.get('quantity', 1))
                print(customer)
                print(item)
                cart, _ = Cart.objects.get_or_create(customer=customer) # pylint: disable=no-member
                cart_item, created = CartItem.objects.get_or_create(cart=cart, item=item)# pylint: disable=no-member
                if not created:
                    cart_item.quantity += quantity
                else:
                    cart_item.quantity = quantity
                cart_item.save()
                print(f"The security token is {Check_token}")
                return redirect('home', userid=customer.id)
            except IntegrityError as e:
                print(e)
                return redirect('home', userid=customer.id)
    except:
        return HttpResponse("An error occurred", status=500)

def orders(request, userid):
    """
    Displays the user's cart, showing the items, their quantities, and the total price.
    """
    try:
        a = security_toke.objects.filter(userid = Token_user_id).first() # pylint: disable=no-member
        if not a or not (a.token == Check_token and len(a.token) == 10):
            security_toke.objects.filter(userid=Token_user_id).all().delete()# pylint: disable=no-member
            return redirect('handle_login')
        else:
            p = get_object_or_404(Register, id=userid)
            o = Cart.objects.filter(customer=p).first() # pylint: disable=no-member
            cart_items = o.cart_items.all() if o else []
            total_price = sum(cart_item.total_price() for cart_item in cart_items)
            quantity_range = range(1, 11)
            return render(request, 'delivery/cart.html', {
                'item': cart_items,
                'total_price': total_price,
                'p': p,
                'quantity_range': quantity_range,
                'userid': userid
            })
    except:
        return HttpResponse("An error occurred", status=500)


def checkout(request, userid):
    """
    Handles the checkout process, integrating with Razorpay for payment.
    Displays an error if the cart is empty or an issue occurs.
    """
    try:
        a = security_toke.objects.filter(userid = Token_user_id).first()# pylint: disable=no-member
        if not a or not (a.token == Check_token and len(a.token) == 10):
            security_toke.objects.filter(userid=Token_user_id).all().delete()# pylint: disable=no-member
            return redirect('handle_login')
        else:
            p = get_object_or_404(Register, id=userid)
            cart = Cart.objects.filter(customer=p).first() # pylint: disable=no-member
            cart_items = cart.cart_items.all() if cart else []
            total_price = cart.total_price() if cart else 0 # pylint: disable=line-too-long
            if total_price == 0:
                return render(request, 'delivery/checkout.html', {'error': 'Your cart is empty!'})

            try:
                # Initialize Razorpay client
                client = razorpay.Client(auth=(settings.RAZORPAY_KEY_ID,
                 settings.RAZORPAY_KEY_SECRET))
                # Create an order on Razorpay
                order_data = {
                    'amount': int(total_price * 100),
                    'currency': 'INR',
                'payment_capture': '1',
                }
                order = client.order.create(data=order_data)# pylint: disable=no-member
            except IntegrityError as e:
                print(e)
                return render(request,
                'delivery/checkout.html',
                {'error': f"""Error
                creating order: {str(e)}"""})

            return render(request, 'delivery/checkout.html', {
                'p': p,
                'cart_items': cart_items,
                'total_price': total_price,
                'razorpay_key_id': settings.RAZORPAY_KEY_ID,
                'order_id': order['id'],
                'amount': total_price,
            })
    except:
        return HttpResponse("An error occurred", status=500)


def orderss(request, userid):
    """
    Processes the user's order, sends an email confirmation,
    and clears the cart.
    """
    try:
        a = security_toke.objects.filter(userid = Token_user_id).first() # pylint: disable=no-member
        if not a or not (a.token == Check_token and len(a.token) == 10):
            security_toke.objects.filter(userid=Token_user_id).all().delete() # pylint: disable=no-member
            return redirect('handle_login')
        else:
            p = get_object_or_404(Register, id=userid)
            cart = Cart.objects.filter(customer=p).first() # pylint: disable=no-member
            if cart:
                cart_items = cart.cart_items.all()
                total_price = cart.total_price()
                # Send email confirmation
                subject = "🎉 Your Order is Confirmed! Here's the Summary 📦"
                message = f"""
                Hi {p.username},

                Thank you for shopping with us! 🛍️ We're thrilled to have you as our valued customer. Here's a quick overview of your order:

                📝 **Order Details**:
                {''.join([f"- {item.item.name} x {item.quantity}\n" for item in cart_items])}

                💰 **Total Amount**: ₹{total_price:.2f}

                ✨ Your order is now being prepared and will be on its way to you soon! Keep an eye on your inbox for updates about delivery.  

                If you have any questions, feel free to reply to this email, and we'll be happy to assist.  

                Thanks again for choosing us – we can't wait for you to enjoy your purchase!  

                Warm regards,  
                **N's store**  
                """

                recipient = p.email

                send_mail(
                    subject, message, 'anieefn@gmail.com', [recipient], fail_silently=False,
                )

                # Clear the cart
                cart.cart_items.all().delete()

            return render(request, 'delivery/orders.html', {
                'p': p,
                'cart_items': cart_items,
                'total_price': total_price,
            })
    except Exception:
        return HttpResponse("An error occurred", status=500)

def otp(request):
    """
    Sends a One-Time Password (OTP) to the user's registered email for password reset.
    Validates the email and creates or updates an OTP object associated with the user.
    """
    if request.method == 'POST':
        email = request.POST.get('email')
        try:
            user = Register.objects.get(email=email)# pylint: disable=no-member
            otp = str(random.randint(100000, 999999))
            _, _ = Otp.objects.update_or_create( # pylint: disable=no-member
                user=user,
                defaults={'otp': otp, 'otp_created_at': now()}
            ) # pylint: disable=no-member
            subject = "Your OTP for Password Reset"
            message = f"""Hello {user.username},
            \n\nYour OTP for password reset is:{otp}.
            \n\nThis OTP is valid for 3 minutes."""
            from_email = "anieefn@gmail.com"
            recipient = user.email
            send_mail(subject, message, from_email, [recipient], fail_silently=False)
            return render(request, 'delivery/enter_otp.html', {"user_id": user.id, "email": email})
        except IntegrityError as e:
            print(e)
            return render(request,
            "delivery/send_otp.html",
            {"error": "Email not registered."})
    return render(request, "delivery/send_otp.html")


def verify_otp_and_reset_password(request):
    """
    Verifies the OTP entered by the user and resets their password if the OTP is valid.
    Updates the user's password and deletes the OTP object for security.
    """
    if request.method == "POST":
        user_id = request.POST.get("user_id")
        otp = request.POST.get("otp")
        new_password = request.POST.get("new_password")

        user = Register.objects.get(id=user_id) # pylint: disable=no-member
        otp_obj = Otp.objects.filter(user=user).first() # pylint: disable=no-member
        if otp_obj and otp_obj.otp == otp:
            if otp_obj.is_otp_vaild():
                # Update the user's password
                user.password = make_password(new_password)
                user.save()
                # Delete the OTP object for security
                otp_obj.delete()
                send_sms(user.phonenumber, user.username)
                return render(request,
                 "delivery/login.html",
                 {"success":
                 """Password updated
                 successfully. Please log in."""})
        else:
            return render(request,
            "delivery/enter_otp.html", 
            {"user_id": user.id,
             "email": user.email,
             "error": "Invalid OTP or otp may expried."})
    return redirect("send_otp")

def increse_quantity(request, cartid):
    """
    Increases the quantity of an item in the user's cart.
    Redirects the user back to the orders page after updating.
    """
    if request.method == 'POST':
        p = get_object_or_404(CartItem, id=cartid)
        p.quantity += 1
        p.save()
        return redirect('orders', userid=p.cart.customer.id)
    return redirect('orders', userid=p.cart.customer.id)


def decrese_quantity(request, cartid):
    """
    Decreases the quantity of an item in the user's cart.
    If the quantity is greater than 1, it decrements the quantity.
    If the quantity is 1, it deletes the item from the cart.
    """
    if request.method == 'POST':
        p = get_object_or_404(CartItem, id=cartid)
        if p.quantity > 1:
            p.quantity -= 1
            p.save()
        else:
            p.delete()
        return redirect('orders', userid=p.cart.customer.id)
    return redirect('orders', userid=p.cart.customer.id)

def logout(request):
    """
    Logout view to delete all active sessions and redirect to the login page.
    This view deletes all session objects, effectively logging out all users.
    It then redirects the client to the login page.
    """
    security_toke.objects.filter(userid=Token_user_id).all().delete() # pylint: disable=no-member
    # Delete all session objects
    Session.objects.all().delete()

    # Redirect to the login page
    return redirect('handle_login')  # Replace 'login' with the name of your login URL pattern
