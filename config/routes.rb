# frozen_string_literal: true

Rails.application.routes.draw do
  get '/search_movies' => 'search#search_movies'
  get '/search_seasons' => 'search#search_seasons'
  get '/search_all' => 'search#search_all'
end
