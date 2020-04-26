# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MovieSerializer, type: :serializer do
  let(:movie) { create(:movie) }

  subject(:serializer) { described_class.new(movie) }

  describe '#attributes' do
    it 'return the list of expected attributes' do
      expect(serializer.as_json[:id]).to eq(movie.id)
      expect(serializer.as_json[:title]).to eq(movie.title)
      expect(serializer.as_json[:plot]).to eq(movie.plot)
      expect(serializer.as_json[:created_at]).to eq(movie.created_at.strftime('%d/%m/%Y %H:%M:%S'))
    end
  end
end
