class TaskNote < ApplicationRecord
  include AddStartTime
  include PgSearch::Model
  belongs_to :task
  belongs_to :user

  multisearchable against: :title
end
