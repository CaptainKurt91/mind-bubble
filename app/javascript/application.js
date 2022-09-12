// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"

document.addEventListener("turbo:load", () => {
  const dropupMenu = document.getElementById("dropup");
  const dropup = document.querySelector(".dropup-content");
  dropupMenu.addEventListener("click", function(e) {
      e.preventDefault();
      if (dropup.style.right == "-300px") {
        dropup.style.right = "5px";
      } else {
        dropup.style.right = "-300px";
      }
    });
})


/* document.addEventListener("turbo:load", () => {
const listItems = document.querySelectorAll(".boolean");
const checkedItems = []


  listItems.forEach((item) => {
    item.addEventListener("change", (e) => {
      e.preventDefault();
      if (item.checked) {
        checkedItems.push(item);
      } else {
        checkedItems.pop();
      }

      const test = listItems.length;
      const test2 = checkedItems.length;

      const progression = document.getElementById("progression")
      progression.style.width = `${test2 / test * 100}%`
    })
  });

}); */
// console.log(listItems.checked)
