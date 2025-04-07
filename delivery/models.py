"""
The modules are necessary to handle data and registration
"""
from datetime import timedelta  # Standard library import
from django.db import models  # Third-party imports
from django.utils.timezone import now


class Register(models.Model):
    """
    Model representing a registered user in the system.
    """
    username = models.CharField(max_length=90)
    password = models.CharField(max_length=400)
    email = models.CharField(max_length=250, unique=True)
    address = models.CharField(max_length=1500)
    phonenumber = models.CharField(max_length=14, unique=True)
    role = models.CharField(max_length=9, default='customer')
    saved_posts = models.ManyToManyField("Posts", related_name="saved_users", blank=True)

    def __str__(self):
        """
        Returns the string representation of the Register object.
        """
        return f"User: {self.username}, ID: {self.id}" # pylint: disable=no-member
     # Corrected to return a meaningful string


class Posts(models.Model):
    """
    Model representing a post created by a user.
    """
    userId = models.ForeignKey(Register, on_delete=models.CASCADE)
    name = models.CharField(max_length=100)
    bio = models.CharField(max_length=2000)
    picture = models.URLField(max_length=10000)
    price = models.FloatField()
    catagery = models.CharField(max_length=13, default='shirts')
    discount = models.IntegerField()
    discount_price = models.FloatField(null=True, blank=True)

    def __str__(self):
        """
        Returns the string representation of the Posts object.
        """
        return f"name: {self.name}"


class CartItem(models.Model):
    """
    Model representing an item in a user's cart.
    """
    cart = models.ForeignKey('Cart', on_delete=models.CASCADE, related_name='cart_items')
    item = models.ForeignKey(Posts, on_delete=models.CASCADE)
    quantity = models.PositiveIntegerField(default=1)

    def total_price(self):
        """
        Calculates the total price for the CartItem object based on the quantity.
        """
        # Suppress warning for dynamic field
        # pylint: disable=no-member
        return self.item.discount_price * self.quantity


class Cart(models.Model):
    """
    Model representing a cart belonging to a user.
    """
    customer = models.ForeignKey(Register, on_delete=models.CASCADE, related_name="cart")

    def total_price(self):
        """
        Calculates the total price of all items in the cart.
        """
        # Suppress warning for dynamic field
        # pylint: disable=no-member
        return sum(cart_item.total_price() for cart_item in self.cart_items.all())


class Otp(models.Model):
    """
    Model representing the OTP for password reset.
    """
    user = models.ForeignKey(Register, on_delete=models.CASCADE, related_name='otp')
    otp = models.CharField(max_length=6)
    otp_created_at = models.DateTimeField(auto_now_add=True)

    def is_otp_vaild(self):
        """
        Validates whether the OTP is still valid based on the creation timestamp.
        """
        return now() <= self.otp_created_at + timedelta(minutes=3)


# Added a blank newline to satisfy Pylint
