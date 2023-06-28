<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!-- partial -->

<div class="content-wrapper">
    <div class="row">
        <div class="col-md-12 grid-margin">
            <div class="col-lg-12 grid-margin stretch-card">
                <div class="card px-1">
                    <div class="card-body">
                        <div class="card-title pl-1 mt-1 mb-5 text-primary">스터디 진행 목록</div>
                        <div class="table-responsive pt-3">
                            <table class="table table-bordered text-center">
                                <thead>
                                <tr>
                                    <th style="width: 25%">
                                        이름
                                    </th>
                                    <th style="width: 25%">
                                        아이디
                                    </th>
                                    <th style="width: 25%">
                                        스터디 시작 시간
                                    </th>
                                    <th style="width: 25%">
                                        스터디 종료 시간
                                    </th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="s" items="${cpage.getList()}">
                                            <tr>
                                                <td>${s.writer}</td>
                                                <td><a href="/${target}/detail?id=${s.id}">${s.stdnId}</a></td>
                                                <td>${s.startTime}</td>
                                                <td><span class="badge badge-outline-success px-2 py-1" style="font-size: 1em">진행 중</span></td>
                                            </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <c:choose>
                                <c:when test="${pagination==null}">
                                    <jsp:include page ="../page.jsp"/>
                                </c:when>
                                <c:otherwise>
                                    <jsp:include page = "../${pagination}.jsp"/>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- content-wrapper ends -->