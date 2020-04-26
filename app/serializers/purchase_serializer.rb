# frozen_string_literal: true

class PurchaseSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :purchase_option
  belongs_to :user
end
