# AggieCashStudent

## View Controllers
- Login & Sign up controller
  - Google sign in + Remember me
  - Guest sign in 
  
- “Select food truck” controller
  - List of food trucks
  - Food Truck Menu
  - You can select multiple items
  - Modifying special instructors on the food that has been selected
  - There’s a checkout button
  - Cart/ checkout
  - Enter payment option

- Profile view controller
  - Name
  - Email
  - PaymentPro information (optional)
  - Profile image (do we really need this?)   
  - Orders
  - Will let you know if it’s in progress and when it’s done, maybe even wait times
  - Order number
  - Can be a table view, where you have multiple orders from multiple food trucks
  - History of orders (from newest on top to oldest on bottom)
  - Features
  - Send notification when order is done (in-app notifications) 
  - OCR for reading credit/debit info

## Database 
- Probably firebase firestore since we’re already familiar with it.
- Google Authentication
- Anonymous Authentication
- Store user profile and payment information.
  
## Do we need additional security measures for payment information?
- Store user’s previous orders
- Information about the order status, order date, and which food truck it’s from
- Order status can also be denied status (there can be reason why)

## Payment/Transaction API
  - Square up: https://developer.squareup.com/us/en?device=c&gclid=CjwKCAiAgqDxBRBTEiwA59eEN5_InK1AyaL6AlIa9yYlzlBpV5jQZEsnHon-sweVaM_p0G5a6I_0oxoC0z0QAvD_BwE&gclsrc=aw.ds&kw=%2Bapi+%2Bpayments&kwid=p47420917454&matchtype=b&pcrid=386699851678&pdv=c&pkw=%2Bapi+%2Bpayments&pmt=b&pub=GOOGLE
  - Stripe: https://stripe.com/docs/payments/accept-a-payment
  - Braintree: https://developers.braintreepayments.com/start/hello-client/ios/v3
