# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Relationships' do
    it { is_expected.to have_many(:purchases).inverse_of(:user) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:email) }
  end
end
