# frozen_string_literal: true

class Purchase < ApplicationRecord
  # Relationships
  belongs_to :purchase_option, inverse_of: :purchases, required: true
  belongs_to :user, inverse_of: :purchases, required: true

  # Validations
  validates :expired_at, presence: true
end
