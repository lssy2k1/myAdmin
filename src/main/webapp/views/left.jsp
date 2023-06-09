<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- partial:partials/_sidebar.html -->
<nav class="sidebar sidebar-offcanvas" id="sidebar">
    <ul class="nav">
        <c:if test="${loginadm == null}">
        <li class="nav-item">
            <a class="nav-link" href="/">
                <i class="icon-grid menu-icon"></i>
                <span class="menu-title">대시보드</span>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="https://101.101.217.220:8443/">
                <i class="icon-tag menu-icon"></i>
                <span class="menu-title">수강생 페이지 접속</span>
            </a>
        </li>
        </c:if>
        <c:if test="${loginadm != null}">
            <li class="nav-item">
                <a class="nav-link" href="/">
                    <i class="icon-grid menu-icon"></i>
                    <span class="menu-title">대시보드</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
                    <i class="icon-head menu-icon"></i>
                    <span class="menu-title">수강생</span>
                    <i class="menu-arrow"></i>
                </a>
                <div class="collapse" id="ui-basic">
                    <ul class="nav flex-column sub-menu">
                        <li class="nav-item"> <a class="nav-link" href="/stdn/all">수강생 목록</a></li>
                        <li class="nav-item"> <a class="nav-link" href="/stdn/attd">출석</a></li>
                    </ul>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="collapse" href="#form-elements" aria-expanded="false" aria-controls="form-elements">
                    <i class="icon-book menu-icon"></i>
                    <span class="menu-title">강의</span>
                    <i class="menu-arrow"></i>
                </a>
                <div class="collapse" id="form-elements">
                    <ul class="nav flex-column sub-menu">
                        <li class="nav-item"><a class="nav-link" href="/lec/all">강의 목록</a></li>
                        <c:if test="${loginadm.lev>=3}">
                        <li class="nav-item"><a class="nav-link" href="/lec/sbj/add">강의코드 추가</a></li>
                        </c:if>
                    </ul>
                </div>
            </li>

            <li class="nav-item">
                <a class="nav-link" data-toggle="collapse" href="#charts" aria-expanded="false" aria-controls="charts">
                    <i class="icon-map menu-icon"></i>
                    <span class="menu-title">서비스 관리</span>
                    <i class="menu-arrow"></i>
                </a>
                <div class="collapse" id="charts">
                    <ul class="nav flex-column sub-menu">
                        <li class="nav-item"> <a class="nav-link" href="/ord/all">주문 내역 관리</a></li>
                        <li class="nav-item"> <a class="nav-link" href="/curri/all">커리큘럼 관리</a></li>
                        <li class="nav-item"> <a class="nav-link" href="/mrk/all">마커 리스트</a></li>
                    <%--                        <li class="nav-item"> <a class="nav-link" href="/orddetail/all">주문상세 관리(과목별)</a></li>--%>
<%--                        <li class="nav-item"> <a class="nav-link" href="/mrk/add">마커 추가</a></li>--%>

                    </ul>
                </div>
            </li>

            <li class="nav-item">
                <a class="nav-link" data-toggle="collapse" href="#ancs" aria-expanded="false" aria-controls="ancs">
                    <i class="icon-microphone menu-icon"></i>
                    <span class="menu-title">공지사항</span>
                    <i class="menu-arrow"></i>
                </a>
                <div class="collapse" id="ancs">
                    <ul class="nav flex-column sub-menu">
                        <li class="nav-item"> <a class="nav-link" href="/anc/all">공지사항</a></li>
                        <li class="nav-item"> <a class="nav-link" href="/anc/cal">일정관리</a></li>

                    </ul>
                </div>
            </li>
<%--            anc 하단 메뉴 추가--%>
<%--            <li class="nav-item">--%>
<%--                <a class="nav-link" data-toggle="collapse" href="/anc/all" aria-expanded="false" aria-controls="ancs">--%>
<%--                    <i class="icon-microphone menu-icon"></i>--%>
<%--                    <span class="menu-title">공지사항</span>--%>
<%--                </a>--%>
<%--                <div class="collapse" id="ancs">--%>
<%--                    <ul class="nav flex-column sub-menu">--%>
<%--                        <li class="nav-item"> <a class="nav-link" href="/anc/cal">일정관리</a></li>--%>
<%--                    </ul>--%>
<%--                </div>--%>
<%--            </li>--%>

            <c:if test="${loginadm.lev>=3}">
            <li class="nav-item">
                <a class="nav-link" href="/adm/all" aria-expanded="false" aria-controls="admin">
                    <i class="icon-star menu-icon"></i>
                    <span class="menu-title">관리자</span>
                </a>
            </li>
            </c:if>
        </c:if>
<%--        <li class="nav-item">--%>
<%--            <a class="nav-link" href="/trypage" aria-expanded="false" aria-controls="trypage">--%>
<%--                <i class="icon-star menu-icon"></i>--%>
<%--                <span class="menu-title">Tryyyyyy</span>--%>
<%--            </a>--%>
<%--        </li>--%>
    </ul>
</nav>