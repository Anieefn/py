"""
This script is used for sending SMS notifications to users using the Twilio API.
It contains functionality for sending a password reset confirmation message
to a specified phone number.

The main components:
- `settings`: Used to retrieve Twilio
 configuration details (account SID, 
 auth token, and phone number).
- `send_sms`: Defines the logic for composing and sending SMS messages.
- Handles errors gracefully, ensuring that database integrity issues (if any) are captured.
"""
from django.conf import settings
from django.db import IntegrityError
from twilio.rest import Client

def send_sms(to, username):
    """
    Sends an SMS to the specified phone number.
    The message can be customized when calling the function.
    """
    try:
        message = f"""Hello,
          {username} your password has been
         reset successfully, please login again."""
        client = Client(settings.TWILIO_ACCOUNT_SID, settings.TWILIO_AUTH_TOKEN)
        client.messages.create(
            to=to,
            from_=settings.TWILIO_PHONE_NUMBER,
            body=message
        )
        print(f"SMS successfully sent to {to}.")
    except IntegrityError as e:
        print(f"Failed to send SMS to {to}: {e}")
