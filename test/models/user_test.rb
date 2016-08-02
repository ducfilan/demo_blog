require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup 
    @user = User.new(name: "Example User", email: "user@example.com", password: "123456", password_confirmation: "123456")
  end

  test "should be valid" do
  	assert @user.valid?
  end

  test "name should be presence" do
  	@user.name = ""
  	assert_not @user.valid? 
  end

  test "email should be presence" do
  	@user.email = "	"
  	assert_not @user.valid?
  end

  test "name should not be too long" do
  	@user.name = "a" * 51
  	assert_not @user.valid?
  end

  test "email should not be too long" do 
  	@user.email = "a" * 224 + "@example.com"
  	assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
  	valid_addresses = ["user@example.com", "USER@foo.COM", "A_US-ER@foo.bar.org", "first.last@foo.jp", "alice+bob@baz.cn"]
  	valid_addresses.each do |valid_address|
  		assert @user.valid?, "#{valid_address.inspect} should valid"
  	end
  end

  test "email should unique" do 
    duplicate_email = @user.dup
    @user.save
    assert_not duplicate_email.valid?
  end

  test "password can not blank" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password have minimun leght" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

end
