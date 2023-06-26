<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    let search_form = {
        init: function () {
            $('#search_btn').click(function () {
                $('#search_form').attr({
                    method: 'post',
                    action: '/mrk/search'
                });
                $('#search_form').submit();
            });
        }
    };
    $(function () {
        search_form.init();
    });
</script>
<!-- partial -->

<div class="content-wrapper">
    <div class="row px-1">
        <div class="col-md-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <form id="search_form" class="form-inline mb-0 d-flex justify-content-between">
                        <div class="d-inline-flex">
                            <div class="form-group ml-1 mr-5">
                                <label for="title" class="mr-2 mb-0">제목</label>
                                <input type="text" class="form-control mr-sm-2" id="title" name="title"
                                       placeholder="제목을 입력하세요" value="${ms.title}">
                            </div>
                            <div class="form-group mr-5">
                                <label for="writer" class="mr-2 mb-0">작성자</label>
                                <input type="text" class="form-control mr-sm-2" id="writer" name="writer"
                                       placeholder="작성자를 입력하세요" value="${ms.writer}">
                            </div>
                            <div class="form-group mr-5">
                                <label for="keyword" class="mr-2 mb-0">키워드</label>
                                <select id="keyword" name="keyword" value="${ms.keyword}" class="form-control mr-2">
                                    <option value="">전체</option>
                                    <option value="R" <c:if test="${ms.keyword=='R'}">selected</c:if>>식당</option>
                                    <option value="C" <c:if test="${ms.keyword=='C'}">selected</c:if>>카페</option>
                                    <option value="S" <c:if test="${ms.keyword=='S'}">selected</c:if>>스터디카페</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="rating" class="mr-2 mb-0">별점</label>
                                <select id="rating" name="rating" value="${ms.rating}" class="form-control mr-2">
                                    <option value="">전체</option>
                                    <option value="1"
                                            <c:if test="${ms.rating==1}">selected</c:if> >1
                                    </option>
                                    <option value="2" <c:if test="${ms.rating==2}">selected</c:if>>2점</option>
                                    <option value="3" <c:if test="${ms.rating==3}">selected</c:if>>3점</option>
                                    <option value="4" <c:if test="${ms.rating==4}">selected</c:if>>4점</option>
                                    <option value="5" <c:if test="${ms.rating==5}">selected</c:if>>5점</option>
                                </select>
                            </div>
                        </div>
                        <button type="button" id="search_btn" class="btn btn-primary" style="margin-left: 20px">
                            검색
                        </button>
                    </form>
                </div>
            </div>
        </div>

        <div class="col-md-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title pl-1 mt-1 mb-4 text-primary">마커 목록</h4>

                    <div class="table-responsive">
                        <table class="table table-striped text-center">
                            <thead>
                            <tr>
                                <th style="width: 10%">이미지</th>
                                <th style="width: 8%">ID</th>
                                <th style="width: 22%">제목</th>
                                <th style="width: 13%">위도</th>
                                <th style="width: 13%">경도</th>
                                <th style="width: 7%">별점</th>
                                <%--                                <th>상세</th>--%>
                                <th style="width: 11%">작성자</th>
                                <th style="width: 11%">키워드</th>
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
                                        <%--                                    <td>${obj.detail}</td>--%>
                                    <td>${obj.writer}</td>
                                    <c:choose>
                                        <c:when test="${obj.keyword=='R'}">
                                            <td>식당</td>
                                        </c:when>
                                        <c:when test="${obj.keyword=='C'}">
                                            <td>카페</td>
                                        </c:when>
                                        <c:when test="${obj.keyword=='S'}">
                                            <td>스터디카페</td>
                                        </c:when>
                                    </c:choose>
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
