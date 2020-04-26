# frozen_string_literal: true

class PurchaseOptionSerializer < ActiveModel::Serializer
  attributes :id, :quality, :price, :created_at, :purchaseable

  def purchaseable
    if object.purchaseable.class.name == 'Movie'
      MovieSerializer.new(object.purchaseable).serializable_hash
    else
      SeasonSerializer.new(object.purchaseable).serializable_hash
    end
  end

  def created_at
    object.created_at.strftime('%d/%m/%Y %H:%M:%S')
  end
end
