/**
 * 
 */

// 아이디 중복 검사 
// onfocus : 포커스를 받은 경우 이벤트 설정
// onblur : 포커스가 해지될 때 이벤트 설정
	
function userdelbtn(arg) {
	if (window.confirm('정말 삭제하시겠습니까?')) {
		// They clicked Yes
		var user_id = $(arg).val();
		console.log(user_id);
		var deluser_url = getContextPath() + "/deleteuser.do";
		$.ajax({
			url: deluser_url,
			type: "GET",
			data: {
				deluserId : user_id
			},
			contentType: "application/json; charset=UTF-8",
			success: function(data) {
				alert("유저가 삭제되었습니다.");
				location.reload();
			},
			error: function(error) {
				alert("에러....." + error);
			}
		});

	}
	else {

	}
}

$(document).ready(function() {


	
		document.querySelector("#userName-text").onblur = function() {
		const duplicationurl = getContextPath() + "/duplicateInspection.do";
		var inputName = $(this).val();
		console.log(inputName);

		if ($(this).val() === '') {
			$('#duplicate-Inspection').html('<b class="IdIsVaildText" id="fail" style="font-size: 14px; color: orange">아이디를 입력해주세요</b>');
		}
		else {
			$.ajax({
				url: duplicationurl,
				type: "GET",
				data: {
					username : inputName
				},
				contentType: "application/json; charset=UTF-8",
				success: function(result) {
					console.log(result);
					if (result === true) {
						console.log("사용가능");
						$('#duplicate-Inspection').html(
							'<b style="font-size: 14px; color: #39D452">회원가입이 가능한 아이디입니다.</b>');
							
					} else{
						console.log("사용불가");
						$('#duplicate-Inspection').html(
								'<b class="usernameVaildText" id="fail" style="font-size: 14px; color: #D42449">중복된 아이디입니다.</b>');
					}
				},
				error: function(
					request,
					error) {
					alert("code: "
						+ request.status
						+ "\n"
						+ "message: "
						+ request.responseText
						+ "\n"
						+ "error: "
						+ error);

				}
			});
		}
	};





});