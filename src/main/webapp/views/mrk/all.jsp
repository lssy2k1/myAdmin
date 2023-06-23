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
                    <h4 class="card-title">Search</h4>
                    <form id="search_form" class="form-inline">
                        <label for="title" style="margin-right: 10px">Title</label>
                        <input type="text" class="form-control mb-2 mr-sm-2" id="title" name="title" placeholder="Input Title" value="${ms.title}">
                        <label for="writer" style="margin: 0 10px">Writer</label>
                        <input type="text" class="form-control mb-2 mr-sm-2" id="writer" name="writer" placeholder="Input Writer" value="${ms.writer}">

                        <label for="keyword" style="margin: 0 10px">Keyword</label>
                        <select id="keyword" name="keyword" value="${ms.keyword}" class="form-control mb-2 mr-2">
                            <option value="">전체</option>
                            <option value="R" <c:if test="${ms.keyword=='R'}">selected</c:if>>식당</option>
                            <option value="C" <c:if test="${ms.keyword=='C'}">selected</c:if>>카페</option>
                            <option value="S" <c:if test="${ms.keyword=='S'}">selected</c:if>>스터디카페</option>
                        </select>

                        <label for="rating" style="margin: 0 10px">Rating</label>
                        <select id="rating" name="rating" value="${ms.rating}" class="form-control mb-2 mr-2">
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
                    <h4 class="card-title">Marker List</h4>

                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th>IMG</th>
                                <th>ID</th>
                                <th>Title</th>
                                <th>Lat</th>
                                <th>Lng</th>
                                <th>Rating</th>
<%--                                <th>Detail</th>--%>
                                <th>Writer</th>
                                <th>Keyword</th>
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
