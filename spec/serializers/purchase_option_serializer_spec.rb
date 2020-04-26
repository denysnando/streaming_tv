# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PurchaseOptionSerializer, type: :serializer do
  let(:purchase_option) { create(:purchase_option) }

  subject(:serializer) { described_class.new(purchase_option) }

  describe '#attributes' do
    it 'return the list of expected attributes' do
      %i[id quality price purchases].each do |attribute|
        expect(serializer.attributes[attribute]).to eq(purchase_option.send(attribute))
      end
    end
  end
end
