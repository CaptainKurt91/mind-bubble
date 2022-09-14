class TaskNote < ApplicationRecord
  include PgSearch::Model
  belongs_to :task

  multisearchable against: :name
end
