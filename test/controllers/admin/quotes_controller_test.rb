require "test_helper"

class Admin::QuotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_quote = admin_quotes(:one)
  end

  test "should get index" do
    get admin_quotes_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_quote_url
    assert_response :success
  end

  test "should create admin_quote" do
    assert_difference("Admin::Quote.count") do
      post admin_quotes_url, params: { admin_quote: {  } }
    end

    assert_redirected_to admin_quote_url(Admin::Quote.last)
  end

  test "should show admin_quote" do
    get admin_quote_url(@admin_quote)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_quote_url(@admin_quote)
    assert_response :success
  end

  test "should update admin_quote" do
    patch admin_quote_url(@admin_quote), params: { admin_quote: {  } }
    assert_redirected_to admin_quote_url(@admin_quote)
  end

  test "should destroy admin_quote" do
    assert_difference("Admin::Quote.count", -1) do
      delete admin_quote_url(@admin_quote)
    end

    assert_redirected_to admin_quotes_url
  end
end
