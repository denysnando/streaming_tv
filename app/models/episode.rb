# frozen_string_literal: true

class Episode < ApplicationRecord
  # Relationships
  belongs_to :season, inverse_of: :episodes, required: true

  # Validations
  validates :title, :plot, :number, presence: true
  validates :number, numericality: { greater_than: 0 }
end
