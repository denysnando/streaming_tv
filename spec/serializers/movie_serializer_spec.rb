# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MovieSerializer, type: :serializer do
  let(:movie) { create(:movie) }

  subject(:serializer) { described_class.new(movie) }

  describe '#attributes' do
    it 'return the list of expected attributes' do
      %i[id title plot purchase_options].each do |attribute|
        expect(serializer.attributes[attribute]).to eq(movie.send(attribute))
      end
    end
  end
end
