import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="item"
export default class extends Controller {
  connect() {}

  static targets = ["state"];
  toggle(event) {
    let formData = new FormData();
    formData.append("category_checklist_item[state]", this.stateTarget.checked);
    const token = document.getElementsByName("csrf-token")[0].content;

    fetch(`/category_checklist_items/${event.target.dataset.id}`, {
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
  }
}
