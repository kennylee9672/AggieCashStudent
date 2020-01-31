# AggieCashStudent

Aggie Cash Student is an iOS app that will allow users to submit orders and purchase food from the food trucks at UC Davis. 

#### Signup/Login

Users can login via Google sign-in (including @ucdavis.edu) or as a guest. 

#### Menu: Selecting a Food Truck

After logging in, users will see a collection view of all the food trucks at UC Davis on the Menu tab. Selection of a food truck will then show their menu; when a user picks an item it will then be added to their cart.

#### Cart: Payment

The Cart tab will show users all the items: the quantity of each item, the price for each item, and the total cost. From here, users can edit the items or continue to checkout where they will enter in their credit/debit card information for payment (via Stripe). Following the user inputting their payment information, we plan on incorporating Apple's OCR (from the infrastructure team) for detecting a fraudulent transaction. Users will have to use their camera to scan their physical card that is being used for payment. After verifying validity, the order will then be placed to the food truck.

#### Orders: Waiting and Pickup for Food

In the Orders tab, users will be able to view their current orders with order numbers associated.

#### Profile: Settings and History

The Profile tab will allow users to access their settings where they can view and change their profile information. Additionally, they will also be able to see their order history for previous orders they have made.





## Planning Notes

### View Controllers:

- Login & Sign up controller, Kenny
  - Google sign in + Remember me
  - Guest sign in 
- “Select food truck” controller, Adam and Evelyn
  - List of food trucks
  - Food Truck Menu
  - You can select multiple items
  - Modifying special instructors on the food that has been selected
  - There’s a checkout button
  - Cart/ checkout
  - Enter payment option
- Profile view controller, Davy and Deli
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

### Database:

- Probably firebase firestore since we’re already familiar with it.
- Google Authentication
- Anonymous Authentication
- Store user profile and payment information.

### Do we need additional security measures for payment information?

- Store user’s previous orders
- Information about the order status, order date, and which food truck it’s from
- Order status can also be denied status (there can be reason why)

### Payment/Transaction API:

- Square up: https://developer.squareup.com/us/en?device=c&gclid=CjwKCAiAgqDxBRBTEiwA59eEN5_InK1AyaL6AlIa9yYlzlBpV5jQZEsnHon-sweVaM_p0G5a6I_0oxoC0z0QAvD_BwE&gclsrc=aw.ds&kw=%2Bapi+%2Bpayments&kwid=p47420917454&matchtype=b&pcrid=386699851678&pdv=c&pkw=%2Bapi+%2Bpayments&pmt=b&pub=GOOGLE
- Stripe: https://stripe.com/docs/payments/accept-a-payment
- Braintree: https://developers.braintreepayments.com/start/hello-client/ios/v3
