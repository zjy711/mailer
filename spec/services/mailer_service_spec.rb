require 'rails_helper'
require 'pry'

RSpec.describe MailerService do
  describe ".send_email" do
    it "Creates the right client service and send email via it" do
      expect_any_instance_of(MailgunClient).to receive(:send_email).with({})
      MailerService.send_email({})
    end
  end
end
