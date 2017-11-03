class MailgunClient
  include ActionView::Helpers::SanitizeHelper

  DOMAIN_NAME = "sandboxf872f125533940d287b5ddf30a8b1d19.mailgun.org"
  API_KEY     = "key-f500e69ff7b88691e6db85d533ac7866"
  MESSAGE_URL =  URI.encode("https://api:#{API_KEY}@api.mailgun.net/v3/#{DOMAIN_NAME}/messages")

  def send_email params
    from = "#{params[:from_name]} <#{params[:from]}>"
    to   = "#{params[:to_name]} <zjj711@gmail.com>" #hard-coded verified recipient on Mailgun since it's sandbox domain
    text = strip_tags(params[:body])

    RestClient.post MESSAGE_URL,
        from:    from,
        to:      to,
        subject: params[:subject],
        text:    text
  end
end