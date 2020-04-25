# frozen_string_literal: true

class User < ApplicationRecord
  # Relationships
  has_many :purchases, inverse_of: :user
  # Validations
  validates :email, presence: true
end
