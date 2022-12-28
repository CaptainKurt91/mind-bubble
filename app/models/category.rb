class Category < ApplicationRecord
  include PgSearch::Model
  belongs_to :home

  has_many :tasks, dependent: :delete_all
  has_many :category_notes, dependent: :delete_all
  has_many :category_files, dependent: :delete_all
  has_many :category_checklists, dependent: :delete_all

  validates :title, presence: true

  multisearchable against: :title

  def self.today_show(user)
    today = "#{Date.today.year}-#{Date.today.month}-#{Date.today.day}"
    category_note = CategoryNote.where("user_id = ? AND end_date = ?", user, today)
    category_checklist = CategoryChecklist.where("user_id = ? AND end_date = ?", user, today)
    task_note = TaskNote.where("user_id = ? AND end_date = ?", user, today)
    task_checklist = TaskChecklist.where("user_id = ? AND end_date = ?", user, today)
    category_note + category_checklist + task_note + task_checklist
  end
end
