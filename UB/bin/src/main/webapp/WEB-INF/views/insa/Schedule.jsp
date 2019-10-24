<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>?�정관�?</title>
<script src="${path }/resources/js/insa/jquery-3.1.1.min.js"></script>
<script src="${path }/resources/js/insa/bootstrap.min.js"></script> 
<link rel="stylesheet" href="${path }/resources/css/insa/bootstrap.min.css">
<link rel="stylesheet" href="${path }/resources/css/insa/bootstrap-theme.min.css">
<script type="text/javascript" src='${path }/resources/js/insa/sweetalert.min.js?ver=1'></script>
<link rel="stylesheet" type="text/css" href='${path }/resources/css/insa/sweetalert.css?ver=1.2'>
<script type="text/javascript" src="	${path }/resources/js/insa/stringBuffer.js"></script>
<script type="text/javascript" src="${path }/resources/js/insa/calendar.js"></script>
<script type="text/javascript" src="${path }/resources/js/insa/calendarSchdule.js"></script>
<style type="text/css">
thead {
    text-align: center;
}
thead td {
    width: 100px;
}
#tbody td {
    height: 150px;
}
#yearMonth {
    font: bold;
    font-size: 18px;
}
</style>
</head>
<body>
	<input type="hidden" id="calendarId" value="${calendarId}" />
	<table class="table table-bordered">
        <thead id='thead'>
            <tr>
                <td colspan="7">
                    <button type='button' class='btn btn-sm btn-warning'
                        id='moveFastPre' onclick="moveFastMonthPre()">«</button>
                     
                    <button type='button' class='btn btn-sm btn-warning' id='movePre'
                        onclick="moveMonthPre()">??</button>    <span
                    id='yearMonth'></span>   
                    <button type='button' class='btn btn-sm btn-warning' id='moveNext'
                        onclick="moveMonthNext()">??</button>  
                    <button type='button' class='btn btn-sm btn-warning'
                        id='moveFastNext' onclick="moveFastMonthNext()">»</button>
                    <div style="text-align: right;">
                        <span>${title}</span> <input class='btn btn-sm btn-info'
                            type="button" value="�?" onclick='tabWeek()' /> <input
                            class='btn btn-sm btn-info' type="button" value="??"
                            onclick='tabMonth()' /> 
                    </div>
                </td>
            </tr>
            <tr>
                <td>??<span class='week'></span></td>
                <td>??<span class='week'></span></td>
                <td>??<span class='week'></span></td>
                <td>??<span class='week'></span></td>
                <td>�?<span class='week'></span></td>
                <td>�?<span class='week'></span></td>
                <td>??<span class='week'></span></td>
            </tr>
        </thead>
        <tbody id='tbody'></tbody>
    </table>
    <!-- ?�정 ?�성 modal -->
    <div class="modal fade" id="schduleForm" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">×</button>
                    <h4 class="modal-title">?�정?�록</h4>
                </div>
                <div class="modal-body">
                    <form class='form-margin40' role='form' action="#" method='post'
                        id='frmSchdule'>
                        <div class='form-group'>
                            <label>?�목</label> <input type='text' class='form-control'
                                id='summary' name='summary'
                                placeholder="??: ?�후 7?�에 멕시�? ?�식?�에?? ?�?�식??">
                        </div>
                        <div class='form-group'>
                            <label>출근?�각</label> <input class='form-control' type="time"
                                id='schedule_workingstarttime' name='schedule_workingstarttime'>
                        </div>
                        <div class='form-group'>
                            <label>출근?�짜</label> <input class='form-control startDate'
                                type="date" id='schedule_workingstartday' name='schedule_workingstartday' readonly="readonly">
                        </div>
                        <div class='form-group'>
                            <label>?�근?�각</label> <input class='form-control' type="time"
                                id='schedule_workingendtime' name='schedule_workingendtime'>
                        </div>
                        <div class='form-group'>
                            <label>?�근?�짜</label> <input class='form-control startDate'
                                type="date" id='schedule_workingendday' name='schedule_workingendday'>
                        </div>
                        <div class='modal-footer'>
                            <input type="button" class='btn btn-sm btn-warning' value="?�인"
                                onclick="calendarSchduleAdd()" /> <input type="reset"
                                class='btn btn-sm btn-warning' value="초기??" /> <input
                                type='button' class='btn btn-sm btn-warning'
                                data-dismiss='modal' value="취소" />
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- ?�정 ?�정 modal -->
    <div class="modal fade" id="schduleFormModify" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">×</button>
                    <h4 class="modal-title">?�정?�정</h4>
                </div>
                <div class="modal-body">
                    <form class='form-margin40' role='form' action="#" method='post'
                        id='frmSchduleModify'>
                        <div class='form-group'>
                            <label>?�목</label> <input type='text' class='form-control'
                                id='modifySummary' name='summary'>
                        </div>
                        <div class='form-group'>
                            <label>?�용</label>
                            <textarea rows="7" class='form-control' id="modifyDescription"
                                name='description'></textarea>
                        </div>
                        <input type="hidden" id="modifyEventId" name="eventId" /> <input
                            type="hidden" name="calendarId" value="${calendarId}" />
                        <div class='modal-footer'>
                            <input type="button" class='btn btn-sm btn-warning' value="?�인"
                                onclick="modifyEvent()" /> <input type="reset"
                                class='btn btn-sm btn-warning' value="초기??" /> <input
                                type='button' class='btn btn-sm btn-warning'
                                data-dismiss='modal' value="취소" />
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
