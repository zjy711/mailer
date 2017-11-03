require 'rails_helper'
require 'pry'

RSpec.describe MailgunClient do
  describe "#send_email" do
    it "Sends email with correct params" do
      url = "https://api:api_key@api.just_a_testing.net/v3/my_domain_name/messages"
      MailgunClient::MESSAGE_URL = url

      params = {
        to: "fake@example.com",
        to_name: "Mr. Fake",
        from: "bakery@example.com",
        from_name: "Ann Bakery",
        subject: "hello",
        body: "<h1>this is a rspec testing email</h1>"
      }

      rest_client_params = {
        from:    "#{params[:from_name]} <#{params[:from]}>",
        to:      "#{params[:to_name]} <zjj711@gmail.com>",
        subject: params[:subject],
        text:    "this is a rspec testing email"
      }

      expect(RestClient).to receive(:post).with(url, rest_client_params)

      MailgunClient.new.send_email params
    end
  end
end