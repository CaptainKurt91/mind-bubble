class TaskNote < ApplicationRecord
  include AddStartTime
  include PgSearch::Model
  belongs_to :task
  belongs_to :user

  validates :title, presence: true

  multisearchable against: :title
end
