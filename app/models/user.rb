class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :categories, dependent: :delete_all
  has_many :category_checklists, dependent: :delete_all
  has_many :category_checklist_items, dependent: :delete_all
  has_many :category_notes, dependent: :delete_all

  has_many :tasks, dependent: :delete_all
  has_many :task_checklists, dependent: :delete_all
  has_many :tasl_checklist_items, dependent: :delete_all
  has_many :task_notes, dependent: :delete_all
end
