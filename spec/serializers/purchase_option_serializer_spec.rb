# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PurchaseOptionSerializer, type: :serializer do
  let(:purchase_option) { create(:purchase_option) }

  subject(:serializer) { described_class.new(purchase_option) }

  describe '#attributes' do
    it 'return the list of expected attributes' do
      expect(serializer.as_json[:id]).to eq(purchase_option.id)
      expect(serializer.as_json[:quality]).to eq(purchase_option.quality)
      expect(serializer.as_json[:price]).to eq(purchase_option.price)
      expect(serializer.as_json[:created_at]).to eq(purchase_option.created_at.strftime('%d/%m/%Y %H:%M:%S'))
      expect(serializer.as_json[:purchaseable][:id]).to eq(purchase_option.purchaseable.id)
      expect(serializer.as_json[:purchaseable][:title]).to eq(purchase_option.purchaseable.title)
      expect(serializer.as_json[:purchaseable][:plot]).to eq(purchase_option.purchaseable.plot)
      expect(serializer.as_json[:purchaseable][:created_at]).to eq(purchase_option.purchaseable.created_at.strftime('%d/%m/%Y %H:%M:%S'))
    end
  end
end
