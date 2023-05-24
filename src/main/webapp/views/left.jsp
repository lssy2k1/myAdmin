<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- partial:partials/_sidebar.html -->
<nav class="sidebar sidebar-offcanvas" id="sidebar">
    <ul class="nav">
        <c:if test="${loginadm == null}">
        <li class="nav-item">
            <a class="nav-link" href="/">
                <i class="icon-grid menu-icon"></i>
                <span class="menu-title">Dashboard</span>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="http://172.16.21.53:8099/">
                <i class="icon-tag menu-icon"></i>
                <span class="menu-title">수강생 페이지 접속</span>
            </a>
        </li>
        </c:if>
        <c:if test="${loginadm != null}">
            <li class="nav-item">
                <a class="nav-link" href="/">
                    <i class="icon-grid menu-icon"></i>
                    <span class="menu-title">Dashboard</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
                    <i class="icon-head menu-icon"></i>
                    <span class="menu-title">Student</span>
                    <i class="menu-arrow"></i>
                </a>
                <div class="collapse" id="ui-basic">
                    <ul class="nav flex-column sub-menu">
                        <li class="nav-item"> <a class="nav-link" href="/student/all">List</a></li>
                        <li class="nav-item"> <a class="nav-link" href="/student/add">Add Student</a></li>
                    </ul>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="collapse" href="#form-elements" aria-expanded="false" aria-controls="form-elements">
                    <i class="icon-book menu-icon"></i>
                    <span class="menu-title">Lectures</span>
                    <i class="menu-arrow"></i>
                </a>
                <div class="collapse" id="form-elements">
                    <ul class="nav flex-column sub-menu">
                        <li class="nav-item"><a class="nav-link" href="/lecture/all">List</a></li>
                        <li class="nav-item"><a class="nav-link" href="/lecture/add">Add Lecture</a></li>
                    </ul>
                </div>
            </li>


            <li class="nav-item">
                <a class="nav-link" href="/study/all" aria-expanded="false" aria-controls="icons">
                    <i class="icon-paper-clip menu-icon"></i>
                    <span class="menu-title">Study</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="auth">
                    <i class="icon-circle-check menu-icon"></i>
                    <span class="menu-title">Test</span>
                    <i class="menu-arrow"></i>
                </a>
                <div class="collapse" id="auth">
                    <ul class="nav flex-column sub-menu">
                        <li class="nav-item"> <a class="nav-link" href="/test/all">List</a></li>
                        <li class="nav-item"> <a class="nav-link" href="/test/add">Register</a></li>
                        <li class="nav-item"> <a class="nav-link" href="/test/add">Score</a></li>
                    </ul>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="collapse" href="#charts" aria-expanded="false" aria-controls="charts">
                    <i class="icon-map menu-icon"></i>
                    <span class="menu-title">Markers</span>
                    <i class="menu-arrow"></i>
                </a>
                <div class="collapse" id="charts">
                    <ul class="nav flex-column sub-menu">
                        <li class="nav-item"> <a class="nav-link" href="/marker/all">List</a></li>
                        <li class="nav-item"> <a class="nav-link" href="/marker/add">Add Marker</a></li>
                    </ul>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/anc/all">
                    <i class="icon-microphone menu-icon"></i>
                    <span class="menu-title">Announcement</span>
                </a>
            </li>
            <c:if test="${loginadm.lev>=3}">
            <li class="nav-item">
                <a class="nav-link" href="/adm/all" aria-expanded="false" aria-controls="admin">
                    <i class="icon-star menu-icon"></i>
                    <span class="menu-title">Admin</span>
                </a>
            </li>
            </c:if>
        </c:if>
        <li class="nav-item">
            <a class="nav-link" href="/trypage" aria-expanded="false" aria-controls="trypage">
                <i class="icon-star menu-icon"></i>
                <span class="menu-title">Tryyyyyy</span>
            </a>
        </li>
    </ul>
</nav>