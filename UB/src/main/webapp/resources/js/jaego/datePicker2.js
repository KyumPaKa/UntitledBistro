/**
 * 
 */

$(document).ready(function() {
	$("#yearInput").hide();
	$("#yearInput2").hide();
	yearBasic("year");
	yearBasic("year2");
	var today = dateFormat(new Date());
	var date = today.split("/");
	var month = date[1] -1;
	var year = date[0];
	if(month < 9)  month = "0" + month;
	if(month == 0) {
		month = 12;
		year = date[0] -1;
	}
	$("#year").val(year);
	$("#month").val(month);
	$("#day").val(date[2]);
	$("#year2").val(date[0]);
	$("#month2").val(date[1]);
	$("#day2").val(date[2]);
	
	$("#dateResult").text(year + "/" + month + "/" + date[2] + " ~ " + today);
	/*startDateVal = year + "/" + month + "/" + date[2];
	endDateVal = today;*/
});

/* 년(기본설정) */
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

/* 달력 클릭했을때 */
/*$("#date").on("change",function(){
	console.log("달력 클릭");
	var date = $("#date").val().split("/");
	$("#year").val(date[0]);
	$("#month").val(date[1]);
	$("#day").val(date[2]);
});*/

/* 년도 직접입력 */
function yearInput(yearInputId,yearId) {
	var yearInput = $("#" + yearInputId);
	var year = $("#" + yearId);
	console.log("aaaaaaaaaaaaaaaaaaaaaa");
	console.log(yearInput.val());
	console.log("bbbbbbbbbbbbbbbbbbbbbb");
	yearBasic(yearId, yearInput.val());
	yearInput.hide();
	year.show();
	year.val(yearInput.val()).prop("selected",true);
	if(yearInput.val() >= 1900 && yearInput.val() <= new Date().getFullYear()+1) {
		if(yearId == "year") {
			$("#yy-mm-dd").css("border","");
		} else if(yearId == "year2") {
			$("#yy-mm-dd2").css("border","");
		}
	} else {
		alert("올바르지 않는 날짜형식 입니다.");
		if(yearId == "year") {
			$("#yy-mm-dd").css("border","1px solid red");
		} else if(yearId == "year2") {
			$("#yy-mm-dd2").css("border","1px solid red");
		}
	}
}

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

/* 년,월,일 변경할때(달력그림x) */
$("#yy-mm-dd input, #yy-mm-dd select," +
		"#yy-mm-dd2 input, #yy-mm-dd2 select").on("change", function() {
			console.log("변화................");
			console.log(this.id);
	/* 년도 직접입력 입력했을때 */ 
	if(this.id == "yearInput") {
		console.log("111111111111111");
		yearInput("yearInput", "year");
		$("#yearInput").hide();
		$("#year").show();
		return;
	} else if (this.id == "yearInput2") {
		console.log("22222222222222222");
		yearInput("yearInput2", "year2");
		$("#yearInput2").hide();
		$("#year2").show();
		return;
	}
	/* 년도 직접입력 선택했을때 */ 
	if(this.id == "year" && this.value == "directInput") {	
		console.log("3333333333333333333");
		$("#yearInput").val("");
		$("#yearInput").show();
		$("#" + this.id).hide();
		return;
	} else if (this.id == "year2" && this.value == "directInput") {
		console.log("4444444444444444444");
		$("#yearInput2").val("");
		$("#yearInput2").show();
		$("#" + this.id).hide();
		return;
	}
	/* 달력 변경반영 */
	if(this.id == "date") {
		console.log("555555555555555555");
		yymmdd("date","year","month","day");
	} else if(this.id == "date2") {
		console.log("6666666666666666666");
		yymmdd("date2","year2","month2","day2");
	}
	
	if(this.id == "year" || this.id == "month" || this.id == "day") {
		var year = $("#year").val();
		var month = $("#month").val();
		var day = $("#day").val();
		$("#date").val(year + "/" + month + "/" + day);
		if(this.id == "year") $("#yy-mm-dd").css("border","");
		console.log($("#date").val());
	} else if(this.id == "year2" || this.id == "month2" || this.id == "day2") {
		var year = $("#year2").val();
		var month = $("#month2").val();
		var day = $("#day2").val();
		$("#date2").val(year + "/" + month + "/" + day);
		if(this.id == "year2") $("#yy-mm-dd2").css("border","");
		console.log($("#date2").val());
	}
});

/* 날짜형식 바꾸기 */
function dateFormat(format) {
    var year = format.getFullYear();
    
    var month = format.getMonth() + 1;
    if(month<10) month = '0' + month;
    
    var date = format.getDate();
    if(date<10) date = '0' + date;

    return year + "/" + month + "/" + date;

}

/* 달력기능 환경설정 */
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

/* 달력 한글로 변경 */
;(function($){
	$.fn.datepicker.dates['kr'] = {
		days: ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일", "일요일"],
		daysShort: ["일", "월", "화", "수", "목", "금", "토", "일"],
		daysMin: ["일", "월", "화", "수", "목", "금", "토", "일"],
		months: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
		monthsShort: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
	};
}(jQuery));