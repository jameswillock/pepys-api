Rails.application.routes.draw do
  resources :diary_entries, only: [:index, :show]
end
