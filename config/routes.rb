Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :showtimes do
    member do
      post 'book_ticket'
      delete 'cancel_ticket/:booking_id', action: :cancel_ticket, as: :cancel_ticket
    end
  end
  root 'showtimes#index'
end