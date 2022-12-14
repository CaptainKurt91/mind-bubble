class TaskChecklist < ApplicationRecord
  include AddStartTime
  include PgSearch::Model
  belongs_to :task
  belongs_to :user
  has_many :task_checklist_items, dependent: :delete_all

  validates :title, presence: true

  multisearchable against: :title
end
