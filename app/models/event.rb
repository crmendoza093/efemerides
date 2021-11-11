class Event < ApplicationRecord
  belongs_to :category, class_name: 'Category', foreign_key: 'category_id'

  enum status: %i[available archived]
  validates :description, :effective_date, :category_id, presence: true
  validate :update_only_available

  scope :current, -> { where(effective_date: Date.today) }
  scope :by_effective_date, ->(date) { where('effective_date = ?', date) }
  scope :matching_description, lambda { |*query|
    matching(:description, *query)
  }

  private

  def update_only_available
    errors.add(:status, I18n.t('errors.event_archived')) if archived?
  end
end
