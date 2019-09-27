<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<!-- jsgrid 사용을 위한 jquery를 cdn 연결-->
	<script 
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	
	<!-- jsgrid 사용을 위한 필요한 요소 cdn 연결-->
	<link type="text/css" rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.css" />
	<link type="text/css" rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid-theme.min.css" />
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.js"></script>
	
	<style type="text/css">
		#jsGrid {margin: auto;}
		.jsgrid-header-scrollbar {overflow: hidden;}
		.jsgrid-grid-body {overflow: hidden;}
	</style>
	
<title>JSP</title>
</head>
<body>
	<h1>입고현황</h1>

<!-- jsGrid 생성을 합니다.-->
   	<div id="jsGrid"></div>
	<script>
		var original = null;
		$.ajax({
			type:"get",
			url:"${path}/jaego/gridInItemSelectAll",
		})
		.done(function(json) {
			original = json;
			$("#jsGrid").jsGrid({
				width : "70%",
				height : "auto",
				filtering : true,
				//데이터 변경, 추가, 삭제대하여 자동으로 로드되게 함
				autoload : true,
				//그리드 헤더 클릭시 sorting이 되게함
				sorting : true,
				// 페이징 처리
				paging:true,
				pageSize : 10,
				pageButtonCount : 5,
				
				//json 배열을 데이터에 연결함.
				data : json, 
				//grid에 표현될 필드 요소
				fields : [ {
					name : "ii_product_code",
					type : "text",
					title: "품목코드",
					width : 100
				}, {
					name : "product_name",
					type : "text",
					title: "품목명",
					width : 100
				}, {
					name : "ii_qty",
					type : "text",
					title: "재고수량",
					width : 100
				}, {
					name : "ii_date",
					type : "text",
					title: "등록일자",
					width : 100
				},{
					type : "control", 
					editButton: false,                               // show edit button
                    deleteButton: false,                             // show delete button
                    clearFilterButton: true                        // show clear filter button
				}], 
			    
				controller : {
					loadData: function(filter) {
						if(filter.ii_product_code === "" && filter.product_name === "" && filter.ii_qty === "" && filter.ii_date === "") {
							return original;
						}
						
						var dd = original;
						if(filter.ii_product_code !== "") dd = valueTest(dd,"ii_product_code",filter);
						if(filter.product_name !== "") dd = valueTest(dd,"product_name",filter);
						if(filter.ii_qty !== "") dd = valueTest(dd,"ii_qty",filter);
						if(filter.ii_date !== "") dd = valueTest(dd,"ii_date",filter);
						
						return dd;
					}
			
				}
				
			}); // 그리드 끝
		}); // ajax 끝
		
		function valueTest(arr,condition,filter) {
			return $.grep(arr, function(i) {
				if(condition == "ii_product_code") return i.ii_product_code.indexOf(filter.ii_product_code) != -1;
				if(condition == "product_name") return i.product_name.indexOf(filter.product_name) != -1;
				if(condition == "ii_qty") return String(i.ii_qty).indexOf(filter.ii_qty) != -1;
				if(condition == "ii_date") return i.ii_date.indexOf(filter.ii_date) != -1;
			});
		}
		
	</script>
	
</body>
</html>