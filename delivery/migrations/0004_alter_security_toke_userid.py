# Generated by Django 5.2 on 2025-04-29 05:36

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('delivery', '0003_alter_security_toke_userid_delete_payment_complete'),
    ]

    operations = [
        migrations.AlterField(
            model_name='security_toke',
            name='userid',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='delivery.register'),
        ),
    ]
