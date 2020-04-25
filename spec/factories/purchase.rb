# frozen_string_literal: true

FactoryBot.define do
  factory :purchase do
    user { create(:user) }
    purchase_option_id { create(:purchase_option) }
    expired_at { Faker::Date.forward(days: 3) }
  end
end
