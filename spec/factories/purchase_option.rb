# frozen_string_literal: true

FactoryBot.define do
  factory :purchase_option do
    price { Faker::Number.decimal(1) }
    quality { 'HD' }
    purchaseable_id { find_or_create(:movie) }
    purchaseable_type { 'Movie' }
  end
end
