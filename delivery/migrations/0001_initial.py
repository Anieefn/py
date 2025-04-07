"""
This migration sets up the initial database schema for the delivery application. It defines
models for managing users (Register), posts (Posts), shopping carts (Cart and CartItem),
and a one-time password (Otp) system for authentication. These models establish the core 
structure of the application, including relationships between users, posts, and cart items.
"""

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):
    """
    This Migration class contains operations to create initial database tables for the
    Register, Posts, Cart, CartItem, and Otp models, along with their relationships.
    """
    initial = True

    dependencies = []

    operations = [
        migrations.CreateModel(
            name='Cart',
            fields=[
                ('id', models.BigAutoField(
                    auto_created=True,
                    primary_key=True,
                    serialize=False,
                    verbose_name='ID'
                )),
            ],
        ),
        migrations.CreateModel(
            name='Posts',
            fields=[
                ('id', models.BigAutoField(
                    auto_created=True,
                    primary_key=True,
                    serialize=False,
                    verbose_name='ID'
                )),
                ('name', models.CharField(max_length=100)),
                ('bio', models.CharField(max_length=2000)),
                ('picture', models.URLField(max_length=10000)),
                ('price', models.FloatField()),
                ('catagery', models.CharField(default='shirts', max_length=13)),
                ('discount', models.IntegerField()),
                ('discount_price', models.FloatField(blank=True, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='CartItem',
            fields=[
                ('id', models.BigAutoField(
                    auto_created=True,
                    primary_key=True,
                    serialize=False,
                    verbose_name='ID'
                )),
                ('quantity', models.PositiveIntegerField(default=1)),
                ('cart', models.ForeignKey(
                    on_delete=django.db.models.deletion.CASCADE,
                    related_name='cart_items',
                    to='delivery.cart'
                )),
                ('item', models.ForeignKey(
                    on_delete=django.db.models.deletion.CASCADE,
                    to='delivery.posts'
                )),
            ],
        ),
        migrations.CreateModel(
            name='Register',
            fields=[
                ('id', models.BigAutoField(
                    auto_created=True,
                    primary_key=True,
                    serialize=False,
                    verbose_name='ID'
                )),
                ('username', models.CharField(max_length=90)),
                ('password', models.CharField(max_length=400)),
                ('email', models.CharField(max_length=250, unique=True)),
                ('address', models.CharField(max_length=1500)),
                ('phonenumber', models.CharField(max_length=14, unique=True)),
                ('role', models.CharField(default='customer', max_length=9)),
                ('saved_posts', models.ManyToManyField(
                    blank=True,
                    related_name='saved_users',
                    to='delivery.posts'
                )),
            ],
        ),
        migrations.AddField(
            model_name='posts',
            name='userId',
            field=models.ForeignKey(
                on_delete=django.db.models.deletion.CASCADE,
                to='delivery.register'
            ),
        ),
        migrations.CreateModel(
            name='Otp',
            fields=[
                ('id', models.BigAutoField(
                    auto_created=True,
                    primary_key=True,
                    serialize=False,
                    verbose_name='ID'
                )),
                ('otp', models.CharField(max_length=6)),
                ('otp_created_at', models.DateTimeField(auto_now_add=True)),
                ('user', models.ForeignKey(
                    on_delete=django.db.models.deletion.CASCADE,
                    related_name='otp',
                    to='delivery.register'
                )),
            ],
        ),
        migrations.AddField(
            model_name='cart',
            name='customer',
            field=models.ForeignKey(
                on_delete=django.db.models.deletion.CASCADE,
                related_name='cart',
                to='delivery.register'
            ),
        ),
    ]
