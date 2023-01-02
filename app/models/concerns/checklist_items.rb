module ChecklistItems
  extend ActiveSupport::Concern
  def update_checklist
    if @name == 'category'
      category_item
    else
      task_item
    end
  end

  def category_item
    @category_checklist_item = CategoryChecklistItem.find(params[:id])
    @category_checklist_item.update(category_checklist_item_params)

    respond_to do |format|
      format.js
    end
  end

  def task_item
    @task_checklist_item = TaskChecklistItem.find(params[:id])
    @task_checklist_item.update(task_checklist_item_params)

    respond_to do |format|
      format.js
    end
  end
end
