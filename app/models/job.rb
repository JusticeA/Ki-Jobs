class Job < ApplicationRecord
  searchkick word_middle: [:company_name, :title, :details, :location, :requirement, :close_date]
  validates :title, presence: true
  validates :details, presence: true, length: {minimum: 100}
  validates :requirement, presence: true, length: {minimum: 10}
  validates :location, presence: true
  validates :close_date, presence: true
  validates :how_to_apply, presence: true
  belongs_to :recruiter
end
