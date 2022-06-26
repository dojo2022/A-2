

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
// 三本線をクリックすると行われる処理
document.querySelector('.line-list').addEventListener('click', function(){

	// 各クラスに新しいクラスが追加されるよ
	document.querySelector('.global-nav').classList.toggle('active');
	document.querySelector('.line-list').classList.toggle('active');
	document.querySelector('.menu-bg').classList.toggle('black');

	// 黒背景をクリックすると行われる処理
	document.querySelector('.menu-bg').addEventListener('click', function(){

	// 各クラスから追加されたクラスが消えるよ
	document.querySelector('.global-nav').classList.remove('active');
	document.querySelector('.line-list').classList.remove('active');
	document.querySelector('.menu-bg').classList.remove('black');
	});
});






