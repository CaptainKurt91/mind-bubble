class Component < ApplicationRecord
  include PgSearch::Model
  belongs_to :task
  has_many :lists
  
  multisearchable against: :name
end
