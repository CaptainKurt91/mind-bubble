class Category < ApplicationRecord
  belongs_to :home
  validates :name, presence: true
end
