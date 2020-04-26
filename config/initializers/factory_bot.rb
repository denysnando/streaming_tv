# frozen_string_literal: true

require 'factory_bot'

module FactoryBot
  module Syntax
    module Methods
      def find_or_create(name, attributes = {}, &block)
        first = FactoryBot.factory_by_name(name).build_class.first&.id
        first || FactoryBot.create(name, attributes, &block).id
      end
    end
  end
end
