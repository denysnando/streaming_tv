# frozen_string_literal: true

puts 'CREATING movies'
10.times do
  FactoryBot.create(:user)
end

puts 'CREATING movies'

50.times do
  movie = FactoryBot.create(:movie)
  FactoryBot.create(:purchase_option, purchaseable_id: movie.id)
  FactoryBot.create(:purchase_option, :quality_sd, purchaseable_id: movie.id)
end

puts 'CREATING season and episodes'

50.times do
  season = FactoryBot.create(:season)
  10.times { |i| FactoryBot.create(:episode, season_id: season.id, number: i + 1) }
  FactoryBot.create(:purchase_option, purchaseable_id: season.id, purchaseable_type: 'Season')
  FactoryBot.create(:purchase_option, :quality_sd, purchaseable_id: season.id, purchaseable_type: 'Season')
end
