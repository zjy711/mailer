require 'rails_helper'
require 'pry'

RSpec.describe EmailsController, type: :controller do
  describe "Post #email" do
    context 'when params are invalid/missing required params' do
      it "returns 400" do
        post :email
        expect(response).to have_http_status(400)
      end

      it "returns error message" do
        post :email

        message = "Please provide all the required parameters: #{EmailsController::REQUIRED_EMAIL_PARAMS.join(",")}."
        expect(JSON.parse(response.body)["message"]).to eq(message)
      end
    end

    context "when params are valid/all required params are passed in" do
      before do
        @params = {}

        EmailsController::REQUIRED_EMAIL_PARAMS.each do |name|
          @params[name.to_s] = "value for #{name}"
        end
        expect(MailerService).to receive(:send_email)
      end

      it "returns 200" do
        post :email, params: @params
        expect(response).to have_http_status(200)
      end

      it "returns error message" do
        post :email, params: @params

        message = "Email Request Post on Mailer Service successfully."
        expect(JSON.parse(response.body)["message"]).to eq(message)
      end
    end
  end
end
