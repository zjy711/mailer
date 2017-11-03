require 'pry'
require_relative '../services/mailer_service'

class EmailsController < ApplicationController
  REQUIRED_EMAIL_PARAMS = ["to", "to_name", "from", "from_name", "subject", "body"]

  def email
    params = email_params

    if invalid?(params)
      render json: {
        message: "Please provide all the required parameters: #{REQUIRED_EMAIL_PARAMS.join(",")}."
      },
      status: 400
    else
      MailerService.send_email email_params

      render json: {
        message: "Email Request Post on Mailer Service successfully." }, status: 200
    end
  end

  private

  def email_params
    request.request_parameters.select {|key| REQUIRED_EMAIL_PARAMS.include? key }
  end

  def invalid? params
    REQUIRED_EMAIL_PARAMS.size != params.size
  end
end
