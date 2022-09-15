// Entry point for the build script in your package.json
import "@hotwired/turbo-rails";
import "./controllers";
import "bootstrap";
import { end } from "@popperjs/core";

document.addEventListener("turbo:load", () => {
  const dropupProfile = document.getElementById("dropup-profile");
  const dropupAdd = document.getElementById("dropup-add");

  const dropupRight = document.querySelector(".drp-cnt-right");
  const dropupCenter = document.querySelector(".drp-cnt-cent");

  dropupProfile.addEventListener("click", function (e) {
    e.preventDefault();
    if (dropupRight.style.right == "-220px") {
      dropupRight.style.right = "0px";
    } else {
      dropupRight.style.right = "-220px";
    }
  });

  if (dropupAdd) {
    dropupAdd.addEventListener("click", function (e) {
      e.preventDefault();
      if (dropupCenter.style.bottom == "-180px") {
        dropupCenter.style.bottom = "75px";
        dropupCenter.style.opacity = "1";
      } else {
        dropupCenter.style.bottom = "-180px";
        dropupCenter.style.opacity = "0";
      }
    });
  }
});
