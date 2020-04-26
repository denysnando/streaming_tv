# frozen_string_literal: true

FactoryBot.define do
  factory :season do
    title { Faker::DcComics.title }
    plot { Faker::Movie.quote }
    number { Faker::Number.decimal_part(2) }
  end
end
