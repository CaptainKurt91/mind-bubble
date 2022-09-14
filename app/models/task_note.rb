class TaskNote < ApplicationRecord
  include AddStartTime
  belongs_to :task
end
