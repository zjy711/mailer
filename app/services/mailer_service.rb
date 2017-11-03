class MailerService
  def self.send_email params
    service_name = Rails.configuration.mailer_service # better to be an enviroment variable.
    client = "#{service_name.to_s.camelize}Client".constantize.new
    client.send_email(params)
  end
end
