require "application_system_test_case"

class Admin::QuotesTest < ApplicationSystemTestCase
  setup do
    @admin_quote = admin_quotes(:one)
  end

  test "visiting the index" do
    visit admin_quotes_url
    assert_selector "h1", text: "Quotes"
  end

  test "should create quote" do
    visit admin_quotes_url
    click_on "New quote"

    click_on "Create Quote"

    assert_text "Quote was successfully created"
    click_on "Back"
  end

  test "should update Quote" do
    visit admin_quote_url(@admin_quote)
    click_on "Edit this quote", match: :first

    click_on "Update Quote"

    assert_text "Quote was successfully updated"
    click_on "Back"
  end

  test "should destroy Quote" do
    visit admin_quote_url(@admin_quote)
    click_on "Destroy this quote", match: :first

    assert_text "Quote was successfully destroyed"
  end
end
