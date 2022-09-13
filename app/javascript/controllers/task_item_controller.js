import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["state", "progression"];

  connect() {
    this.updateProgressBar()
  }

  toggle(event) {
    let formData = new FormData();
    formData.append("task_checklist_item[state]", this.stateTarget.checked);
    const token = document.getElementsByName("csrf-token")[0].content;

    fetch(`/task_checklist_items/${event.target.dataset.id}`, {
      body: formData,
      method: "PATCH",
      credentials: "include",
      dataType: "script",
      headers: {
        "X-CSRF-Token": token,
      },
    }).then(function (response) {
      if (response.status != 204) {
        event.target.checked = !event.target.checked;
      }
    });
    this.updateProgressBar()
  }

  updateProgressBar() {
    const checkedItems = [];

    this.stateTargets.forEach((target) => {
     if(target.checked) checkedItems.push(target)
    });

    this.progressionTarget.style.width = `${(checkedItems.length / this.stateTargets.length) * 100}%`;
  }
}
