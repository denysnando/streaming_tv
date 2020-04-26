# frozen_string_literal: true

FactoryBot.define do
  factory :purchase do
    user_id { find_or_create(:user) }
    purchase_option_id { find_or_create(:purchase_option) }
    expired_at { Time.zone.now + 2.days }
  end
end
