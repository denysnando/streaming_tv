# frozen_string_literal: true

class PurchaseOption < ApplicationRecord
  # Relationships
  belongs_to :purchaseable, polymorphic: true, inverse_of: :purchase_options, required: true

  # Validations
  validates :price, :quality, presence: true
  validates :price, numericality: { greater_than: 0 }
end
