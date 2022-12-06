class TaskChecklistItem < ApplicationRecord
  belongs_to :task_checklist
  belongs_to :user
end
