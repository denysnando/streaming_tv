# frozen_string_literal: true

class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :plot, :purchase_options

  has_many :purchase_options, polymorphic: true
end
