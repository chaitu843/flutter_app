DODHI APP

1. Theming is all getting done in lib/main.dart
<!-->

 Login Page

    Provide a link for singning in as delivery agents

 HOme page
 
    Will contain a no. of packets that will deliver in the center, with text (Long tap to edit)
    Will need further development
 
 Drawer should contain links to 
    My Account
    History
    Payments
    Review
    Add/Sub
    SignOut
  
 WhiteSpace with user DisplayName
  
 DisplayName should be taken at the time of registertion




 MY Account Page

    Center Profile Picture or a upload image picture

    Name

    EmailId

    Address

    Phone No.

    Daily Delivery Quantity


 Payments Page

   Wallets and stuff

   will be picked up later

Add/Sub Page

    Add/Sub for a particualar Date

History 

    History of Orders

Review
    Name, About, Review 

    or

    Order id's

    Spec Delivery partner name -- REview


<-->

<!-- >
    Data Layer

    1. Collections -- users, deliveryAgents, orders

    user{
        emailID,
        password,
        displayName,
        location,
        address,
        dailyDeliveryQuantity
    }

    orders {
        orderId,
        deliveryAgentName,
        quantity,
        userId,
        paymentMode,
        timeAndDateOfDelivery
    }

    adminOrder {
        for a day -- userId: Qty
    }
<-->
2. 