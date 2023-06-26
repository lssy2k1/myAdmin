<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script>
    <%--let anc_edit = {--%>
    <%--    init:()=>{--%>
    <%--        $('#anc_delete_btn').click(()=>{--%>
    <%--            let b = confirm("삭제하시겠습니까?");--%>
    <%--            if(b){--%>
    <%--                location.href = '/anc/deleteimpl?id=${anc.id}';--%>
    <%--            }--%>
    <%--        });--%>
    <%--    }--%>
    <%--};--%>
    <%--$(function(){--%>
    <%--    anc_edit.init();--%>
    <%--});--%>
</script>

<!-- partial -->

<div class="content-wrapper">
    <div class="row px-1">

        <div class="col-md-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title pl-1 mt-1 mb-5 text-primary">주문별 상세보기</h4>

                    <div class="table-responsive">

                        <table class="table table-bordered">
                            <thead class="text-center">
                            <tr>

                                <th>주문번호</th>
                                <th>주문상세번호</th>
                                <th>강의번호</th>
                                <th>강의제목</th>
                                <th>가격</th>
                                <th>할인률</th>
                                <th>학생ID</th>

                            </tr>
                            </thead>

                            <tbody class="text-center">
                            <c:forEach var="obj" items="${ordDetail}">
                                <tr>

                                    <td>${obj.ordId}</td>
                                    <td>${obj.id}</td>
                                    <td>${obj.lecId}</td>
                                    <td><a href="/lec/detail?id=${obj.lecId}">${obj.lecTitle}</a></td>
                                    <td>${obj.price}원</td>
                                    <td>${obj.discRate}%</td>
                                    <td><a href="/stdn/detail?id=${obj.stdnId}">${obj.stdnId}</a></td>

                                </tr>
                            </c:forEach>

                            </tbody>
                        </table>

                    </div>
<%--                    <div  style="margin-top:15px; float:right">--%>
<%--                        <a type="button" href="/anc/edit?id=${anc.id}" class="btn btn-outline-primary btn-icon-text">--%>
<%--                            수정하기--%>
<%--                        </a>--%>
<%--                        <button id = "anc_delete_btn" type="button" class="btn btn-light">삭제하기</button>--%>
<%--                    </div>--%>
                </div>
            </div>

        </div>


    </div>
</div>
                <!-- content-wrapper ends -->
