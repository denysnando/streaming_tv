# frozen_string_literal: true

class EpisodeSerializer < ActiveModel::Serializer
  attributes :id, :title, :plot, :number, :created_at, :update_at

  def created_at
    object.created_at.strftime('%d/%m/%Y %H:%M:%S')
  end

  def update_at
    object.created_at.strftime('%d/%m/%Y %H:%M:%S')
  end
end
