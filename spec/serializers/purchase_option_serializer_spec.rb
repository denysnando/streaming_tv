# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PurchaseOptionSerializer, type: :serializer do
  let(:purchase_option_movie) { create(:purchase_option) }
  let(:purchase_option_seasion) { create(:purchase_option, :season) }
  let!(:episode) { create(:episode) }

  describe '#attributes' do
    it 'return the list of expected attributes to movies' do
      serializer = described_class.new(purchase_option_movie)

      expect(serializer.as_json[:id]).to eq(purchase_option_movie.id)
      expect(serializer.as_json[:quality]).to eq(purchase_option_movie.quality)
      expect(serializer.as_json[:price]).to eq(purchase_option_movie.price)
      expect(serializer.as_json[:created_at]).to eq(purchase_option_movie.created_at.strftime('%d/%m/%Y %H:%M:%S'))
      expect(serializer.as_json[:purchaseable][:id]).to eq(purchase_option_movie.purchaseable.id)
      expect(serializer.as_json[:purchaseable][:title]).to eq(purchase_option_movie.purchaseable.title)
      expect(serializer.as_json[:purchaseable][:plot]).to eq(purchase_option_movie.purchaseable.plot)
      expect(serializer.as_json[:purchaseable][:created_at]).to eq(purchase_option_movie.purchaseable.created_at.strftime('%d/%m/%Y %H:%M:%S'))
    end

    it 'return the list of expected attributes to movies' do
      serializer = described_class.new(purchase_option_seasion)

      expect(serializer.as_json[:id]).to eq(purchase_option_seasion.id)
      expect(serializer.as_json[:quality]).to eq(purchase_option_seasion.quality)
      expect(serializer.as_json[:price]).to eq(purchase_option_seasion.price)
      expect(serializer.as_json[:created_at]).to eq(purchase_option_seasion.created_at.strftime('%d/%m/%Y %H:%M:%S'))
      expect(serializer.as_json[:purchaseable][:id]).to eq(purchase_option_seasion.purchaseable.id)
      expect(serializer.as_json[:purchaseable][:title]).to eq(purchase_option_seasion.purchaseable.title)
      expect(serializer.as_json[:purchaseable][:plot]).to eq(purchase_option_seasion.purchaseable.plot)
      expect(serializer.as_json[:purchaseable][:created_at]).to eq(purchase_option_seasion.purchaseable.created_at.strftime('%d/%m/%Y %H:%M:%S'))
      expect(serializer.as_json[:purchaseable][:episodes].first.id).to eq(episode.id)
      expect(serializer.as_json[:purchaseable][:episodes].first.title).to eq(episode.title)
      expect(serializer.as_json[:purchaseable][:episodes].first.plot).to eq(episode.plot)
      expect(serializer.as_json[:purchaseable][:episodes].first.number).to eq(episode.number)
    end
  end
end
