

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

function changeTheme3(){
      document.documentElement.setAttribute('theme', '3');
}

function changeTheme4(){
      document.documentElement.setAttribute('theme', '4');
}


// ハンバーガーメニュー
document.querySelector('.line-list').addEventListener('click', function(){
	document.querySelector('.global-nav').classList.toggle('active');
	document.querySelector('.line-list').classList.toggle('active');
	document.querySelector('.menu-bg').classList.toggle('black');

	document.querySelector('.menu-bg').addEventListener('click', function(){
	document.querySelector('.global-nav').classList.remove('active');
	document.querySelector('.line-list').classList.remove('active');
	document.querySelector('.menu-bg').classList.remove('black');
	});
});






