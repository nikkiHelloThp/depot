require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "should not save product without title" do
  	product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:image_url].any?
    assert product.errors[:price].any?
  end

  test "product price must be positive" do
  	product = Product.new(
  		title:       'My Beautiful Book',
  		description: 'yyy',
  		image_url:   'zzz.jpg'
  		)

    product.price = -1
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"],
      product.errors[:price]

    product.price = 0
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"],
      product.errors[:price]

    product.price = 1
    assert product.valid?
  end

  def new_product(image_url)
    Product.new(
      title:       'My Book Title',
      description: 'yyy',
      image_url:   image_url,
      price:       1
      )
  end

  test "image_url" do
    ok  = %w{ fred.gif fred.jpg fred.png FRED.JPG
              FRED.Jpg http://a.b.c/x/y/z/fred.gif }
    bad = %w{ fred.doc fred.gif/more fred.gif.more }
    ok.each do |name|
      assert new_product(name).valid?, "#{name} shouldn't be invalid" # here the second parameter is useful to debug code if test fails
    end

    bad.each do |name|
      assert new_product(name).invalid?, "#{name} shouldn't be valid"
    end
  end

  test "product is not valid without a unique title - i18n" do
    product = Product.new(
        title:       products(:ruby).title,
        description: 'yyy',
        image_url:   'lebowski.gif',
        price:       1
      )

    assert product.invalid?
    assert_equal [I18n.translate('errors.messages.taken')], product.errors[:title]
  end

  test "title must be 10 characters minimum" do
    product = Product.new(
      title:       'Too Short',
      description: 'yyy',
      image_url:   'zzz.jpg',
      price:        1
      )

    assert product.invalid?
    assert_equal ["is too short (minimum is 10 characters)"], product.errors[:title]

    product.title = 'Long enough title'
    assert product.valid?, "#{product.title.length} characters shouldn't be invalid"
  end
end
