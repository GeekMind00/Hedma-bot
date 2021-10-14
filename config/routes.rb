Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/webhooks/telegram_4urh34ruwurhewufhweru4ruwruwhruwrwhruw' => 'webhooks#webhookCallback'
  post '/room_messages/:id' => 'room_messages#create'
  root controller: :users, action: :index

  resources :room_messages
  resources :users
end
