# frozen_string_literal: true

class PurchaseOptionSerializer < ActiveModel::Serializer
  attributes :id, :quality, :price, :purchases
end