# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SearchController, type: :request do
  let!(:movie_1) { create(:movie) }
  let!(:movie_2) { create(:movie) }
  let!(:season_1) { create(:season) }
  let!(:season_2) { create(:season) }
  let!(:episode_1) { create(:episode, season_id: season_1.id, number: 1) }
  let!(:episode_2) { create(:episode, season_id: season_1.id, number: 2) }
  let!(:episode_3) { create(:episode, season_id: season_2.id, number: 1) }
  let!(:episode_4) { create(:episode, season_id: season_2.id, number: 2) }

  context '#search_movies' do
    it 'return OK' do
      get '/search_movies'

      expect(response).to be_ok
      expect(JSON.parse(response.body).first['id']).to eq(movie_1.id)
      expect(JSON.parse(response.body).first['title']).to eq(movie_1.title)
      expect(JSON.parse(response.body).first['plot']).to eq(movie_1.plot)

      expect(JSON.parse(response.body).second['id']).to eq(movie_2.id)
      expect(JSON.parse(response.body).second['title']).to eq(movie_2.title)
      expect(JSON.parse(response.body).second['plot']).to eq(movie_2.plot)
    end
  end

  context '#search_seasons' do
    it 'return OK' do
      get '/search_seasons'
      expect(response).to be_ok
      expect(JSON.parse(response.body).first['id']).to eq(season_1.id)
      expect(JSON.parse(response.body).first['title']).to eq(season_1.title)
      expect(JSON.parse(response.body).first['plot']).to eq(season_1.plot)

      expect(JSON.parse(response.body).first['episodes'].first['id']).to eq(episode_1.id)
      expect(JSON.parse(response.body).first['episodes'].first['title']).to eq(episode_1.title)
      expect(JSON.parse(response.body).first['episodes'].first['plot']).to eq(episode_1.plot)
      expect(JSON.parse(response.body).first['episodes'].first['number']).to eq(episode_1.number)

      expect(JSON.parse(response.body).first['episodes'].second['id']).to eq(episode_2.id)
      expect(JSON.parse(response.body).first['episodes'].second['title']).to eq(episode_2.title)
      expect(JSON.parse(response.body).first['episodes'].second['plot']).to eq(episode_2.plot)
      expect(JSON.parse(response.body).first['episodes'].second['number']).to eq(episode_2.number)

      expect(JSON.parse(response.body).second['id']).to eq(season_2.id)
      expect(JSON.parse(response.body).second['title']).to eq(season_2.title)
      expect(JSON.parse(response.body).second['plot']).to eq(season_2.plot)

      expect(JSON.parse(response.body).second['episodes'].first['id']).to eq(episode_3.id)
      expect(JSON.parse(response.body).second['episodes'].first['title']).to eq(episode_3.title)
      expect(JSON.parse(response.body).second['episodes'].first['plot']).to eq(episode_3.plot)
      expect(JSON.parse(response.body).second['episodes'].first['number']).to eq(episode_3.number)

      expect(JSON.parse(response.body).second['episodes'].second['id']).to eq(episode_4.id)
      expect(JSON.parse(response.body).second['episodes'].second['title']).to eq(episode_4.title)
      expect(JSON.parse(response.body).second['episodes'].second['plot']).to eq(episode_4.plot)
      expect(JSON.parse(response.body).second['episodes'].second['number']).to eq(episode_4.number)
    end
  end

  context '#search_all' do
    it 'return OK' do
      get '/search_all'
      expect(response).to be_ok

      expect(JSON.parse(response.body)['movies'].first['id']).to eq(movie_1.id)
      expect(JSON.parse(response.body)['movies'].first['title']).to eq(movie_1.title)
      expect(JSON.parse(response.body)['movies'].first['plot']).to eq(movie_1.plot)

      expect(JSON.parse(response.body)['movies'].second['id']).to eq(movie_2.id)
      expect(JSON.parse(response.body)['movies'].second['title']).to eq(movie_2.title)
      expect(JSON.parse(response.body)['movies'].second['plot']).to eq(movie_2.plot)

      expect(JSON.parse(response.body)['seasons'].first['id']).to eq(season_1.id)
      expect(JSON.parse(response.body)['seasons'].first['title']).to eq(season_1.title)
      expect(JSON.parse(response.body)['seasons'].first['plot']).to eq(season_1.plot)

      expect(JSON.parse(response.body)['seasons'].first['episodes'].first['id']).to eq(episode_1.id)
      expect(JSON.parse(response.body)['seasons'].first['episodes'].first['title']).to eq(episode_1.title)
      expect(JSON.parse(response.body)['seasons'].first['episodes'].first['plot']).to eq(episode_1.plot)
      expect(JSON.parse(response.body)['seasons'].first['episodes'].first['number']).to eq(episode_1.number)

      expect(JSON.parse(response.body)['seasons'].first['episodes'].second['id']).to eq(episode_2.id)
      expect(JSON.parse(response.body)['seasons'].first['episodes'].second['title']).to eq(episode_2.title)
      expect(JSON.parse(response.body)['seasons'].first['episodes'].second['plot']).to eq(episode_2.plot)
      expect(JSON.parse(response.body)['seasons'].first['episodes'].second['number']).to eq(episode_2.number)

      expect(JSON.parse(response.body)['seasons'].second['id']).to eq(season_2.id)
      expect(JSON.parse(response.body)['seasons'].second['title']).to eq(season_2.title)
      expect(JSON.parse(response.body)['seasons'].second['plot']).to eq(season_2.plot)

      expect(JSON.parse(response.body)['seasons'].second['episodes'].first['id']).to eq(episode_3.id)
      expect(JSON.parse(response.body)['seasons'].second['episodes'].first['title']).to eq(episode_3.title)
      expect(JSON.parse(response.body)['seasons'].second['episodes'].first['plot']).to eq(episode_3.plot)
      expect(JSON.parse(response.body)['seasons'].second['episodes'].first['number']).to eq(episode_3.number)

      expect(JSON.parse(response.body)['seasons'].second['episodes'].second['id']).to eq(episode_4.id)
      expect(JSON.parse(response.body)['seasons'].second['episodes'].second['title']).to eq(episode_4.title)
      expect(JSON.parse(response.body)['seasons'].second['episodes'].second['plot']).to eq(episode_4.plot)
      expect(JSON.parse(response.body)['seasons'].second['episodes'].second['number']).to eq(episode_4.number)
    end
  end
end
