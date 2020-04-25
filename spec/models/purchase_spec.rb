# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Purchase, type: :model do
  describe 'Relationships' do
    it { is_expected.to belong_to(:purchase_option).inverse_of(:purchases).required }
    it { is_expected.to belong_to(:user).inverse_of(:purchases).required }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:expired_at) }
  end
end
