<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- partial -->

<div class="content-wrapper">
    <div class="row">

        <div class="col-lg-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title pl-1 mt-1 mb-5 text-primary">주문 상세조회</h4>

                    <div class="table-responsive">
                        <table class="table table-bordered">
                            <thead>
                            <tr>

                                <th>주문상세번호</th>
                                <th>주문번호</th>
                                <th>강의번호</th>
                                <th>강의제목</th>
                                <th>가격</th>
                                <th>할인률</th>
                                <th>학생ID</th>

                            </tr>
                            </thead>

                            <tbody>
                            <c:forEach var="obj" items="${cpage.getList()}">
                                <tr>

                                    <td>${obj.id}</td>
                                    <td><a href="/orddetail/detail?ordDetailId=${obj.id}">${obj.ordId}</a></td>
                                    <td>${obj.lecId}</td>
                                    <td><a href="/lec/detail?id=${obj.lecId}">${obj.lecTitle}</a></td>
                                    <td>${obj.price}</td>
                                    <td>${obj.discRate}</td>
                                    <td><a href="/stdn/detail?id=${obj.stdnId}">${obj.stdnId}</a></td>

                                </tr>
                            </c:forEach>

                            </tbody>
                        </table>
                        <jsp:include page="../page.jsp"/>
                    </div>
<%--                    <a type="button" href="/anc/add" class="btn btn-outline-primary btn-icon-text" style="margin-top:15px; float:right">--%>
<%--                        <i class="ti-plus btn-icon-prepend"></i>--%>
<%--                        글쓰기--%>
<%--                    </a>--%>
                </div>
            </div>

        </div>


    </div>
</div>
                <!-- content-wrapper ends -->
