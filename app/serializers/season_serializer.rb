# frozen_string_literal: true

class SeasonSerializer < ActiveModel::Serializer
  attributes :id, :title, :plot, :number, :episodes

  def episodes
    object.episodes.order(:number)
  end
end
