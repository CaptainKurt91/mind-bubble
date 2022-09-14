class TaskNote < ApplicationRecord
  include AddStartTime
  include PgSearch::Model
  belongs_to :task

  multisearchable against: :name
end
