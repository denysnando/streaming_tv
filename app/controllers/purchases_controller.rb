# frozen_string_literal: true

class PurchasesController < ApplicationController
  def create
    purchase = Purchase.new(purchase_params)

    if purchase.save
      render json: purchase, each_serializer: PurchaseSerializer
    else
      render status: :unprocessable_entity, json: {
        message: purchase.errors.full_messages.to_sentence
      }
    end
  end

  def list_purchase
    @purchases = User.find(params[:user_id]).purchases.not_expired

    render json: @purchases, each_serializer: PurchaseSerializer
  end

  def purchase_params
    params.permit(:user_id, :purchase_option_id)
  end
end
