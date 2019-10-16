<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>



<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

$("#WorkManagement").click(function(){
    $.ajax({
        type:"POST",
        url:"WorkManagement",
        data : JSON.stringify(Insa_ScheduleDTO),
        dataType : "json",
        success: function(result){
            console.log(xml);
        },
        error: function(xhr, status, error) {
            alert(error);
        }  
    });
});





</script>


</head>
<body>

	<div class="user-area dropdown float-right">

		${sessionScope.empregister_name }님이 로그인중입니다. <img
			alt="empregister_photo"
			src="${path}/resources/images/insa/${sessionScope.empregister_photo}"
			width="50" height="30"> <a href="${path }/logout">로그아웃</a>


		<!--       <div class="user-menu dropdown-menu">
                            <a class="nav-link" href="#"><i class="fa fa- user"></i>My Profile</a>

                            <a class="nav-link" href="#"><i class="fa fa- user"></i>Notifications <span class="count">13</span></a>

                            <a class="nav-link" href="#"><i class="fa fa -cog"></i>Settings</a>

                            <a class="nav-link" href="#"><i class="fa fa-power -off"></i>Logout</a>
                        </div> -->
	</div>
	
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button id="WorkManagement" class="btn btn-default">출근</button>
				<button type="button" id="" class="btn btn-default">퇴근</button>
			</div>
		</div>
</body>
</html>