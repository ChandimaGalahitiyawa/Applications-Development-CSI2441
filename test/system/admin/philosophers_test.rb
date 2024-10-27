require "application_system_test_case"

class Admin::PhilosophersTest < ApplicationSystemTestCase
  setup do
    @admin_philosopher = admin_philosophers(:one)
  end

  test "visiting the index" do
    visit admin_philosophers_url
    assert_selector "h1", text: "Philosophers"
  end

  test "should create philosopher" do
    visit admin_philosophers_url
    click_on "New philosopher"

    click_on "Create Philosopher"

    assert_text "Philosopher was successfully created"
    click_on "Back"
  end

  test "should update Philosopher" do
    visit admin_philosopher_url(@admin_philosopher)
    click_on "Edit this philosopher", match: :first

    click_on "Update Philosopher"

    assert_text "Philosopher was successfully updated"
    click_on "Back"
  end

  test "should destroy Philosopher" do
    visit admin_philosopher_url(@admin_philosopher)
    click_on "Destroy this philosopher", match: :first

    assert_text "Philosopher was successfully destroyed"
  end
end
