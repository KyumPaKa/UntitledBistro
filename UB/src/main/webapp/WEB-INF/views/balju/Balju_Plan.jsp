<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<!-- ?? jsp ?�일?�서?? ?�이?�입?? 처리�? ?�다
	1. 첫째�? ?�개?? ?�으�? ?�누?�서 ?�력 처리�? ?�며 
	  1?�에?�는 발주?�자?? ?�스?�이?�로 처리?�며 보여주기�? ?�뿐 직접?�으�? ?�력값이 ?�달?��??? ?�는??
	  ?�당?? ?�정?�는 부분이 ?�으�? ?�때?? ?�이?�값?? 바탕?�로 ?�서 ?�름?? 조회?�서 ?�어?�한??
	  그다?? 참조?�?? ?�는?? ?�때?? 2?�의 ?�이블이 ?�니?? 1?�의 ?�이블에?? ?�력?�며 ?�황조회?�서?? 1?�에?? ?�오?�록 ?�다
	 
	 [주요발주?�목]?�서?? ?�음?? ?�이?��? ?�?�트?�서 ?�창?�로 ?�워준?? [balju_save]
	 [?�요?�서?? bom??��?? ?�워주며
	 [?�전?�고(?��??�정?�고)]?�서?? ?�전?�고?� ?�재고�? 출력?�여 비교?��???. >>>>>>>>>>?�전?�고?� ?�요?? 기능?? ?�인?�자<<<<<<<<<<
	 
	 [?�??버튼?� ?�이?��? 컨트롤러�? ?�겨주며
	 [?�시?�성]?� ?�풋?�이?��? ?�린 ?�켜준??
	 [계획?�황]버튼?� balju_plan_result�? ?�동?�다.
	 
	 
	 2. 2?�에?�는 발주??��?? ?�성?�여?? ?�는?? ?�는 ?�하?? 값만?? ?�어?�야?��?�? ?�이쿼리?? append�? ?�용?�여 ?�력창을 ?�려?? ?�것?�다.
	 	?�한 ?�력??��?? 취합?�여 json ?�?�으�? ?�?�하?? 컨트롤러�? 보내?? ?�며(?�마??.. ?�떻�? ?�야?�는지?? 모름) 
	 	?��? 리스?�에 ?�아?? ?�비?�단?�로 보낸??.
	 	?�에 매퍼?�서 ?��? forEach�? ?�용?�여 ?�중 insert�? ?�목?�켜줘야 ?�것같다.
	 	
	 	2?�의 ?�량�? 공급가?? ?�단?�는 총수?? �? �? 발주?�을 ?�기?��???.
	 -->


<head>
	<style>
		.btn_space{
			margin-right: 5px;
		}
	</style>
<!-- ?�플�? link rel -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="apple-touch-icon" href="https://i.imgur.com/QRAUqs9.png">
<link rel="shortcut icon" href="https://i.imgur.com/QRAUqs9.png">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">

<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800'
	rel='stylesheet' type='text/css'>
<!-- ?�플�? link rel -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- ?? ?�것?� ?�윗?�럿 cdn -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- jsgrid ?�용?? ?�한 jquery�? cdn ?�결-->
<link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.css" />
<link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid-theme.min.css" />
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.js"></script>
<!-- jsgrid ?�용?? ?�한 ?�요?? ?�소 cdn ?�결-->

<!-- jsgrid ?�용?? ?�한 ?�요?? ?�소 cdn ?�결-->
<meta charset="UTF-8">
<title>발주 계획 ?�성</title>
<script type="text/javascript">

	var openItemWin;

	function openItemList(){

		//부모창
		window.name = "Balju_Plan";
		//?�식창셋??
		openItemWin = window.open("${path}/balju/popup/Item_list",'itemInfo',"width=500, height=600, toolbars=no");
		
		}
	var openResultWin;
	
	function openItemResult(){

		//부모창
		window.name = "Balju_Plan";
		//?�식창셋??
		openResultWin = window.open("${path}/balju/popup/Item_Result",'itemInfo',"width=700, height=600, toolbars=no");
		}

	var bookMarkWin;

	function openBkList(){

		//부모창
		window.name = "Balju";
		//?�식창셋??
		openBookMarkWin = window.open("${path}/balju/popup/BookMark_list", 'BookMark', "width=700, height=600, toolbars=no");
		}
	//openBookMark end
</script>
</head>
<body>
	<!-- header -->
	<div class="breadcrumbs">
		<div class="breadcrumbs-inner">
			<div class="row m-0">
				<div class="col-sm-4">
					<div class="page-header float-left">
						<div class="page-title">
							<h1>발주계획?�록</h1>
						</div>
					</div>
				</div>
				<div class="col-sm-8">
					<div class="page-header float-right">
						<div class="page-title">
							<ol class="breadcrumb text-right">
								<li><a href="#"> 발주 </a></li>
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
				<div class="col-lg-3">
					<h6>발주??</h6>
					<section class="card">
						<div class="card-body text-secondary">${sessionScope.empregister_name}</div>
					</section>
				</div>
				<div class="col-lg-3">
					<h6>발주??</h6>
					<section class="card">
						<div class="card-body text-secondary">${balju_date}</div>
					</section>
				</div>
			</div>
				
					
				
			<div class="row">
				<div class="col-lg-12">
				<div class="card">
					<div class="card-header">
						<div class="row"></div>
						<div class="col-lg-8">
							<button type="button" class="btn btn-dark btn-sm" 
								style="margin-right:5px;" onclick="openItemList()">?�품?�보</button>
							<button type="button" class="btn btn-dark btn-sm" 
								style="margin-right:5px;" onclick="openBkList()">관?�품�?</button>
							<button type="button" class="btn btn-dark btn-sm" onclick="openItemResult()">?�고?�황</button>
						</div>
					</div>
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>?�목코드</th>
							<th>?�목�?</th>
							<th>규격</th>
							<th>?�량</th>
							<th>?��?</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" id="code" readonly></td>
							<td><input type="text" id="name" readonly></td>
							<td><input type="text" id="stndr" readonly></td>
							<td><input type="text" id="qt" placeholder="?�량 ?�력"></td>
							<td><input type="text" id="price" readonly></td>
							<td><button class="btn btn-dark" id="addData">?�록</button>
						</tr>            
  					</tbody>
 				</table>
 				</div>
			</div>
			</div>
			<div class="row">
				<!-- body -->
				<div class="col-lg-12">
					<div class="card">
						<div class="card-header">
							발주물품 ?�보<small><code> ?? 부분�? ?�시?��? </code></small>
						</div>
						<div id="jsGrid"></div>
						<script>
							var Data = [];
							$("#jsGrid").jsGrid({
								width:"100%",
								height : "400px",
								autoload: true,
								filtering: true,
								sorting : true,
								editing : true,
								data : Data,
								 deleteConfirm: function(item){
												return item.ORDPL_PRODUCT_NAME +" ?�품?? ??��?�시겠습?�까?";},

								fields : [
									{name:"ORDER_PRODUCT_CODE", type:"text", width:150, title:"?�목코드", readOnly:true},
									{name:"ORDER_PRODUCT_NAME", type:"text", width:150, title:"?�목�?", readOnly:true},
									{name:"ORDER_PRODUCT_STNDR", type:"text", width:150, title:"규격", readOnly:true},
									{name:"ORDER_QT", type:"text", width:150, title:"?�량"},
									{name:"ORDER_PR_EA", type:"text", width:150, title:"?��?", readOnly:true},
									{name:"ORDER_WR", type:"text", width:150, title:"?�성??", readOnly:true},
									{ type : 'control'}
									]
								
								});
						</script>
						<div class="card-footer">
							<button id="fuck_js" class="btn btn-primary btn-lg pull-right" onclick="baljuSub()">?�록</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- .animated -->
	</div>
	<!-- .content -->
	<div class="clearfix"></div>
</body>
<script>
		$("#addData").click(function(){
		alert("발주?�이 추�??�었?�니??")
		var insertItem={};
		insertItem.ORDER_PRODUCT_CODE = $("#code").val();
		insertItem.ORDER_PRODUCT_NAME = $("#name").val();
		insertItem.ORDER_PRODUCT_STNDR = $("#stndr").val();
		insertItem.ORDER_QT = $("#qt").val();
		insertItem.ORDER_PR_EA = $("#price").val();
		insertItem.ORDER_WR = "${sessionScope.empregister_name}";
								
		console.log(insertItem);
		$("#jsGrid").jsGrid("insertItem", insertItem);

		$("#code").val("");
		$("#name").val("");
		$("#stndr").val("");
		$("#qt").val("");
		$("#price").val("");
		});
</script>
<script>
		function baljuSub(){
		var items = $("#jsGrid").jsGrid("option", "data");
		var flag = true;
			$.each(items,function(idx,row){
				if(items[idx].ORDER_QT<1||isNaN(items[idx].ORDER_QT)){
					alert("?�량?? ?�확?? ?�력?�주?�요");
					flag = false;
					return false;
				}
			})
		if(flag == false){
			return false;
		}else{	
		console.log(JSON.stringify(items));
			$.ajax({
				method: "post",
				dataType:"json",
				contentType: "application/json",
				data: JSON.stringify(items),
				url: "${path}/balju_Plan_Input",
				success:function(result){
						var jsonResult = JSON.parse(JSON.stringify(result));
						if(jsonResult.result == "success"){
								alert(jsonResult.resultMsg);
								
							/* sweetAlert?� ?�반 alert과는 ?�르�? location.href?? ?�속?�로 ?�어?? ?�계?�수 ?�고 바로 ?�행?�킴 
							swal({
								  title: jsonResult.resultMsg,
								  text: "?�인?? ?�러주세??",
								  icon: jsonResult.result,
								  button: "?�인",
								});  */
							location.href="${path}/balju/Balju_Plan"
							//window.location.reload(true);
							
						} else if (jsonResult.result == "failure"){
								aleart(jsonResult.resultMsg);
								return false;
							}
					//success end
					}
				//ajax end
				});
			}
		};
</script>
<script>
	function getReturnValue(items){
		console.log(items);
		var insertItem={};
		$.each(items, function(idx){
				console.log(items);
				$("#jsGrid").jsGrid("insertItem", items[idx]);
			});

		
		
		};
/* 		$("#jsGrid").jsGrid({data : items});
			$("#jsGrid").jsGrid("loadData"); */
			
</script>
<script>
	$(document).ready(function(){
		$.ajax({
			url: "${path}/balju_Plan_Check",
			type: "post",
			success:function(result){
				var jsonResult = (JSON.parse(JSON.stringify(result)));
					if(jsonResult.result=="success"){
						alert(jsonResult.resultMsg);
					}else if(jsonResult.result=="failure"){
						alert(jsonResult.resultMsg);
						}
					
				}
			});
		//.ready 종료
		});
</script>
</html>