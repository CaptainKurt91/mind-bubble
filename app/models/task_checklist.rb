class TaskChecklist < ApplicationRecord
  belongs_to :task

  has_many :task_checklist_items
end
