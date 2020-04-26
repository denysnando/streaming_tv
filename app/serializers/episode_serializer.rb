# frozen_string_literal: true

class EpisodeSerializer < ActiveModel::Serializer
  attributes :id, :title, :plot, :number
end
