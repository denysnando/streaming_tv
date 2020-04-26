# frozen_string_literal: true

class PurchaseSerializer < ActiveModel::Serializer
  attributes :id, :expired_at, :created_at, :purchase_option

  def purchase_option
    PurchaseOptionSerializer.new(object.purchase_option).serializable_hash
  end

  def expired_at
    object.expired_at.strftime('%d/%m/%Y %H:%M:%S')
  end

  def created_at
    object.created_at.strftime('%d/%m/%Y %H:%M:%S')
  end
end
