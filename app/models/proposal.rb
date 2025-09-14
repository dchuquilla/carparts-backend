class Proposal < ApplicationRecord
  belongs_to :request
  belongs_to :user

  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :currency, presence: true
  validates :delivery_time_days, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true
  validates :warranty_months, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true
  validates :notes, length: { maximum: 500 }, allow_blank: true
  validates :status, inclusion: { in: %w[pending accepted rejected] }, allow_blank: true

  after_save :reject_pending

  default_scope { where(status: [PROPOSAL_STATUSES[:pending], PROPOSAL_STATUSES[:accepted]]) }

  scope :by_request, ->(request_id) { where(request_id: request_id) }
  scope :by_user, ->(user_id) { where(user_id: user_id) }
  scope :accepted, -> { where(status: PROPOSAL_STATUSES[:accepted]) }
  scope :pending, -> { where(status: PROPOSAL_STATUSES[:pending]) }
  scope :rejected, -> { where(status: PROPOSAL_STATUSES[:rejected]) }

  def formatted_price
    "#{currency} #{'%.2f' % price}"
  end

  def formatted_created_at
    created_at.in_time_zone("America/Guayaquil").strftime("%Y-%m-%d %H:%M:%S")
  end

  def reject_pending
    if saved_change_to_status? && status == PROPOSAL_STATUSES[:accepted]
      Proposal.where(request_id: request_id, status: PROPOSAL_STATUSES[:pending]).where.not(id: id).update_all(status: PROPOSAL_STATUSES[:rejected])
    end
  end

  def pending?
    status == PROPOSAL_STATUSES[:pending]
  end

  def accepted?
    status == PROPOSAL_STATUSES[:accepted]
  end

  def rejected?
    status == PROPOSAL_STATUSES[:rejected]
  end
end
