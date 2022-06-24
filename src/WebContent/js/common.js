


// テーマカラーの切り替え
function changeTheme0() {
      document.documentElement.setAttribute('theme', '0');
}

function changeTheme1(){
      document.documentElement.setAttribute('theme', '1');
}

function changeTheme2(){
      document.documentElement.setAttribute('theme', '2');
}



// ハンバーガーメニューの作り方
$(function() {
  function toggleNav() {
    var body = document.body;
    var hamburger = document.getElementById("js-hamburger");
    var blackBg = document.getElementById("js-menu-bg");
    // クリックしたときにクラス付与
    hamburger.addEventListener("click", function() {
      body.classList.toggle("menu-open");
      hamburger.classList.toggle("active");
    });
    // クリックしたときにクラス付与
    blackBg.addEventListener("click", function() {
      body.classList.remove("menu-open");
      hamburger.classList.remove("active");
    });
  }
  toggleNav();
});











