# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Episode, type: :model do
  describe 'Relationships' do
    it { is_expected.to belong_to(:season).inverse_of(:episodes).required }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:plot) }
    it { is_expected.to validate_presence_of(:number) }
    it { is_expected.to validate_numericality_of(:number).is_greater_than(0) }
  end
end
