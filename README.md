# Onestop
Onestop is a powerful e-commerce platform tailored for efficient product and order management by multiple administrators and a seamless shopping experience for customers.

## Description
- **Admins**: Manage their own products—view, update, delete, and categorize them for easy browsing.
- **Customers**: Browse products by category, add them to the cart, adjust product quantities, and securely pay through Razorpay. 
  After successful payment, customers receive an email with their order details.
- **Password Reset**: Users can reset their passwords via OTP authentication, which is valid for 2 minutes. OTP is deleted post-expiry, and users receive a confirmation SMS after successful reset.
## Security
- **Password Protection**: All passwords are securely hashed to ensure data protection.
- **Token-Based Authentication**: Authentication for URLs and APIs is handled using secure token-based mechanisms.
- **Environment Variables**: Sensitive data such as API keys and credentials are stored in a `.env` file to enhance security and prevent exposure in the source code.

---

## Installation
Follow these steps to set up the project locally:

### Prerequisites
Make sure you have the following installed:
- **Python** (Version: 3.8 or later)
- **Django** (Version: 5)
- **MySQLCLIENT** (Database management system)
- **Razorpay Python SDK** (For payment integration)
- **Setuptools** (For installation and setup)
- **Django Email** (To enable email functionality)
- **Twilio Python SDK** (For sending SMS notifications)

### Steps
1. **Clone the Repository**:
   ```bash
   git clone <https://github.com/Anieefn/py.git>
   cd <onestop>

## Usage
Follow the instructions below to interact with Onestop as an admin or customer:

### Admin Usage
1. **Log In**:
   - Navigate to the login page.
   - Enter your credentials (username and password).
   - Upon successful login, admins are redirected to the admin dashboard to manage their products.
2. **Manage Products**:
   - Add new products, categorized by type.
   - View all your products and make updates to descriptions, prices, or availability.
   - Delete products that are no longer available.
3. **Categorization**:
   - Ensure each product is assigned to an appropriate category for better user visibility.

### Customer Usage
1. **Log In**:
   - Navigate to the login page.
   - Enter your credentials (username and password).
   - Upon successful login, customers are redirected to the product catalog page to start shopping.
2. **Browse Products**:
   - Explore available products by category.
3. **Add to Cart**:
   - Select a product and add it to your shopping cart.
   - Adjust product quantity in the cart as needed.
   - If the quantity of a product falls below 1, the product will be automatically removed from the shopping cart
4. **Checkout and Payment**:
   - Proceed to checkout and pay securely through Razorpay.
   - After a successful payment, you'll receive an email with order details.
5. **Password Reset**:
   - If you've forgotten your password, request a reset.
   - Enter the OTP sent to your registered email. (OTP is valid for 2 minutes.)
   - Reset your password securely and receive an SMS confirmation after successful reset.

### Key Integrations
- **Role-Based Redirection**: After login, users are redirected to their respective dashboards based on their role (admin or customer).
- **Razorpay**: All payments are processed securely through Razorpay.
- **Twilio**: Used for sending SMS notifications during password reset.

-**Test card numbers for Razorpay**
4718 6091 0820 4366, Random CVV, Any future date
5241 8100 0000 0000,	Random CVV,	Any future date