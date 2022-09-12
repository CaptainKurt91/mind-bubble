class TaskChecklistItem < ApplicationRecord
  belongs_to :task_checklist

  belongs_to :task, through: :task_checklist
  belongs_to :category, through: :task
  belongs_to :home, through: :category
  belongs_to :user, through: :home
end
