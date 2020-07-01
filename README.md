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

bin/rails db:migrate:redo

use 'git mv filename' properly rename a file

Playtime
Here’s some stuff to try on your own:
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