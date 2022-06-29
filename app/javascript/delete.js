window.addEventListener('load', function () {
  const dot = document.getElementById("three_button");
  const delete_button = document.getElementById("delete");

  dot.addEventListener('click', function () {

    if (delete_button.getAttribute("style") == "display:block;") {
      delete_button.removeAttribute("style", "display:block;");
    } else {
      delete_button.setAttribute("style", "display:block;");
    }
  });

});
