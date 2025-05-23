"""
This module defines the app configuration 
for the Delivery application.
"""
from django.apps import AppConfig

class DeliveryConfig(AppConfig):
    """
    Configuration class for the 'delivery' application.

    This class defines application-specific settings, such as the default auto field
    used for primary keys and the name of the application. It inherits from Django's
    AppConfig base class and is used to configure the 'delivery' app within the project.
    """
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'delivery'
