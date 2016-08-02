require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
	# test "the truth" do
	#   assert true
	# end
	test "invalid signup infomation" do 
		get signup_path
		assert_no_difference 'User.count' do 
			#users_path with post <=> create user
			post users_path, user: {
				name: "",
				email: "user@fddsa",
				password: "1fs",
				password_confirmation: "bar"
			}
		end
		assert_template 'users/new'
	end

	test "valid signup infomation" do 
		get signup_path
		assert_difference 'User.count', 1 do 
			#users_path with post <=> create user
			post users_path, user: {
				name: "Hoang Nghia Duc",
				email: "ducfilan@gmail.com",
				password: "123456",
				password_confirmation: "123456"
			}
		end
		assert_template "users"
	end

end
