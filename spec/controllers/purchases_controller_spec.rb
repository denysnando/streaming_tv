# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PurchasesController, type: :request do
  let(:user) { create(:user) }
  let(:purchase_option) { create(:purchase_option) }

  describe '#create' do
    context 'create a new purchase' do
      before do
        travel_to Time.zone.now
      end

      after do
        travel_back
      end

      it 'shoulda create a new purchase' do
        post '/purchases', params: { user_id: user.id,
                                     purchase_option_id: purchase_option.id }
        purchase = Purchase.last

        expect(purchase.user).to eq(user)
        expect(purchase.purchase_option).to eq(purchase_option)
        expect(purchase.expired_at).to eq(Time.zone.now + 2.days)
      end
    end

    context 'Try create a new purchase' do
      before do
        create(:purchase, user_id: user.id,
                          purchase_option_id: purchase_option.id)
      end
      it 'shoulda create a new purchase but, already existed' do
        post '/purchases', params: { user_id: user.id,
                                     purchase_option_id: purchase_option.id }

        expect(JSON.parse(response.body)['message']).to eq('Purchase similar, not expired yet!')
      end
    end
  end
  context '#list_purchase' do
    before do
      @purchase = create(:purchase, user_id: user.id)
    end

    it 'list a users purchases' do
      get '/purchases/list_purchase/', params: { id: user.id }

      expect(JSON.parse(response.body).first['id']).to eq(@purchase.id)
      expect(JSON.parse(response.body).first['expired_at']).to eq(@purchase.expired_at.strftime('%d/%m/%Y %H:%M:%S'))
      expect(JSON.parse(response.body).first['created_at']).to eq(@purchase.created_at.strftime('%d/%m/%Y %H:%M:%S'))
      expect(JSON.parse(response.body).first['purchase_option']['id']).to eq(@purchase.purchase_option.id)
      expect(JSON.parse(response.body).first['purchase_option']['quality']).to eq(@purchase.purchase_option.quality)
      expect(JSON.parse(response.body).first['purchase_option']['price']).to eq(@purchase.purchase_option.price.to_s)
      expect(JSON.parse(response.body).first['purchase_option']['purchaseable']['id']).to eq(@purchase.purchase_option.purchaseable.id)
      expect(JSON.parse(response.body).first['purchase_option']['purchaseable']['title']).to eq(@purchase.purchase_option.purchaseable.title)
      expect(JSON.parse(response.body).first['purchase_option']['purchaseable']['plot']).to eq(@purchase.purchase_option.purchaseable.plot)
    end
  end
end
