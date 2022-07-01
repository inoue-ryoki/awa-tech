window.addEventListener('load', function () {
  const dot = document.getElementsByClassName("three_button");
  const delete_button = document.getElementsByClassName("delete");
  for (i = 0; i < dot.length; i++) {


    dot[i].addEventListener('click', function () {

      for (i = 0; i < delete_button.length; i++) {


        if (delete_button[i].getAttribute("style") == "display:block;") {
          delete_button[i].removeAttribute("style", "display:block;");




        } else {
          delete_button[i].setAttribute("style", "display:block;");




        }




      };
    });


  };

});
