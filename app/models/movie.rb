# frozen_string_literal: true

class Movie < ApplicationRecord
  # Validations
  validates :title, :plot, presence: true
end
