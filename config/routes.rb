Rails.application.routes.draw do
  resources :citizens, except: %i[delete]
end
