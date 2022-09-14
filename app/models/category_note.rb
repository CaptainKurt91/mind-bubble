class CategoryNote < ApplicationRecord
  include AddStartTime
  belongs_to :category
end
