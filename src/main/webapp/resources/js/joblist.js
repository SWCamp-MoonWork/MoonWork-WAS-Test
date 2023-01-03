
var myModal = document.getElementById('myModal')
var myInput = document.getElementById('myInput')

myModal.addEventListener('shown.bs.modal', function () {
  myInput.focus()
})




function delbtn(){
    alert('정말 삭제하시겠습니까?');
}