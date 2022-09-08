class Component < ApplicationRecord
  belongs_to :task
  has_many :lists
end
