# frozen_string_literal: true

class Season < ApplicationRecord
  # Relationships
  include Purchaseable

  has_many :episodes, inverse_of: :season, dependent: :restrict_with_error

  # Validations
  validates :title, :plot, :number, presence: true
  validates :number, numericality: { greater_than: 0 }
end
