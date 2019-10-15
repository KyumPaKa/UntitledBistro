// DatePicker 1개를 이용한 js

var today;
var year;

$(document).ready(function() {
	var nowDate = new Date();
	year = nowDate.getFullYear();
	yearBasic("year");
	today = dateFormat(nowDate);	
	dateBasic();
	$("#dateResult").text(today);
	
});

// 날짜 기본설정
function dateBasic() {
	$("#yearInput").hide();
	$("#year").show();
	var date = today.split("/");
	
	$("#year").val(date[0]);
	$("#month").val(date[1]);
	$("#day").val(date[2]);
	
	$("#date").val(today);
}

// 년도 기본설정
function yearBasic(year,yearInputVal) {
	$("#" + year + " option").remove();
	var todayYear = new Date().getFullYear();
	
	for(var i = todayYear+1; i>=todayYear-2; i--) {
		$("#" + year).append("<option value='" + i + "'>" + i);
	}
	
	if(yearInputVal != '' && yearInputVal != null) {
		$("#" + year).append("<option value='" + yearInputVal + "'>" + yearInputVal);
	}
	
	$("#" + year).append("<option value='directInput'>직접입력");
}

// 년도 직접입력
function yearInput(yearInputId,yearId) {
	var yearInput = $("#" + yearInputId);
	var year = $("#" + yearId);
	
	yearBasic(yearId, yearInput.val());
	yearInput.hide();
	year.show();
	year.val(yearInput.val()).prop("selected",true);
	
	if(yearInput.val() >= 1900 && yearInput.val() <= new Date().getFullYear()+1) {
		$("#year").css("border","");
	} else {
		alert("올바르지 않는 날짜형식 입니다.");
		$("#year").css("border","1px solid red");
	}
}

// 날짜 변경이 될 때 반영하기 (유효성 검사까지)
function yymmdd(dateId, year, month, day) {
	var date = $("#" + dateId).val().split("/");
	
	if(this.id == year) date[0] = this.value;
	if(this.id == month) date[1] = this.value;
	if(this.id == day) date[2] = this.value;
	
	var dateResult = dateFormat(new Date(date[0] + "/" + date[1] + "/" + date[2]));	
	
	if(dateResult != "NaN/NaN/NaN" && date[0] >= 1900 && date[0] <= (new Date().getFullYear()+1)) {
		$("#" + date).val(dateResult);
		
		var date = dateResult.split("/");
		
		$("#" + year).val(date[0]);
		$("#" + month).val(date[1]);
		$("#" + day).val(date[2]);
	} else {
		alert("올바르지 않는 날짜형식입니다.");
	}
}

// 년,월,일 변경할때(달력그림x) 
$("#yy-mm-dd input, #yy-mm-dd select," +
		"#yy-mm-dd2 input, #yy-mm-dd2 select").on("change", function() {
	
	// 년도 직접입력 입력했을때 
	if(this.id == "yearInput") {
		yearInput("yearInput", "year");
		$("#yearInput").hide();
		$("#year").show();
		return;
	}
	
	// 년도 직접입력 선택했을때 
	if(this.id == "year" && this.value == "directInput") {	
		$("#yearInput").val("");
		$("#yearInput").show();
		$("#" + this.id).hide();
		return;
	}
	
	// 데이트피커로 날짜를 변경한 경우 
	if(this.id == "date") {
		yymmdd("date","year","month","day");
	}
	
	// 년,월,일 1개이상 변경이 된 경우
	if(this.id == "year" || this.id == "month" || this.id == "day") {
		var year = $("#year").val();
		var month = $("#month").val();
		var day = $("#day").val();
		
		$("#date").val(year + "/" + month + "/" + day);
		if(this.id == "year") $("#year").css("border","");
	}
});

// 날짜형식 바꾸기
function dateFormat(format) {
    var year = format.getFullYear();
    
    var month = format.getMonth() + 1;
    if(month<10) month = '0' + month;
    
    var date = format.getDate();
    if(date<10) date = '0' + date;

    return year + "/" + month + "/" + date;

}

// DatePicker 기본설정
$(function(){

    $('.input-group.date').datepicker({
        calendarWeeks: false,
        todayHighlight: true,
        autoclose: true,
        buttonImageOnly: true,
        format: "yyyy/mm/dd",
        language: "kr"

    });

});

// DatePicker 한글로 변경
;(function($){
	$.fn.datepicker.dates['kr'] = {
		days: ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일", "일요일"],
		daysShort: ["일", "월", "화", "수", "목", "금", "토", "일"],
		daysMin: ["일", "월", "화", "수", "목", "금", "토", "일"],
		months: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
		monthsShort: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
	};
}(jQuery));