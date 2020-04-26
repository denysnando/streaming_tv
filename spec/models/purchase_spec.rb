# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Purchase, type: :model do
  describe 'relationships' do
    it { is_expected.to belong_to(:purchase_option).inverse_of(:purchases).required }
    it { is_expected.to belong_to(:user).inverse_of(:purchases).required }
  end

  describe 'validation' do
    it { is_expected.to validate_presence_of(:user) }
    it { is_expected.to validate_presence_of(:purchase_option) }
  end

  describe 'set_expired_at' do
    context 'when create purchase set date expired_at' do
      before do
        @purchase = build(:purchase, expired_at: nil)
        travel_to Time.zone.now
      end

      after do
        travel_back
      end

      it 'should set expired_at three days from now' do
        expect(@purchase.expired_at).to be_nil
        @purchase.save
        expect(@purchase.expired_at).to eq(Time.zone.now + 2.days)
      end
    end
  end

  describe 'set_expired_at' do
    context 'when create purchase set date expired_at' do
      before do
        @purchase_1 = create(:purchase)
        @purchase_2 = build(:purchase)
      end

      it 'should set expired_at two days from now' do
        expect(Purchase.count).to eq(1)

        @purchase_2.save
        expect(@purchase_2.errors.full_messages).to eq(['Puchase You already have a purchase!'])
      end
    end
  end
end
