# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EpisodeSerializer, type: :serializer do
  let(:episode) { create(:episode) }

  subject(:serializer) { described_class.new(episode) }

  describe '#attributes' do
    it 'return the list of expected attributes' do
      %i[id title plot number].each do |attribute|
        expect(serializer.attributes[attribute]).to eq(episode.send(attribute))
      end
    end
  end
end
