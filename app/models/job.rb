class Job < ApplicationRecord
  belongs_to :recruiter
  validates :company_name, presence: true
  validates :title, presence: true
  validates :details, presence: true, length: {minimum: 200}
  validates :requirement, presence: true, length: {minimum: 10}
  validates :location, presence: true
  validates :close_date, presence: true
  validates :how_to_apply, presence: true
end
