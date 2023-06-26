<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


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

                                <th>주문상세번호</th>
                                <th>주문번호</th>
                                <th>학생ID</th>
                                <th>주문일자</th>
                                <th>주문가격</th>
                                <th>쿠폰사용금액</th>
                                <th>결제방법</th>
                                <th>주문상태</th>
                                <th>수정일자</th>

                            </tr>
                            </thead>

                            <tbody class="text-center">
                            <c:forEach var="obj" items="${ord}">
                                <tr>
                                    <td>${obj.odId}</td>
                                    <td><a href = "/ord/detailstdn?id=${obj.id}">${obj.id}</a></td>
                                    <td><a href = "/stdn/detail?id=${obj.stdnId}">${obj.stdnId}</a></td>
                                    <td>${obj.rdate}</td>
                                    <td>${obj.ordPrice}원</td>
                                    <td>${obj.useCpn}원</td>
                                    <c:choose>
                                        <c:when test="${obj.payMethod==1}">
                                            <td>카드</td>
                                        </c:when>
                                        <c:when test="${obj.payMethod==2}">
                                            <td>카카오페이</td>
                                        </c:when>
                                    </c:choose>
                                    <c:choose>
                                        <c:when test="${obj.isDone==0}">
                                            <td>취소 및 환불</td>
                                        </c:when>
                                        <c:when test="${obj.isDone==1}">
                                            <td>결제완료</td>
                                        </c:when>
                                    </c:choose>
                                    <td>${obj.updDate}</td>


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
