# frozen_string_literal: true

FactoryBot.define do
  factory :purchase_option do
    price { Faker::Number.decimal(l_digits: 2) }
    quality { 'HD' }
    purchaseable_id { create(movie) }
    purchaseable_type { 'Movie' }
  end
end
