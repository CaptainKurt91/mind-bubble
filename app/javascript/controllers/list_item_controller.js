import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["state", "progression"];

  connect() {
    this.updateProgressBar()
  }

  toggle(event) {
    console.log(event.currentTarget.checked)
    let formData = new FormData();
    formData.append(`${event.target.dataset.name}_checklist_item[state]`, event.currentTarget.checked);
    const token = document.getElementsByName("csrf-token")[0].content;

    fetch(`/${event.target.dataset.name}_checklists/4/${event.target.dataset.name}_checklist_items/${event.target.dataset.id}/update`, {
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
  "/category_checklist_items/10/update"
  updateProgressBar() {
    const checkedItems = [];

    this.stateTargets.forEach((target) => {
     if(target.checked) {
      checkedItems.push(target)
      }
    });

    this.progressionTarget.style.width = `${(checkedItems.length / this.stateTargets.length) * 100}%`;
  }
}
