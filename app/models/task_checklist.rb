class TaskChecklist < ApplicationRecord
  include AddStartTime
  include PgSearch::Model
  belongs_to :task
  has_many :task_checklist_items, dependent: :delete_all
  multisearchable against: :name
end
