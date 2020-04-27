# frozen_string_literal: true

class SeasonSerializer < ActiveModel::Serializer
  attributes :id, :title, :plot, :number, :created_at, :episodes, :purchase_options

  def episodes
    object.episodes.order(:number)
  end

  def created_at
    object.created_at.strftime('%d/%m/%Y %H:%M:%S')
  end
end
