# frozen_string_literal: true

FactoryBot.define do
  factory :episode do
    title { Faker::DcComics.title }
    plot { Faker::Movie.quote }
    number { Faker::Number.decimal_part(2) }
    season_id { find_or_create(:season) }
  end
end
