<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script type="text/javascript">
function test1(){
	var obj = document.EmpRegisterUpdateForm
	if(obj.empregister_name.value == '' ){
		swal('?�름?? ?�력?�세??');
		obj.empregister_name.focus();
		return false;
	}
	if(obj.empregister_tel.length != 11 ){
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

	if($(':radio[name="empregister_payclassfiy"]').length < 1){
		swal('급여구분?? 체크?�주?�요 ');
		return false; 
		}
	if($(':radio[name="empregister_leavecompany"]').length < 1){
		swal('?�직?��?�? 체크?�주?�요 ');
		return false; 
		}
	if(obj.empregister_paytime.value == '' && obj.empregister_payday.value == '' ){
		swal('급여�? ?�어주세?? ');
		obj.empregister_paytime.focus();
		return false;
	}
	window.opener.location.reload();
	window.close();
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



function payclassfiy(){
	$("input:radio[name='empregister_payclassfiy']").is(":checked");
	
}



	
	

</script>
</head>

<body>
	<form name="EmpRegisterUpdateForm"  id="update" Action="EmpRegisterUpdate" method="post">
			<tr>
				<td colspan='3' rowspan='3' class='ti' >
					<div class="img-wrap" >
				<img src="${pageContext.request.contextPath}/resources/images/insa/${ b.empregister_photo }" width="120" height="120">
				</div>
				</td>
				<td rowspan='2' class='ti' width='100'>?�명</td>
				<td rowspan='2' class='ti'>${b.empregister_name}</td>
				<td colspan='2' class='ti' width='200'>�? �? ?? �? �? ??</td>
			</tr>
			<tr>
				<td colspan='2'class='ti'>${b.empregister_jumin }-${b.empregister_jumin2 }</td>

			</tr>
			<tr>
				<td colspan='1' class='ti' width='100'>?�번</td>
					<td class='ti'>${b.empregister_empnum }<input type="hidden" name="empregister_empnum" value="${b.empregister_empnum }"></td>
					<td class='ti' colspan='1'>?�별</td>
					<td class='ti'>${b.empregister_gender }</td>
			</tr>
			<tr>
				<td colspan='3' class='ti'>?�락�?</td>
				<td colspan='2' class='ti'><input type="text"
					name="empregister_tel" value="${b.empregister_tel }"></td>
				<td colspan='1' class='ti'>?�이</td>
				<td><input type="number" name="empregister_age" value="${b.empregister_age }"></td>
			</tr>
			<tr>
				<td class='ti' colspan='3' rowspan='2'>거주지</td>
				<td class='ti'><input type="button"
					onclick="sample4_execDaumPostcode()" value="?�편번호 찾기"></td>
				<td class='ti'><input type="text" id="sample4_postcode" value="${b.empregister_addr }"
					name="empregister_addr"></td>
				<td class='ti' rowspan='1'><input type="text"
					id="sample4_roadAddress" name="empregister_addr2"
					value="${b.empregister_addr2 }"><br></td>
				<td rowspan='1' class='ti'><input type="text" id="sample4_jibunAddress"
					name="empregister_addr3" value="${b.empregister_addr3 }"></td>

			</tr>
			<tr>
				<td class='ti'>?�세주소
				<td class='ti'><input type="text" id="sample4_detailAddress"
					name="empregister_addr4" value="${b.empregister_addr4 }"></td>

				<td class='ti'>직급</td>
				<td class='ti'><input type="text" name="empregister_grade"
					value="${b.empregister_grade}"></td>
			</tr>
			<tr>
				<td class='ti' colspan='3'>?�?�명</td>
				<td class='ti' colspan="2"><select name="empregister_bankname">
						<option value="?�나?�??">?�나?�??</option>
						<option value="�???�??">�???�??</option>
						<option value="기업?�??" selected="selected">${b.empregister_bankname }</option>
				</select></td>


				<td class='ti' width='100'>?�금�?</td>

				<td class='ti'><input type="text" name="empregister_accountholder" value="${b.empregister_accountholder}"></td>

			</tr>
			<tr>
				<td colspan='3' class='ti'>계좌번호</td>
				<td colspan='2'><input type="text" name="empregister_banknum" value="${b.empregister_banknum}"></td>
				<td colspan='1' class='ti' id="payclassfiy ">급여 구분</td>
				<td>?�급<input type="radio" id="payclassfiy1" name="empregister_payclassfiy" value="?�급">
				?�급<input type="radio" id="payclassfiy2"name="empregister_payclassfiy" value="?�급">
				</td>


			</tr>

			<tr>

				<td class='ti' colspan='3'>?�사 ?�짜</td>
				<td class='ti' colspan='2'><fmt:formatDate value="${b.empregister_entryday }"
						pattern="yyyy-MM-dd" /></td>
				<td colspan='1' class='ti' >?�직 ?��?</td>
				<td colspan='2'><input type="radio" name="empregister_leavecompany" value="?�직�?">?�직�?
				<input type="radio" name="empregister_leavecompany" value="?�직">?�직
				</td>
			</tr>
			<tr>
				<td class='ti' colspan='3'>?�급</td>
<<<<<<<<< Temporary merge branch 1
				<td colspan='2'><input type="number" name="empregister_paytime" value="${b.empregister_paytime }">천원</td>
				<td class='ti' colspan='1'>?�급</td>
				<td colspan='2'><input type="number" name="empregister_payday" value="${b.empregister_payday }">만원</td>
=========
				<td colspan='2'><input type="number" name="empregister_pay" value="${b.empregister_pay }">천원</td>
				<td class='ti' colspan='1'>?�급</td>
				<td colspan='2'><!--<input type="number" name="empregister_pay" value="${b.empregister_pay }">-->만원</td>
>>>>>>>>> Temporary merge branch 2
				<td class='ti' colspan='3'>?�급</td>
				<td colspan='2'><input type="number" name="empregister_paytime" value="${b.empregister_paytime }">천원</td>
				<td class='ti' colspan='1'>?�급</td>
				<td colspan='2'><input type="number" name="empregister_payday" value="${b.empregister_payday }">만원</td>
				<td class='ti' colspan='3'>?�급</td>
				<td colspan='2'><input type="number" name="empregister_pay" value="${b.empregister_pay }">천원</td>
				<td class='ti' colspan='1'>?�급</td>
				<td colspan='2'><!--<input type="number" name="empregister_pay" value="${b.empregister_pay }">-->만원</td>

			</tr>
			<tr>
				<td colspan='3' class='ti'>총근무시�?</td>


				<td colspan='3'><input type="number"
					name="empregister_workplan" value="${b.empregister_workplan}">?�간<%-- <select id="empregister_workplan"
					name="empregister_workplan">
						<option value="empregister_workplan">?�간 ?�택</option>
						<%
							for (int i = 1; i <= 24; i++) {
						%>
						<option value="<%=i%>"><%=i + "??"%></option>
						<%
							}
						%>

				</select> --%></td>
				<td>
			<button  onclick="EmpregisterUpdate()" >?�록</button>
			<input type="submit">?�원 ?�정
			<button  onclick="EmpregisterUpdate()" >?�록</button>
				</td>
			</tr>
		</table>	
	</form>


</body>
</html>