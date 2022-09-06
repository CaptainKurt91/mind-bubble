class Category < ApplicationRecord
  belongs_to :home
  has_many :tasks
  validates :name, presence: true
end
