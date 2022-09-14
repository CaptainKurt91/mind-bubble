class TaskChecklist < ApplicationRecord
  include PgSearch::Model
  belongs_to :task

  has_many :task_checklist_items
  multisearchable against: :name
end
