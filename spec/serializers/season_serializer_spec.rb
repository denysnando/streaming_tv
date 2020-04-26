# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SeasonSerializer, type: :serializer do
  let(:season) { create(:season) }

  subject(:serializer) { described_class.new(season) }

  describe '#attributes' do
    it 'return the list of expected attributes' do
      %i[id title plot number].each do |attribute|
        expect(serializer.attributes[attribute]).to eq(season.send(attribute))
      end
    end
  end
end
