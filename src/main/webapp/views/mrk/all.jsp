<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    let search_form = {
        init: function(){
            $('#search_btn').click(function(){
                $('#search_form').attr({
                    method: 'post',
                    action: '/mrk/search'
                });
                $('#search_form').submit();
            });
        }
    };
    $(function(){
       search_form.init();
    });
</script>
<!-- partial -->

<div class="content-wrapper">
    <div class="row">
        <div class="col-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <form id="search_form" class="form-inline" style="margin: 0; display: flex; justify-content: space-between; align-items: center">
                        <label for="title" style="margin-right: 10px">제목</label>
                        <input type="text" class="form-control mr-sm-2" id="title" name="title" placeholder="Input Title" value="${ms.title}">
                        <label for="writer" style="margin: 0 10px">작성자</label>
                        <input type="text" class="form-control mr-sm-2" id="writer" name="writer" placeholder="Input Writer" value="${ms.writer}">
                        <label for="title" style="margin: 0 10px">키워드</label>
                        <input type="text" class="form-control mr-sm-2" id="keyword" name="keyword" placeholder="Input Keyword" value="${ms.keyword}">
                        <label for="rating" style="margin: 0 10px">별점</label>
                        <select id="rating" name="rating" value="${ms.rating}" class="form-control mr-2">
                            <option value="">전체</option>
                            <option value="1" <c:if test="${ms.rating==1}">selected</c:if> >1</option>
                            <option value="2" <c:if test="${ms.rating==2}">selected</c:if>>2</option>
                            <option value="3" <c:if test="${ms.rating==3}">selected</c:if>>3</option>
                            <option value="4" <c:if test="${ms.rating==4}">selected</c:if>>4</option>
                            <option value="5" <c:if test="${ms.rating==5}">selected</c:if>>5</option>
                        </select>
                        <button type="button" id="search_btn" class="btn btn-primary mb-2" style="margin-left: 20px">Search</button>
                    </form>
                </div>
            </div>
        </div>

        <div class="col-lg-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title pl-1 mt-1 mb-5 text-primary">마커 목록</h4>

                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th>이미지</th>
                                <th>ID</th>
                                <th>제목</th>
                                <th>위도</th>
                                <th>경도</th>
                                <th>별점</th>
                                <th>상세</th>
                                <th>작성자</th>
                                <th>키워드</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="obj" items="${mrk}">
                                <tr>
                                    <td class="py-1"><img src="/uimg/${obj.img}"></td>
                                    <td><a href="/mrk/detail?id=${obj.id}">${obj.id}</a></td>
                                    <td>${obj.title}</td>
                                    <td>${obj.lat}</td>
                                    <td>${obj.lng}</td>
                                    <td>${obj.rating}</td>
                                    <td>${obj.detail}</td>
                                    <td>${obj.writer}</td>
                                    <td>${obj.keyword}</td>
                                </tr>
                            </c:forEach>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
                <!-- content-wrapper ends -->
