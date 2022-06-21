


(function() {
  function toggleNav() {
    var body = document.body;
    var hamburger = document.getElementById("js-hamburger");
    var blackBg = document.getElementById("js-menu-bg");
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