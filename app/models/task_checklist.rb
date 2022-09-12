class TaskChecklist < ApplicationRecord
  belongs_to :task

  belongs_to :category, through: :task
  belongs_to :home, through: :category
  belongs_to :user, through: :home
end
