class Food < ApplicationRecord
  validates_numericality_of :amount, greater_than_or_equal_to: 0
  validates_presence_of :name

  scope :alphabetical, -> { order(name: :asc) }
  scope :reverse_chronological, -> { order(created_at: :desc) }

  def summary
    "Ate #{amount} units of #{name}" + (description.blank? ? "" : " (#{description})")
  end
end
