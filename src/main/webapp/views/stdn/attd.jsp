<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!-- partial -->
<div class="content-wrapper">
    <div class="row">
        <div class="col-md-12 grid-margin stretch-card">
            <div class="card px-1">
                <div class="card-body">
                    <h4 class="card-title pl-1 mt-2 mb-5 text-primary">수강생 출결 현황</h4>
                    <div class="table-responsive">
                        <table class="table table-hover mb-4" style="table-layout: fixed; text-align: center">
                            <thead>
                            <tr>
                                <%----------------------------전체 리스트에서 보여질 내역--------------------------%>
                                <th style="width:20%">이름</th>
                                <th style="width:29%">아이디</th>
                                <th style="width:17%">출석</th>
                                <th style="width:17%">지각</th>
                                <th style="width:17%">결석</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="obj" items="${cpage.getList()}">
                                <tr>
                                    <td>${obj.name}</td>
                                    <td><a href="/stdn/detail?id=${obj.stdnId}" style="text-overflow: ellipsis">${obj.stdnId}</a></td>
                                    <td>${obj.cnt0}</td>
                                    <td>${obj.cnt1}</td>
                                    <td>${obj.cnt2}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <jsp:include page="../page.jsp"/>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
<!-- content-wrapper ends -->
