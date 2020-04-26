# frozen_string_literal: true

class SeasonSerializer < ActiveModel::Serializer
  attributes :id, :title, :plot, :number
  has_many :episodes
end
