# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Season, type: :model do
  describe 'Relationships' do
    it_behaves_like 'purchaseable'
    it { is_expected.to have_many(:episodes).inverse_of(:season).dependent(:restrict_with_error) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:plot) }
    it { is_expected.to validate_presence_of(:number) }
    it { is_expected.to validate_numericality_of(:number).is_greater_than(0) }
  end
end
