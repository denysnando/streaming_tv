# frozen_string_literal: true

class Purchase < ApplicationRecord
  # Relationships
  belongs_to :purchase_option, inverse_of: :purchases, required: true
  belongs_to :user, inverse_of: :purchases, required: true

  # Validations
  validates :user, :purchase_option, presence: true
  validate :can_buy?

  # Scope
  scope :not_expired, -> { where('expired_at > ?', Time.zone.now) }
  scope :expired, -> { where('expired_at > ?', Time.zone.now) }
  scope :similar_purchase, lambda { |user_id, purchase_option_id|
                             where(user_id: user_id,
                                   purchase_option_id: purchase_option_id)
                           }

  # Callbacks
  before_validation :set_expired_at

  private

  def can_buy?
    return unless Purchase.similar_purchase(user_id,
                                            purchase_option_id).not_expired.any?

    errors.add(:purchase, 'similar, not expired yet!')
  end

  def set_expired_at
    self.expired_at = Time.zone.now + 2.days
  end
end
