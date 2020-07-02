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