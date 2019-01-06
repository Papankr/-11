# frozen_string_literal: true

Rails.application.routes.draw do
  root 'main#index'
  get 'check', to: 'main#check'
  get 'tickets', to: 'main#tickets'
end
