
'use strict'

$(function() {
  function toggleNav() {
    let body = document.body;
    let hamburger = document.getElementById("js-hamburger");
    let cancel = document.getElementById("cancel");

    // クリックしたときにクラス付与
    hamburger.addEventListener("click", function() {
      body.classList.toggle("nav-open");
      hamburger.classList.toggle("active");
    });

    // クリックしたときにクラス付与
    blackBg.addEventListener("click", function() {
      body.classList.remove("nav-open");
      hamburger.classList.remove("active");
    });
  }
  toggleNav();
});