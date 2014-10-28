require 'test_helper'

class CreateSubscriptionTest < ActionDispatch::IntegrationTest

  def test_admin_products_new
    visit "/admin/products"
    click_on "Add New Product"
    fill_in("Name", :with => 'test1')
    fill_in("Price", :with => '9.50')
    fill_in("Image url", :with => 'http://placehold.it/350x150')
    click_on "Create Product"

    click_on "test1"
    click_on "Edit"
    fill_in("Price", :with => '8.00')
    assert page.text.should_have_content(/\d{1}.\d{2}/)
    click_on "Update Product"
    assert page.has_content?('8.0')
    refute page.has_content?('9.5')

    save_and_open_page

    assert page.has_content?('was updated')
    click_on "test1"
    click_on "Edit"
    click_on "Delete"
    refute page.has_content?('test1')

  end



end
