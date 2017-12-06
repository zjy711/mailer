# **Welcome to the Mailer App!**

# Introduction:

Mailer is a simple Rails app sends Email via widely used email services, like Mailgun.

Mailer provides a POST Api "/email" endpoint, it validates the payload, processes the email body, and sends the email via service if it passes the validation.

Currently it only supports Mailgun, it'll support more services in future and switching service is very easy.


# How to install the Mailer App:

This app is built with ruby-2.2.5 and rails 5.1.4. Simply follow the steps:
- Check out the app and go to the root
- run `bundle`
- run `bundle exec rails s`

# How to run the rspec tests:

run `bundle exec rspec`
Now you can call the endpoint in one of the following ways in next section.

# How to use/test the api

The endpoint is "http://localhost:3000/email" if your server runs on 3000. You can use your preferred api client or extension to test. CURL, Httparty, RestClient, or Chrome Extension "Advanced API Client".

A simple way to test via Rails Console:

Go to the app location and run `bundle exec rails console` 

```RestClient.post 'http://localhost:3000/email.json', to: 'zjj711@gmail.com', to_name: :jiajunzhu, from: 'zjy711@gmail.com', from_name: "Ann's Bakery", subject: "Greetings from Ann's Bakery!", body: "Happy Holidays!"```

( Note: Since I used the sandbox domain, it only sends email to verified recipient. For the purpose of testing, you can use mine: zjj711@gmail.com, to put in the 'to' params)

# Tech notes:

## library picked:
Rest-client: easy to use, and Mailgun uses it.

## Might do different if there is more time:

1. Build a way to store and show incoming api requests and update the status depends on mailgun's response. Mailgun provides very nice log feature. But for failures happens before the request calls Mailgun, having a place in web to view other than checking rails log would be nice. Especially when you are debugging in staging or production env. It also other team members to debug, QA, Product People, etc.

2. Deploy on heruku

3. Implement other Mailing Service.

4. Store the mail service name like :mailgun in an environment variable instead of application config so switching service doesn't require a redeoply.

5. For now the code doesn't analyze the Mailgun api response. Could be an enhancement in future, for example, notifying the caller about the situation and next steps.
