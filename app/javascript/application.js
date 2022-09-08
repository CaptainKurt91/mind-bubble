// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"

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
