require "test_helper"

class Admin::PhilosophersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_philosopher = admin_philosophers(:one)
  end

  test "should get index" do
    get admin_philosophers_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_philosopher_url
    assert_response :success
  end

  test "should create admin_philosopher" do
    assert_difference("Admin::Philosopher.count") do
      post admin_philosophers_url, params: { admin_philosopher: {  } }
    end

    assert_redirected_to admin_philosopher_url(Admin::Philosopher.last)
  end

  test "should show admin_philosopher" do
    get admin_philosopher_url(@admin_philosopher)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_philosopher_url(@admin_philosopher)
    assert_response :success
  end

  test "should update admin_philosopher" do
    patch admin_philosopher_url(@admin_philosopher), params: { admin_philosopher: {  } }
    assert_redirected_to admin_philosopher_url(@admin_philosopher)
  end

  test "should destroy admin_philosopher" do
    assert_difference("Admin::Philosopher.count", -1) do
      delete admin_philosopher_url(@admin_philosopher)
    end

    assert_redirected_to admin_philosophers_url
  end
end
