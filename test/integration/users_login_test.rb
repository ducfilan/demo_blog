require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "login with invalid infomation" do
  	get login_path
  	assert_template "sessions/new"
  	post login_path, session: {email: "", password: ""}
  	assert_template "sessions/new"
  	assert_not flash.empty?
  end

  test "login with valid infomation" do 
  	get login_path
  	assert_template "sessions/new"
  	post login_path, session: {email: "ducfilan@gmail.com", password: "123456"}
  	assert_template "users/show"
  	assert_not flash.empty?
  end

end
