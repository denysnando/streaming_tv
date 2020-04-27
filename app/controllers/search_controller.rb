# frozen_string_literal: true

class SearchController < ApplicationController
  caches_action :search_movies, :search_seasons, :search_all

  def search_movies
    @movies = Movie.all.order(:created_at)

    render json: @movies, each_serializer: MovieSerializer
  end

  def search_seasons
    @seasons = Season.all.order(:created_at)

    render json: @seasons, each_serializer: SeasonSerializer
  end

  def search_all
    @seasons = Season.all.order(:created_at)
    @movies = Movie.all.order(:created_at)

    render json: {
      movies: ActiveModelSerializers::SerializableResource.new(@movies, each_serializer: MovieSerializer),
      seasons: ActiveModelSerializers::SerializableResource.new(@seasons, each_serializer: SeasonSerializer)
    }
  end
end
