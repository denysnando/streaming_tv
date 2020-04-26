# frozen_string_literal: true

class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :plot, :created_at

  def created_at
    object.created_at.strftime('%d/%m/%Y %H:%M:%S')
  end
end
