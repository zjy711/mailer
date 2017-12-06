class MailgunClient
  include ActionView::Helpers::SanitizeHelper

  DOMAIN_NAME = Rails.application.secrets.mailgun_domain_name
  API_KEY     = Rails.application.secrets.mailgun_api_key
  MESSAGE_URL = URI.encode("https://api:#{API_KEY}@api.mailgun.net/v3/#{DOMAIN_NAME}/messages")

  def send_email params
    from = "#{params[:from_name]} <#{params[:from]}>"
    to   = "#{params[:to_name]} <#{params[:to]}>"
    text = strip_tags(params[:body])

    RestClient.post MESSAGE_URL,
        from:    from,
        to:      to,
        subject: params[:subject],
        text:    text
  end
end