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
