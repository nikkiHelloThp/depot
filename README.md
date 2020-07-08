# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


use 'git mv filename' properly rename a file

Playtime
• Create a migration that copies the product price into the line item, and
change the add_product() method in the Cart model to capture the price
whenever a new line item is created.
• Add unit tests that add unique products and duplicate products. Note
that you’ll need to modify the fixture to refer to products and carts by
name—for example, product: ruby .
• Check products and line items for other places where a user-friendly error
message would be in order.
• Add the ability to delete individual line items from the cart. This will
require buttons on each line, and such buttons will need to be linked to
the destroy() action in the LineItemsController .


• The cart is currently hidden when the user empties it by redrawing the
entire catalog. Can you change the application to use the jQuery UI blind
effect instead?
• Add a button next to each item in the cart. When clicked, it should invoke
an action to decrement the quantity of the item, deleting it from the cart
when the quantity reaches zero. Get it working without using Ajax first
and then add the Ajax goodness.
• Make images clickable. In response to a click, add the associated product
to the cart.
• When a product changes, highlight the product that changed in response
to receiving a broadcast message.


• Get HTML- and JSON-formatted views working for who_bought requests.
Experiment with including the order information in the JSON view by
rendering @product.to_json(include: :orders) . Do the same thing for XML using
1
ActiveModel::Serializers::Xml .
1.
https://github.com/rails/activemodel-serializers-xml#readme
report erratum • discussIteration G2: Atom Feeds
• 187
• What happens if you click the Checkout button in the sidebar while the
checkout screen is already displayed? Can you find a way to disable the
button in this circumstance?
• The list of possible payment types is currently stored as a constant in the
Order class. Can you move this list into a database table? Can you still
make validation work for the field?


• Add a ship_date column to the orders table, and send a notification when
this value is updated by the OrdersController .
• Update the application to send an email to the system administrator—
namely, yourself—when an application failure such as the one we handled
in Iteration E2: Handling Errors, on page 134 occurs.
• Add integration tests for both of the previous items.


• Modify the user update function to require and validate the current
password before allowing a user’s password to be changed.
• When the system is freshly installed on a new machine, no administrators
are defined in the database, and hence no administrator can log on. But, if
no administrator can log on, then no one can create an administrative user.
Change the code so that if no administrator is defined in the database,
any username works to log on (allowing you to quickly create a real
administrator).
• Experiment with rails console . Try creating products, orders, and line items.
Watch for the return value when you save a model object—when validation
fails, you’ll see false returned. Find out why by examining the errors:
>> prd = Product.new
=> #<Product id: nil, title: nil, description: nil, image_url:
nil, created_at: nil, updated_at: nil, price:
#<BigDecimal:246aa1c,'0.0',4(8)>>
>> prd.save
=> false
>> prd.errors.full_messages
=> ["Image url must be a URL for a GIF, JPG, or PNG image",
"Image url can't be blank", "Price should be at least 0.01",
"Title can't be blank", "Description can't be blank"]
report erratum • discussChapter 14. Task I: Logging In
• 220
• Look up the authenticate_or_request_with_http_basic() method and utilize it in your
:authorize callback if the request.format is not Mime::HTML . Test that it works by
accessing an Atom feed:
curl --silent --user dave:secret \
http://localhost:3000/products/2/who_bought.atom
• We’ve gotten our tests working by performing a login, but we haven’t yet
written tests that verify that access to sensitive data requires login. Write
at least one test that verifies this by calling logout() and then attempting
to fetch or update some data that requires authentication.