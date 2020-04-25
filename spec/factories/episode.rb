# frozen_string_literal: true

FactoryBot.define do
  factory :episode do
    title { Faker::DcComics.title }
    plot { Faker::Movie.quote }
    number { Faker::Number.decimal_part(digits: 2) }
    season
  end
end
