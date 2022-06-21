/**
 *
 */
 'use strict;'

var modal = document.getElementById('resist_modal');
var btn = document.getElementById('open_modal');
var close = modal.getElementsByClassName('close')[0];
//新規登録へを押したらモーダルを表示する
btn.onclick = function() {
	  modal.style.display = 'block';
};
//×を押したらモーダルを閉じる
close.onclick = function() {
		  modal.style.display = 'none';
};


//編集画面用のモーダル
//var modal2 = document.getElementById('edit_modal');
//var btn2 = document.getElementById('open_modal2');
var close_btn = modal2.getElementsByClassName('close2')[0];//クラスは配列みたいになっている


//function disp()
function disp(indexNo){
	var modal2 = document.getElementById('edit_modal');
	var btn2 = document.getElementById('open_modal2'+indexNo);
	if(btn2.onclick){
		modal2.style.display = 'block';
	}
}

//新規登録へを押したらモーダルを表示する
//btn2.onclick = function() {
	//  modal2.style.display = 'block';
//};


//×を押したらモーダルを閉じる
close_btn.onclick = function() {
		  modal2.style.display = 'none';
};

window.onclick = function (event)  {
	if (event.target == modal) {

		modal.style.display = 'none';

	}else if(event.target == modal2){
		modal2.style.display = 'none';
	}
};



// When the user clicks outside the modal -- close it.
//window.onclick = function(event) {
//	if (event.target == modal2) {
//
//		modal2.style.display = 'none';
//	}
//};


</script>
<!-- テキストボックス追加のjs -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
'use strict'

var i = 1;
function addForm(){
	var input_data = document.createElement('input');
	input_data.type = 'text';
	input_data.id = 'inputform_' + i;
	var step = document.createElement('span');
	step.innerHTML = 'ステップ：';
	var br = document.createElement('br');
	var parent = document.getElementById('target');
	parent.appendChild(step);
	parent.appendChild(input_data);
	parent.appendChild(br);
	i++;
	return false;
}

//jQueryのやり方
//$(document).on("click", ".add", function() {
//    $(this).parent().clone(true).insertAfter($(this).parent());
//
//});

</script>