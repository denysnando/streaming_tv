# frozen_string_literal: true

module Purchaseable
  extend ActiveSupport::Concern

  included do
    has_many :purchase_options, as: :purchaseable
  end
end
