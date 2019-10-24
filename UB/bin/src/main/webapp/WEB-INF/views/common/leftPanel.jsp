<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!-- Left Panel -->
    <aside id="left-panel" class="left-panel">
        <nav class="navbar navbar-expand-sm navbar-default">
            <div id="main-menu" class="main-menu collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li class="active">
                        <a href="${path}/erp?empregister_empnum=<sec:authentication property='principal.username'/>"><i class="menu-icon fa fa-laptop"></i>?�황??</a>
                    </li>
                    <li class="menu-title">?�고관�?</li><!-- /.menu-title -->
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-cogs"></i>발주</a>
                        <ul class="sub-menu children dropdown-menu">     
                            <li><i class="fa fa-id-badge"></i><a href="${path}/balju/Balju_Plan">계획 ?�록</a></li>
                            <li><i class="fa fa-bars"></i><a href="${path}/balju/Balju_Plan_Result">계획 ?�황</a></li>
                            <li><i class="fa fa-id-card-o"></i><a href="${path}/balju/Balju">발주 ?�록</a></li>
                            <li><i class="fa fa-exclamation-triangle"></i><a href="${path}/balju/Balju_Mng">발주 관�?</a></li>
                            <li><i class="fa fa-spinner"></i><a href="${path}/balju/Balju_Result">발주 ?�황</a></li>
                        </ul>
                    </li>
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-table"></i>?�고</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="fa fa-square"></i><a href="${path}/jaego/item">?�고 ?�황</a></li>
                            <li><i class="fa fa-square"></i><a href="${path}/jaego/in_item">?�고 ?�역</a></li>
                            <li><i class="fa fa-square"></i><a href="${path}/jaego/out_item">출고 ?�역</a></li>
                            <li><i class="fa fa-square"></i><a href="${path}/jaego/change_item">?�고 변?�표</a></li>
                            <li><i class="fa fa-plus-square"></i><a href="${path}/jaego/defect_item">불량 ?�황</a></li>
                            <li><i class="fa fa-square"></i><a href="${path}/jaego/risk_item">?�험?�고 ?�황</a></li>
                            <li><i class="fa fa-plus-square"></i><a href="${path}/jaego/safe_item">?�전?�고 ?�황</a></li>
                        </ul>
                    </li>
                    
                    <li class="menu-title">매출관�?</li><!-- /.menu-title -->

                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-tasks"></i>주문</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-fort-awesome"></i><a href="${path}/jumun/erp/menuSetting.do">메뉴 관�?</a></li>
                            <li><i class="menu-icon ti-themify-logo"></i><a href="${path}/jumun/erp/tableSetting.do">?�이�? 관�?</a></li>
                        </ul>
                    </li>
                   
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-bar-chart"></i>결산</a>
                        <ul class="sub-menu children dropdown-menu">
                           <li><i class="menu-icon fa fa-line-chart"></i><a href="${path}/View_jungsan.html">결산 ?�황</a></li>
                            <li><i class="menu-icon fa fa-pie-chart"></i><a href="${path}/Day_DeadLine.html">결산 마감</a></li>
                        </ul>
                    </li>

                  
                    <li class="menu-title">?�사</li><!-- /.menu-title -->
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-glass"></i>?�원관�?</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-sign-in"></i><a href="${path}/insa/EmpRegisterList">직원 목록</a></li>
                            <li><i class="menu-icon fa fa-paper-plane"></i><a href="${path}/insa/EmpWorkList">근무 ?��?</a></li>
                            <li><i class="menu-icon fa fa-paper-plane"></i><a href="${path}/insa/PayCheck">급여</a></li>
                            <li><i class="fa fa-bars"></i><a href="${path }/insa/Schedule">?��? ?��?�?</a></li>
                        </ul>
                    </li>
                      <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-area-chart"></i>?�비??</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-map-o"></i><a href="${path}/Seobis/mList">?�원 관�?</a></li>
                            <li><i class="menu-icon fa fa-street-view"></i><a href="${path}/Seobis/jUs">?�원 ?�록</a></li>
                            <li><i class="fa fa-calendar-check-o"></i><a href="${path}/Seobis/Seobis_calendar">?�약 관�?</a></li>
                            <li><i class="menu-icon fa fa-map-o"></i><a href="${path}/Seobis/pList">?�인?? 관�?</a></li>
                            
                        </ul>
                    </li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </nav>
    </aside>
    <!-- /#left-panel -->