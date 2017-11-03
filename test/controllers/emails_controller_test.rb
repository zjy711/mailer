require 'test_helper'

class EmailsControllerTest < ActionDispatch::IntegrationTest
  test "should get email" do
    get emails_email_url
    assert_response :success
  end

end
