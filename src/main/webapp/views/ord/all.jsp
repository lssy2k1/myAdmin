<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    // $(function(){
    //     function fn_downfile(document_nm){
    //         location.href="/anc/document/fileDownload.do?document_nm="+ encodeURIComponent(document_nm);
    //     }
    //     $('.anc_download_btn').click(function(){
    //         var document_nm = $(this).data('document_nm');  // 수정된 부분
    //         fn_downfile(document_nm);
    //     });
    // });
</script>

<!-- partial -->

<div class="content-wrapper">
    <div class="row">

        <div class="col-lg-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">주문 조회</h4>

                    <div class="table-responsive">
                        <table class="table table-bordered">
                            <thead>
                            <tr>

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

                            <tbody>
                            <c:forEach var="obj" items="${cpage.getList()}">
                                <tr>
                                    <td><a href = "/ord/detail?id=${obj.id}">${obj.id}</a></td>
                                    <td><a href = "/stdn/detail?id=${obj.stdnId}">${obj.stdnId}</a></td>
                                    <td>${obj.rdate}</td>
                                    <td>${obj.ordPrice}</td>
                                    <td>${obj.useCpn}</td>
                                    <td>${obj.payMethod}</td>
                                    <td>${obj.isDone}</td>
                                    <td>${obj.updDate}</td>


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
