"""
The modules are necessary to perform unit testing for the application's views and models.
This script contains test cases for verifying the login functionality.
"""

from django.test import TestCase
from django.urls import reverse
from .models import Register

# Create your tests here.
class TestView(TestCase):
    """
    TestView class contains unit tests for testing the login functionality.
    """

    def setUp(self):
        """
        setUp method initializes the test environment by creating a sample user
        in the database that will be used for login tests.
        """
        self.user = Register.objects.create( # pylint: disable=no-member
            username='testuser',
            password='password123',
            role='customer'
        )

    def test_login_sucessfull(self):
        """
        Test successful login:
        This test verifies that a user can log in with correct credentials.
        It checks if the response status code is 200 and the correct template is rendered.
        """
        response = self.client.post(reverse('handle_login'), {
            'username': 'testuser',
            'password': 'password123'
        }, follow=True)
        self.assertEqual(response.status_code, 200)
        self.assertTemplateUsed(response, 'delivery/login.html')

    def test_login_fail_password(self):
        """
        Test login failure due to incorrect password:
        This test checks if the login fails when an incorrect password is provided.
        It verifies that the response contains an error message for invalid credentials.
        """
        response = self.client.post(reverse('handle_login'), {
            'username': 'testuser',
            'password': 'password'
        }, follow=True)
        self.assertEqual(response.status_code, 200)
        self.assertIn("Invalid username or password", str(response.content))

    def test_login_fail_user_does_not_exist(self):
        """
        Test login failure due to non-existent user:
        This test ensures that the system returns an appropriate error message
        when a user who does not exist attempts to log in.
        """
        response = self.client.post(reverse('handle_login'), {
            'username': 'test1',
            'password': 'password'
        }, follow=True)
        self.assertEqual(response.status_code, 200)
        self.assertIn("User does not exist", str(response.content))
