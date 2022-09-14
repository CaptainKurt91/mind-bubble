module AddStartTime
  extend ActiveSupport::Concern  # for the given article/event returns the first comment
  def start_time
    self.end_date
  end
end
