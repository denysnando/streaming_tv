# frozen_string_literal: true

FactoryBot.define do
  factory :movie do
    title { Faker::DcComics.title }
    plot { Faker::Movie.quote }
  end
end
