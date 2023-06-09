<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- partial -->

<div class="content-wrapper">
    <div class="row">

        <div class="col-md-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title pl-1 mt-1 mb-5 text-primary">관리자 리스트</h4>

                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                            <tr class="text-center">
                                <th style="width: 25%">아이디</th>
                                <th style="width: 15%">권한 타입</th>
                                <th style="width: 33%">이메일</th>
                                <th style="width: 27%">연락처</th>

                            </tr>
                            </thead>
                            <tbody class="text-center">
                            <c:forEach var="obj" items="${adm}">
                                <tr>
                                    <td><a href="/adm/detail?id=${obj.id}">${obj.id}</a></td>
                                    <td>${obj.lev}</td>
                                    <td>${obj.email}</td>
                                    <td>${obj.contact}</td>
                                </tr>
                            </c:forEach>

                            </tbody>
                        </table>
                    </div>

                    <a href = "/adm/add" type="button" class="btn btn-outline-primary mr-2 mt-3" style="float:right;">관리자 등록</a>

                </div>
            </div>
        </div>

    </div>
</div>
                <!-- content-wrapper ends -->
