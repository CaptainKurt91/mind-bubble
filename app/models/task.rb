class Task < ApplicationRecord
  has_many :components
  belongs_to :category
  validates :name, presence: true
end
