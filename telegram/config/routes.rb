Rails.application.routes.draw do
root 'msg#new'

get 'msg/msg_send'

get 'msg/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
