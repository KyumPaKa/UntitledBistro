<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<!-- ๋ฐ์ฃผ?์ ๊ธฐ๋ฅ? ๊ธฐ๋ณธ?์ผ๋ก? ๋ฐ์ฃผ๊ณํ?์ฑ๊ณ? ?ก์ฌ?๋ค ?ค๋ง ?ต์ฌ?์ผ๋ก?

	๋ฐ์ฃผ?? ์กฐํ?? ๋ฐ์ฃผ?? ?ํฉ๊ณผ์ ?ฐ๊ณ?
	1. ๋ฐ์ฃผ๊ณํ?? ?๋ ฅ?? ?๋ฃ?? ?ฐ์ด?ฐ๋? ๋ถ๋ฌ??? ?์ฉ?ํฌ?? ?์ด?? ?๋ค. 
	   ?? ๊ฒฝ์ฐ?๋ [?์ฐฝ?ผ๋ก ๋ฐ์ฃผ๊ณํ?๋? ์กฐํ?์ฌ ์ฒดํฌ๋ฐ์ค ? ํ?? ?ตํด?? [?์ฉ]๋ฒํผ?ผ๋ก ?์ฉ?๋ค.
	2. ๋ฐ์ฃผ?? ?ํ๋ฅ? ์ถ๋ ฅ?๋ ?์ด๋ธ์ด ?์?๊ณ  ?ด๋? ?ธ์? ์ ?๋ ๊ธฐ๋ฅ?? ์ง?ํด?ผํ??
	3. ์ถ๊??์ผ๋ก? pdf excel email fax๋ก? ? ์ ?๋์ง ?ฌ๋?๋ฅ? ์ฒดํฌ?๋ค.
	
	๋ฐ์ฃผ?์?์ ?๋จ๋ฒํผ? ๋ฐ์ฃผ๊ณํ?์ฑ๊ณ? ?์ผ?์ฌ
	[์ฃผ์๋ฐ์ฃผ?๋ชฉ] (balju_save)
	 [?์?์?? 
	 [?์ ?ฌ๊ณ (?น์??์ ?ฌ๊ณ )] ?์ฒด ?ฌ๊ณ ?๊ณผ ?์ ?ฌ๊ณ ?์ ๊ณ์ฐ, ๋ฐ์ฃผ?์ ์กฐ์ ? ์ ?๋ ๋ฐฉ์?? ๊ณ ๋ ค?ด์ผ?๋ค.
	 
	?๋จ๋ฉ๋ด?? [??? [??? ๋ฐ? ?ํ ์ถ๋ ฅ] [?ค์?์ฑ] [๋ฐ์ฃผ?ํฉ]?? ?์ฉ?๋ค -->
<head>
	<style>
		.btn_space{
			margin-right: 5px;
		}
	</style>
<!-- ?ํ๋ฆ? link rel -->
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
<!-- ?ํ๋ฆ? link rel -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- ?? ?ด๊ฒ? ?ค์?ผ๋ฟ cdn -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- jsgrid ?ฌ์ฉ?? ?ํ jquery๋ฅ? cdn ?ฐ๊ฒฐ-->
<link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.css" />
<link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid-theme.min.css" />
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.js"></script>
<!-- jsgrid ?ฌ์ฉ?? ?ํ ?์?? ?์ cdn ?ฐ๊ฒฐ-->

<!-- jsgrid ?ฌ์ฉ?? ?ํ ?์?? ?์ cdn ?ฐ๊ฒฐ-->
<meta charset="UTF-8">
<title>๋ฐ์ฃผ?? ?์ฑ</title>
<script type="text/javascript">

	var openItemWin;

	function openItemList(){

		//๋ถ๋ชจ์ฐฝ
		window.name = "Balju";
		//?์์ฐฝ์??
		openItemWin = window.open("${path}/balju/popup/Item_list",'itemInfo',"width=500, height=600, toolbars=no");
		
		}
	// openItemList end
	
	var openResultWin;
	
	function openItemResult(){

		//๋ถ๋ชจ์ฐฝ
		window.name = "Balju";
		//?์์ฐฝ์??
		openResultWin = window.open("${path}/balju/popup/Item_Result",'itemInfo',"width=700, height=600, toolbars=no");
		}
	//openItemResult end
	
	var openBookMarkWin;

	function openBkList(){

		//๋ถ๋ชจ์ฐฝ
		window.name = "Balju";
		//?์์ฐฝ์??
		openBookMarkWin = window.open("${path}/balju/popup/BookMark_list", 'BookMark', "width=700, height=600, toolbars=no");
		}
	//openBookMark end
	
	function openBkInsert(){

		//๋ถ๋ชจ์ฐฝ
		window.name = "Balju";
		//?์์ฐฝ์??
		openBookMarkWin = window.open("${path}/balju/popup/BookMark_REG", 'BookMark', "width=900, height=600, toolbars=no");
		}

	var openBpWin;
	
	function openBaljuPlan(){

		//๋ถ๋ชจ์ฐฝ
		window.name = "Balju";
		//?์์ฐฝ์??
		openBpWin = window.open("${path}/balju/popup/BPlan_Load", 'Balju_Plan', "width=900, height=600, toolbars=no");
		}
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
							<h1>๋ฐ์ฃผ?๋ฑ๋ก?</h1>
						</div>
					</div>
				</div>
				<div class="col-sm-8">
					<div class="page-header float-right">
						<div class="page-title">
							<ol class="breadcrumb text-right">
								<li><a href="#"> ๋ฐ์ฃผ </a></li>
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
			<!-- <h5 class="heading-title mb-1 mt-4 text-secondary"> ๋ฐ์ฃผ ?๋ณด </h5><br> -->
			<div class="row">
				<div class="col-lg-3">
					<h6>๋ฐ์ฃผ??</h6>
					<section class="card">
						<div class="card-body text-secondary">${sessionScope.empregister_name}</div>
					</section>
				</div>
				<div class="col-lg-3">
					<h6>๋ฐ์ฃผ??</h6>
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
								style="margin-right:5px;" onclick="openItemList()">?ํ?๋ณด</button>
							<!-- <button type="button" class="btn btn-dark btn-sm" 
								style="margin-right:5px;">?์</button> -->
								<button type="button" class="btn btn-dark btn-sm" 
								style="margin-right:5px;" onclick="openBaljuPlan()">๋ฐ์ฃผ๊ณํ ๋ถ๋ฌ?ค๊ธฐ</button>
							<button type="button" class="btn btn-dark btn-sm" 
								style="margin-right:50px;"onclick="openItemResult()">?ฌ๊ณ ?ํฉ</button>
							<button type="button" class="btn btn-dark btn-sm" 
								style="margin-right:5px;" onclick="openBkList()">๊ด?ฌํ๋ช?</button>
								<button type="button" class="btn btn-dark btn-sm" 
								 onclick="openBkInsert()">๊ด?ฌํ๋ชฉ๋ฑ๋ก?</button>
						</div>
					</div>
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>?๋ชฉ์ฝ๋</th>
							<th>?๋ชฉ๋ช?</th>
							<th>๊ท๊ฒฉ</th>
							<th>?๋</th>
							<th>?จ๊?</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" id="code" readonly></td>
							<td><input type="text" id="name" readonly></td>
							<td><input type="text" id="stndr" readonly></td>
							<td><input type="text" id="qt" placeholder="?๋ ?๋ ฅ"></td>
							<td><input type="text" id="price" readonly></td>
							<td><button class="btn btn-dark" id="addData">?ฑ๋ก</button>
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
							๋ฐ์ฃผ๋ฌผํ ?๋ณด<small><code> ๊ด?ฌํ๋ชฉ์ ๋จผ์? ?ฑ๋ก?์ธ?? </code></small>
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
												return item.ORDER_PRODUCT_NAME +" ?ํ?? ?? ?์๊ฒ ์ต?๊น?";},

								fields : [
									{name:"ORDER_PRODUCT_CODE", type:"text", width:150, title:"?๋ชฉ์ฝ๋", readOnly:true},
									{name:"ORDER_PRODUCT_NAME", type:"text", width:150, title:"?๋ชฉ๋ช?", readOnly:true},
									{name:"ORDER_PRODUCT_STNDR", type:"text", width:150, title:"๊ท๊ฒฉ", readOnly:true},
									{name:"ORDER_QT", type:"text", width:150, title:"?๋"},
									{name:"ORDER_PR_EA", type:"text", width:150, title:"?จ๊?", readOnly:true},
									{name:"ORDER_WR", type:"text", width:150, title:"?์ฑ??", readOnly:true},
									{ type : 'control'}
									]
								
								});
						</script>
						<div class="card-footer">
							<button class="btn btn-primary btn-lg pull-right" onclick="insert()">?ฑ๋ก</button>
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
		alert("๋ฐ์ฃผ?์ด ์ถ๊??์?ต๋??")
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
		function insert(){
		var items = $("#jsGrid").jsGrid("option", "data");
		var flag = true;
		$.each(items,function(idx,row){
			if(items[idx].ORDER_QT<1||isNaN(items[idx].ORDER_QT)){
				alert("?๋?? ?ํ?? ?๋ ฅ?ด์ฃผ?ธ์");
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
				url: "${path}/balju_Input",
				success:function(result){
						var jsonResult = JSON.parse(JSON.stringify(result));
						if(jsonResult.result == "success"){
								alert(jsonResult.resultMsg);
								//sweetalert?? ?์ด?์ค ?๋๊ณ ๋ก ?ด๋?์ผ๋ณด์
							/* sweetAlert? ?ผ๋ฐ alert๊ณผ๋ ?ค๋ฅด๊ฒ? location.href?? ?์?ผ๋ก ?์ด?? ?ฐ๊ณ? ์ ?๊ณ  ๋ฐ๋ก ?คํ?ํด 
							swal({
								  title: jsonResult.resultMsg,
								  text: "?์ธ?? ?๋ฌ์ฃผ์ธ??",
								  icon: jsonResult.result,
								  button: "?์ธ",
								});  */
							location.href="${path}/balju/Balju"
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
//		var insertItem={};
		$.each(items, function(idx){
				console.log(items);
				$("#jsGrid").jsGrid("insertItem", items[idx]);
			});
		};

</script>
<script>
	function getReturnValue2(ORDPL_ORDLIN_NUM){
		console.log("๋ฐ์ฃผ๊ณํ๋ถ๋ฌ?ค๊ธฐ ์ฐฝ์?? ๊ฐ?ธ์จ ๋ฐ์ฃผ๊ณํ๋ชฉ๋ก๋ฒํธ : " + ORDPL_ORDLIN_NUM);
		var SearchParam = new Array();
		SearchParam.push(ORDPL_ORDLIN_NUM);
		console.log(SearchParam);
		$.ajax({
			method: "post",
			dataType: "json",
			contentType: "application/json",
			data: JSON.stringify(SearchParam),
			url: "${path}/balju/popup/BPlan_Search",
			success : function(list){
				$("#jsGrid").jsGrid({data : list});
				$("#jsGrid").jsGrid("loadData");
				
			//success end
			}
		//ajax end
		})
	//function end
	}
</script>
<script>
	/* $(document).ready(function(){
		$.ajax({
			url: "${path}/balju_Plan_Check",
			type: "post",
			success:function(result){
				console.log("๋ฆฌ์ ?ธ๊ฐ : " +result);
				console.log("๋ฆฌ์ ?ธ๋ฉ?ธ์?๊ฐ? : " + resultMsg);
				var jsonResult = (JSON.parse(JSON.stringify(result)));
					alert("๋ชฉ๋ก๋ฒํธ ?๋ฆฌ?๋ฃ");
				},
			error:function(){
					alert("?์?์ผ๋ก? ์ฒ๋ฆฌ?์? ?์?ต๋??");
				}
			});
		//.ready ์ข๋ฃ
		}); */
</script>
</html>