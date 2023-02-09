/**
 * 
 */

// 아이디 중복 검사 
// onfocus : 포커스를 받은 경우 이벤트 설정
// onblur : 포커스가 해지될 때 이벤트 설정

$(document).ready(function() {
	$("#userName-text").onblur(function() {

		const duplicationurl = getContextPath() + "/duplicateInspection.do";
		var userName = $(this).val();

		if ($(this).val() === '') {
			$('#duplicate-Inspection').html('<b class="IdIsVaildText" id="fail" style="font-size: 14px; color: orange">아이디를 입력해주세요</b>');
		}
		else {
			$.ajax({
				url: duplicationurl,
				type: "GET",
				data: {
					"inputName": userName
				},
				contentType: "application/json; charset=UTF-8",
				success: function(
					result) {
					if (result === true) {
						$('#cron-result').html(
							'<b style="font-size: 14px; color: #39D452">회원가입이 가능한 아이디입니다.</b>');
					} else
						$('#cron-result').html(
								'<b class="IdIsVaildText" id="fail" style="font-size: 14px; color: #D42449">중복된 아이디입니다.</b>');
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
	});





});