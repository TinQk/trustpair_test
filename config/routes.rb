# frozen_string_literal: true

Rails.application.routes.draw do
  root "positions#index"

  resources :positions do
    collection { post :import }
    collection { post :destroy_all }
  end
end
