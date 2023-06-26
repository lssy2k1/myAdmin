<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    $(function(){
        function fn_downfile(document_nm){
            location.href="/anc/document/fileDownload.do?document_nm="+ encodeURIComponent(document_nm);
        }
        $('.anc_download_btn').click(function(){
            var document_nm = $(this).data('document_nm');  // 수정된 부분
            fn_downfile(document_nm);
        });
    });
</script>

<!-- partial -->

<div class="content-wrapper">
    <div class="row">

        <div class="col-lg-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title pl-1 mt-1 mb-5 text-primary">공지사항</h4>

                    <div class="table-responsive">
                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th>글번호</th>
                                <th>작성자</th>
                                <th>제목</th>
                                <th>등록일자</th>
                                <th>첨부파일</th>
                            </tr>
                            </thead>

                            <tbody>
                            <c:forEach var="obj" items="${cpage.getList()}">
                                <tr>
                                    <td>${obj.id}</td>
                                    <td>${obj.writer}</td>
                                    <td><a href="/anc/detail?id=${obj.id}">${obj.title}</a></td>
                                    <td>${obj.rdate}</td>
<%--                                    <td><a href = "/anc/document/fileDownload.do?document_nm=${obj.img}">첨부파일</a></td>--%>
                                    <td>
                                        <c:if test="${obj.img!=null}">
                                            <button type = "button" class="anc_download_btn" data-document_nm="${obj.img}">다운로드</button>
                                        </c:if>
                                    </td>

                                </tr>
                            </c:forEach>

                            </tbody>
                        </table>
                        <jsp:include page="../page.jsp"/>
                    </div>
                    <a type="button" href="/anc/add" class="btn btn-outline-primary btn-icon-text" style="margin-top:15px; float:right">
                        <i class="ti-plus btn-icon-prepend"></i>
                        글쓰기
                    </a>
                </div>
            </div>

        </div>


    </div>
</div>
                <!-- content-wrapper ends -->
