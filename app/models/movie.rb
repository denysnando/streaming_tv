# frozen_string_literal: true

class Movie < ApplicationRecord
  # Relationships
  include Purchaseable

  # Validations
  validates :title, :plot, presence: true
end
