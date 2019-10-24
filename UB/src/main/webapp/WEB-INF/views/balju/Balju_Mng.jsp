<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<!-- 발주?? 검?? 창에?�는 ?�자?� ?�목코드만을 ?�력받아?? 발주건에 ?�?? 검?�을 진행?�다.

	1.?�력창에 존재?�야 ?�는�? 1?�자 (?�이?��??�트?�인지) ?�이?�피커�? ?�해?? ?�자범위�? 지?�하�?
	?�목코드�? 골라?? ?�당 ?�목?? 존재?�는 [진행?�태]칼럼?? [진행�??? ?�이?��? 검?�한?? 
	
	2.?�에?�?�서 금일,?�일,금주,?�주,금월,?�월?? ?�?�하?? 검?�버?�을 각각 ?�성?�다.
	ajax 처리?? ??��?� ?�으�? 검?? 결과?? Balju_result�? ?�겨준??-->


<head>
<!-- ?�플�? link rel -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="apple-touch-icon" href="https://i.imgur.com/QRAUqs9.png">
<link rel="shortcut icon" href="https://i.imgur.com/QRAUqs9.png">


<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800'
	rel='stylesheet' type='text/css'>
<!-- ?�플�? link rel -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- jsgrid ?�용?? ?�한 jquery�? cdn ?�결-->
<link type="text/css" rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.css" />
<link type="text/css" rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid-theme.min.css" />
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.js"></script>
<!-- jsgrid ?�용?? ?�한 ?�요?? ?�소 cdn ?�결-->
<meta charset="UTF-8">
<title>발주 계획 ?�성</title>
</head>
<body>
	<!-- header -->
	<div class="breadcrumbs">
		<div class="breadcrumbs-inner">
			<div class="row m-0">
				<div class="col-sm-4">
					<div class="page-header float-left">
						<div class="page-title">
							<h1>발주?��?�?</h1>
						</div>
					</div>
				</div>
				<div class="col-sm-8">
					<div class="page-header float-right">
						<div class="page-title">
							<ol class="breadcrumb text-right">
								<li><a href="${path}/balju/Balju_Mng_All" > ?�체 </a></li>
								<li><a href="${path}/balju/Balju_Mng" > 진행�? </a></li>
								<li><a href="${path}/balju/Balju_Com" > ?�료 </a></li>
								<!-- <li class="active">Basic</li> -->
							</ol>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- header -->
	<div class="content">
		<div class="animated fadeIn">
			<!-- <h5 class="heading-title mb-1 mt-4 text-secondary"> 발주 ?�보 </h5><br> -->
			<div class="row">
				<!-- body -->
				<div class="col-md-12">
					<div class="card">
						<div class="card-header">
							발주?? 관�?<small><code> ?? 부분�? ?�시?��? </code></small>
						</div>
						<div class="card-body">
							<table class="table table-striped table-hover">
								<thead style="text-align: center;">
									<tr>
										<th width=25px;><input type="checkbox" name="checkAll" 
											id="checkAll_prime" onclick="checkAll()"></th>
										<th width=100px;>발주번호</th>
										<th width=200px;>?�자</th>
										<th width=150px;>?�당??</th>
										<th>?�목</th>
										<th>�? 금액</th>
										<th>종결</th>
									</tr>
								</thead>
								<tbody style="text-align: center;">
									<c:forEach var="Mng" items="${Mng_list}" varStatus="status">
										<tr>
											<td><input type="checkbox" name="checkRow"
												value="${status.count}"></td>
											<td>${Mng.ORDER_ORDIN_NUM}</td>
											<td>${Mng.ORPLIN_DATE}</td>
											<td>${Mng.ORDER_WR}</td>
											<td>${Mng.ORDER_PRODUCT_NAME}??${Mng.ORDER_PRODUCT_COUNT}�?</td>
											<td>${Mng.TOTAL_PR}</td>
											<td><input type="button" class="endBtn" 
													style="background-color: transparent !important;
													background-image: none !important;
													border-color: transparent;
													border: none;
													color: #007BFF;" value="${Mng.ORDER_END}"/></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="card-footer">
							<button class="btn btn-dark btn-lg pull-left"
								style="margin-right: 20px;" onclick="location.href='${path}/balju/Balju'">?�규</button>
							<button class="btn btn-dark btn-lg pull-left" 
								onclick="deleteCheck()">?�택??��</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- .animated -->
	</div>
	<!-- .content -->
	<div class="clearfix"></div>
	
	
<script>
	//체크박스 ?�체?�택
	function checkAll(){
		if($("#checkAll_prime").is(":checked")){
				$("input[name=checkRow]").prop("checked",true);
		}else{
				$("input[name=checkRow]").prop("checked",false);
			}
		}
</script>
<script>
	function deleteCheck(){
		var deleteRow =  new Array();
		var rowVal = new Object();
		var checkBox = $("input[name='checkRow']:checked");
		checkBox.each(function(idx){
			var tr = checkBox.parent().parent().eq(idx);
			var td = tr.children();

			rowVal = td.eq(1).text();
			//rowVal[idx] = $(this).val();
			console.log("rowVal�? 체크 : " + rowVal);
			deleteRow.push(rowVal)
			console.log("deleteRow�? 체크 : " + deleteRow); 
			})
		console.log("deleteRow�? 체크 : "+deleteRow);
		if(deleteRow==""){
			alert("??��?? ?�?�을 ?�택?�세??.");
			return false;
			}
		
		if(confirm("?�택?? 발주?��? ??��?�시겠습?�까?")){
				$.ajax({
					method : "post",
					dataType : "json",
					data : JSON.stringify(deleteRow),
					contentType : "application/json",
					url : "${path}/balju/deleteBalju",
					success : function(result){
						var jsonResult = JSON.parse(JSON.stringify(result));
						if(jsonResult.result == "success"){
								alert(jsonResult.resultMsg);
								location.href="${path}/balju/Balju_Mng"
						}else if(jsonResult.result == "failure"){
								alert(jsonResult.resultMsg);
								return false;
							}
						//success end
						}
					//ajax end
					});
			//if confirm end
			}
		
		
		}
</script>
<script>
	$('.endBtn').click(function(){
	
	var ynParam = $(this).attr('value'); //종결?�냐 취소??
	var endVal = $(this); // 버튼?�치
	var endParam = new Array();
	var data = new Object();
	
	console.log(ynParam);
	console.log(endVal);
	
		var tr = endVal.parent().parent();
		var td = tr.children();
		
				//발주번호 td.eq(1)
		data.ORDIN_NUM = td.eq(1).text();
		
		console.log("data�? 체크 : " + data);
				//종결�? 종결/취소 
				
		if(ynParam == "종결"){
			ynParam="취소";
		}else if(ynParam == "취소"){
			ynParam="종결";
			}
				
		data.ORDIN_END = ynParam;
		console.log("data�? 체크 : " + data);
		
		endParam.push(data);
		console.log("endParam�? 체크 : " + endParam);
		
	if(confirm("?�당 발주?�의 종결?��?�? 결정 ?�시겠습?�까?")){
			$.ajax({
				method : "post",
				dataType : "json",
				data : JSON.stringify(endParam),
				contentType : "application/json",
				url : "${path}/balju/BaljuEnd",
				success : function(result){
					var jsonResult = JSON.parse(JSON.stringify(result));
					if(jsonResult.result == "success"){
							alert(jsonResult.resultMsg);
							location.href="${path}/balju/Balju_Mng?isRiskItemCount=" + jsonResult.riskItemCount;
					}else if(jsonResult.result == "failure"){
							alert(jsonResult.resultMsg);
							return false;
					}
					//success end
				}
					
				//ajax end
			});
		//if confirm end
		}
	
	});
</script>
</body>
</html>

