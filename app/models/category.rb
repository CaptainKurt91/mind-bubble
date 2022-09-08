class Category < ApplicationRecord
  belongs_to :home
  has_many :tasks
  has_many_attached :photos
  validates :name, presence: true
end
