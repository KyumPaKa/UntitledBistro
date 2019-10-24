<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>


<html>
<head>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
//주소?�보
		function test1(){
		var obj = document.EmpRegisterInsertForm;
		if(obj.empregister_name.value == '' ){
			swal('?�름?? ?�력?�세??');
			obj.empregister_name.focus();
			return false;
		}
		
		if(obj.empregister_jumin.length < 6 ){
			swal('주�??�록번호 ?�자리�? ?�확?? ?�력?�주?�요');
			obj.empregister_jumin.focus();
			return false;
		}
		if(obj.empregister_jumin2.length < 7 ){
			swal('주�??�록번호 ?�자리�? ?�확?? ?�력?�주?�요');
			obj.empregister_jumin2.focus();
			return false;
		}
		if(obj.empregister_empnum.value == '' ){
			swal('?�번?? ?�력?�세??');
			obj.empregister_empnum.focus();
			return false;
		}
		if($(':radio[name="empregister_gender"]:checked').length < 1){
			swal('?�별?? 체크?�주?�요 ');
			return false; 
			}
		if(obj.empregister_tel.length < 11 ){
			swal('?�드?�을 ?�확?? ?�력?�주?�요');
			obj.empregister_tel.focus();
			return false;
		}
		if(isNaN($("#empregister_tel").val)){
		swal('?�드?? 번호�? ?�자로만 ?�력?�주?�요');
		obj.empregister_tel.focus();
			}
		if(obj.empregister_age.value == '' ){
			swal('?�이�? ?�력?�세??');
			obj.empregister_age.focus();
			return false;
		}
		if(obj.sample4_postcode.value == '' ){
			swal('?�편번호�? ?�력?�주?�요');
			obj.sample4_postcode.focus();
			return false;
		}
		if(obj.empregister_grade.value == '' ){
			swal('직급?? ?�택?�주?�요 ');
			obj.empregister_grade.focus();
			return false;
		}
		if(obj.empregister_bankname.value == '' ){
			swal('?�?�을 ?�택?�주?�요 ');
			obj.empregister_bankname.focus();
			return false;
		}
		if(obj.empregister_accountholder.value == '' ){
			swal('?�금주�? ?�어주세?? ');
			obj.empregister_accountholder.focus();
			return false;
		}
		
		if(obj.empregister_banknum.value == '' ){
			swal('계좌번호�? ?�어주세?? ');
			obj.empregister_banknum.focus();
			return false;
		}

		if($(':radio[name="empregister_payclassfiy"]:checked').length < 1){
			swal('급여구분?? 체크?�주?�요 ');
			return false; 
			}

		if($(':radio[name="empregister_leavecompany"]:checked').length < 1){
			swal('?�직?��?�? 체크?�주?�요 ');
			return false; 
			}
		
			if(obj.empregister_paytime.value == '' && obj.empregister_payday.value == '' ){
			
			swal('급여�? ?�어주세?? ');
			obj.empregister_paytime.focus();
			return false;
		}
			
			if(obj.empregister_paytime.value != '' && obj.empregister_payday.value != '' ){
			
			swal('급여?? ?�나�? ?�어주세?? ');
			obj.empregister_paytime.focus();
			return false;
		}
		if(obj.empregister_workplan.value == '' ){
			swal('총근무시간을 ?�어주세?? ');
			obj.empregister_workplan.focus();
			return false;
		}
		var form = $('#insert')[0];
        var formData = new FormData(form);
        $.ajax({
              type: "POST",
              enctype: 'multipart/form-data',
              url: "EmpRegisterInsert",
              data: formData,
              processData: false,
              contentType: false,
              cache: false,
              success: function (result) {
                 swal({
                   title: result + "�? ?�록?�었?�니??.",
                   icon: "success",
                   button: "?�기",
                 }).then(() => {
                   opener.document.location.reload();
                   window.close();
                });
              },
          });

	}
	
	
	
	
	
	
	
	function sample4_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// ?�업?�서 검?�결�? ??��?? ?�릭?�을?? ?�행?? 코드�? ?�성?�는 부�?.

						// ?�로�? 주소?? ?�출 규칙?? ?�라 주소�? ?�시?�다.
						// ?�려?�는 변?��? 값이 ?�는 경우?? 공백('')값을 가지므�?, ?��? 참고?�여 분기 ?�다.
						var roadAddr = data.roadAddress; // ?�로�? 주소 변??
						var extraRoadAddr = ''; // 참고 ??�� 변??

						// 법정?�명?? ?�을 경우 추�??�다. (법정리는 ?�외)
						// 법정?�의 경우 마�?�? 문자가 "??/�?/가"�? ?�난??.
						if (data.bname !== '' && /[??�?가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 ?�고, 공동주택?? 경우 추�??�다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// ?�시?? 참고??��?? ?�을 경우, 괄호까�? 추�??? 최종 문자?�을 만든??.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}

						// ?�편번호?� 주소 ?�보�? ?�당 ?�드?? ?�는??.
						document.getElementById('sample4_postcode').value = data.zonecode;
						document.getElementById("sample4_roadAddress").value = roadAddr;
						document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

						// 참고??�� 문자?�이 ?�을 경우 ?�당 ?�드?? ?�는??.
						if (roadAddr !== '') {
							document.getElementById("sample4_extraAddress").value = extraRoadAddr;
						} else {
							document.getElementById("sample4_extraAddress").value = '';
						}

						var guideTextBox = document.getElementById("guide");
						// ?�용?��? '?�택 ?�함'?? ?�릭?? 경우, ?�상 주소?�는 ?�시�? ?��???.
						if (data.autoRoadAddress) {
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							document.getElementById("sample4_roadAddress").value = extraRoadAddr;
							guideTextBox.innerHTML = '(?�상 ?�로�? 주소 : '
									+ expRoadAddr + ')';
							guideTextBox.style.display = 'block';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							document.getElementById("sample4_jibunAddress").value = expJibunAddr;
							guideTextBox.innerHTML = '(?�상 지�? 주소 : '
									+ expJibunAddr + ')';
							guideTextBox.style.display = 'block';
						} else {
							guideTextBox.innerHTML = '';
							guideTextBox.style.display = 'none';
						}
						getlatlng(roadAddr, data.jibunAddress);
					}
				}).open();
	}

	

	
	
</script>
<style>
td {
	background-color: #FFFFFF;
	height: 30px;
}

.ti {
	font-weight: bold;
	font-size: 12px;
	text-align: center;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>
<body>
	<form name="insa/EmpRegisterInsertForm" id="insert"
		 method="post" enctype="multipart/form-data">
		<table cellspacing='1' cellpadding='0' border='0' bgcolor='#000000' align='center'>
			<tr>
			
				<td colspan='3' rowspan='3' width='120' class='ti'>
					<div class="row form-group">
					<div class="col col-md-3">
						<label for="file-input" class=" form-control-label">?�진</label>
					</div>
					<div class="col-12 col-md-9">
						<input type="file" id="file-input" name="file" class="form-control-file">
					</div>
				</div>
				</td>

				<td rowspan='2' class='ti' width='100'>?�명</td>
				<td rowspan='2' width='150'><input type="text"
					name="empregister_name" id="empregister_name"
					style="border: none; background: transparent; text-align: center"></td>
				<td colspan='2' class='ti' width='200'>�? �? ?? �? �? ??</td>
			</tr>
			<tr>
				<td colspan='2'><input type="text" name="empregister_jumin" id="empregister_jumin"
					style="border: none; background: transparent; text-align: center" maxlength="6">-<input
					type="password" name="empregister_jumin2" id="empregister_jumin2"
					style="border: none; background: transparent; text-align: center" maxlength="7" ></td>

			</tr>
			<tr>
				<td colspan='2' class='ti' width='100'>?�번 <input type="text"
					name="empregister_empnum" id="empregister_empnum"
					style="border: none; background: transparent; text-align: center">
				<td class='ti' colspan='1'>?�별
				<td class='ti'>??<input type="radio" name="empregister_gender" id="empregister_gender"
					value="??"> ??<input type="radio" name="empregister_gender" id="empregister_gender"
					value="??">

				</td>
			</tr>
			<tr>
				<td colspan='3' class='ti'>?�락�?</td>
				<td colspan='2' class='ti'><input type="text"
					name="empregister_tel" id="empregister_tel"
					style="border: none; background: transparent; text-align: center"></td>
				<td colspan='1' class='ti'>?�이</td>
				<td><input type="number" name="empregister_age" id="empregister_age"
					style="border: none; background: transparent; text-align: center"></td>
			</tr>
			<tr>
				<td class='ti' colspan='3' rowspan='2'>거주지</td>
				<td class='ti'><input type="button"  
					onclick="sample4_execDaumPostcode()" value="?�편번호 찾기"></td>
				<td><input type="text" id="sample4_postcode" placeholder="?�편번호"
					name="empregister_addr"></td>
				<td class='ti' rowspan='1' width='100'><input type="text"
					id="sample4_roadAddress" name="empregister_addr2"
					placeholder="?�로명주??"><br></td>
				<td rowspan='1'><input type="text" id="sample4_jibunAddress"
					name="empregister_addr3" placeholder="지번주??"></td>

			</tr>
			<tr>
				<td>
				<td class='ti'><input type="text" id="sample4_detailAddress"
					name="empregister_addr4"  placeholder="?�세주소"></td>

				<td class='ti'>직급</td>
				<td><select name="empregister_grade" id="empregister_grade">
						<option value="매니??">매니??</option>
						<option value="?�원" selected="selected">?�원</option>
				</select></td>
			</tr>
			<tr>
				<td class='ti' colspan='3'>?�?�명</td>
				<td class='ti' colspan="2"><select name="empregister_bankname" id="empregister_bankname">
						<option value="?�나?�??">?�나?�??</option>
						<option value="�???�??">�???�??</option>
						<option value="기업?�??" selected="selected">기업?�??</option>
				</select></td>


				<td class='ti' width='100'>?�금�?</td>

				<td><input type="text"
					style="border: none; background: transparent; text-align: center"
					name="empregister_accountholder" id="empregister_accountholder" ></td>

			</tr>
			<tr>
				<td colspan='3' class='ti'>계좌번호</td>
				<td class='ti' colspan="2"><input type="text"
					style="border: none; background: transparent; text-align: center"
					name="empregister_banknum" id="empregister_banknum"></td>
				<td colspan='1' class='ti'>급여 구분</td>
				<td>?�급<input type="radio" name="empregister_payclassfiy" id="empregister_payclassfiy" value="?�급"> 
					?�급<input type="radio" name="empregister_payclassfiy" id="empregister_payclassfiy" value="?�급">
				
				</td>

			</tr>

			<tr>

				<td class='ti' colspan='3'>?�사 ?�짜</td>
				<td class='ti' colspan='2' name ="empregister_entryday"></td>
				<td colspan='1' class='ti' >?�직 ?��?</td>
				<td colspan='2'>?�직�?<input type="radio" name="empregister_leavecompany"
				id="empregister_leavecompany"
				value="?�직�?"> ?�직<input type="radio"
				value="?�직"  name="empregister_leavecompany" id="empregister_leavecompany" >
				</td>
			</tr>
			<tr> 
				<td class='ti' colspan='3'>?�급</td>

				<td colspan='2'><input type="number" name="empregister_paytime" id="empregister_paytime"
					style="border: none; background: transparent; text-align: center">천원</td>
				<td class='ti' colspan='1'>?�급</td>
				<td><input type="number" name="empregister_payday" id="empregister_payday"
					style="border: none; background: transparent; text-align: center">만원</td>
			</tr>
			<tr>
				<td colspan='3' class='ti'>�? 근무?�간</td>


				<td colspan='3'><input type="number"
					name="empregister_workplan" id="empregister_workplan">
				

				</td>
				<td>
					<input type="button" onclick="test1()" value="?�원?�록" />
					<input type="reset" value="취소" />
				</td>
			</tr>
	
			<tr>
		</table>
	</form>

</body>
</html>