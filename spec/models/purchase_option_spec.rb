# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PurchaseOption, type: :model do
  describe 'Relationships' do
    it { is_expected.to belong_to(:purchaseable).inverse_of(:purchase_options).required }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:quality) }
    it { is_expected.to validate_numericality_of(:price).is_greater_than(0) }
  end
end
