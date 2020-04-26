# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PurchaseSerializer, type: :serializer do
  let(:purchase) { create(:purchase) }

  subject(:serializer) { described_class.new(purchase) }

  describe '#attributes' do
    it 'return the list of expected attributes' do
      %i[id].each do |attribute|
        expect(serializer.attributes[attribute]).to eq(purchase.send(attribute))
      end
    end
  end
end
