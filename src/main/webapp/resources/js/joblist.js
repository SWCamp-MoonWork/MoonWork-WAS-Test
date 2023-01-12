
var myModal = document.getElementById('myModal')
var myInput = document.getElementById('myInput')

myModal.addEventListener('shown.bs.modal', function () {
  myInput.focus()
})



//삭제버튼
function delbtn(){
    alert('정말 삭제하시겠습니까?');
}


//JobName 클릭 시 Ajax 사용해서 하단에 데이터 뿌려주기

