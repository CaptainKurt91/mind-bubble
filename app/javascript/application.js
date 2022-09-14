// Entry point for the build script in your package.json
import "@hotwired/turbo-rails";
import "./controllers";
import "bootstrap";

document.addEventListener("turbo:load", () => {
  const dropupProfile = document.getElementById("dropup-profile");
  const dropupAdd = document.getElementById("dropup-add");

  const dropupRight = document.querySelector(".drp-cnt-right");
  const dropupCenter = document.querySelector(".drp-cnt-cent");

  dropupProfile.addEventListener("click", function (e) {
    e.preventDefault();
    if (dropupRight.style.right == "-300px") {
      dropupRight.style.right = "5px";
    } else {
      dropupRight.style.right = "-300px";
    }
  });

  dropupAdd.addEventListener("click", function (e) {
    e.preventDefault();

    if (dropupCenter.style.display == "none") {
      dropupCenter.style.display = "block";
    } else {
      dropupCenter.style.display = "none"
    }
  });
});

document.addEventListener("turbo:load", () => {
  const listItems = document.querySelectorAll(".check-item");
  const checkedItems = [];

  listItems.forEach((item) => {
    if (item.checked) {
      checkedItems.push(item);
    }
    item.addEventListener("change", (e) => {
      e.preventDefault();
      if (item.checked) {
        checkedItems.push(item);
      } else {
        checkedItems.pop();
      }
      updateProgressBar();
    });
  });

  function updateProgressBar() {
    const test = listItems.length;
    const test2 = checkedItems.length;
    const progression = document.getElementById("progression");
    progression.style.width = `${(test2 / test) * 100}%`;
  }
  updateProgressBar();
});
