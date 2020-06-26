require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
    @update  = {
      title:       'Lorem Ipsum',
      description: 'Wibbles are fun!',
      image_url:   'lorem.jpg',
      price:        19.95
    }
  end

  test "should get index" do
    get products_url
    assert_response :success
    assert_select 'h1', "#{controller.controller_name.capitalize}"
    assert_select '.list_description dl' do
      assert_select 'dt', @product.title
      assert_select 'dd' do
        assert @product.description.length, 80
      end
    end
    assert_select '.list_actions', minimum: 3
    assert_select '#main a', 'New Product'
  end

  test "should get new" do
    get new_product_url
    assert_response :success
    assert_select 'h1', 'New Product'
    assert_select 'form' do
      assert_select 'div', 5
      assert_select '.actions input' do
        assert_select "[value=?]", 'Create Product'
      end
    end
    assert_select '#main a', 'Back'
  end

  test "should create product" do
    assert_difference('Product.count') do
      post products_url, params: { product: @update }
    end

    assert_redirected_to product_url(Product.last)
  end

  test "should show product" do
    get product_url(@product)
    assert_response :success
    assert_select '#main' do
      assert_select 'p', 5
      assert_select 'a', 2
    end
  end

  test "should get edit" do
    get edit_product_url(@product)
    assert_response :success
    assert_select 'h1', 'Editing Product'
    assert_select 'form' do
      assert_select 'div', 5
      assert_select '#product_title[value=?]',     @product.title
      assert_select '#product_description',        @product.description
      assert_select '#product_image_url[value=?]', @product.image_url
      assert_select '#product_price[value=?]',     @product.price.to_s
    end
    assert_select '#main a', 2
  end

  test "should update product" do
    patch product_url(@product), params: { product: @update }
    assert_redirected_to product_url(@product)
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete product_url(@product)
    end

    assert_redirected_to products_url
  end

  test "can't delete product in cart" do
    assert_difference('Product.count', 0) do
      delete product_url(products(:two))
    end

    assert_redirected_to products_url
  end
end
