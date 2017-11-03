Rails.application.routes.draw do
  post 'email', to: 'emails#email'
end
