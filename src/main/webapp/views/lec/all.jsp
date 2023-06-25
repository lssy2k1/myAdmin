<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    let lec_search ={
        init: ()=> {
            $('#lec_search_btn').click(() => {
                $('#lec_search_form').attr({
                    action: '/lec/search',
                    method: 'post'
                });
                $('#lec_search_form').submit();
            });
        }
    }
    $(function(){
        lec_search.init();
    })
</script>
<!-- partial -->
<div class="content-wrapper">
    <div class="row">

        <div class="col-md-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <form id="lec_search_form" class="form-inline" style="margin: 0; display: flex; justify-content: space-between; align-items: center">

                        <label for="sortOption" style="margin-right: 10px">정렬옵션</label>
                        <select id="sortOption" name="sortOption" class="form-control mr-2">
                            <option value="default"></option>
                            <option value="price" <c:if test="${ls.sortOption=='price'}">selected</c:if>>가격</option>
                            <option value="hit" <c:if test="${ls.sortOption=='hit'}">selected</c:if>>수강생 수</option>
                            <option value="rating" <c:if test="${ls.sortOption=='rating'}">selected</c:if>>별점</option>
                            <option value="rdate" <c:if test="${ls.sortOption=='rdate'}">selected</c:if>>등록일자</option>
                        </select>
                        <label for="title" style="margin: 0 10px">강의명</label>
                        <input type="text" class="form-control mr-sm-2" id="title" name="title" placeholder="Input title" value="${ls.title}">
                        <label for="teacher" style="margin: 0 10px">강사</label>
                        <input type="text" class="form-control mr-sm-2" id="teacher" name="teacher" placeholder="Input teacher" value="${ls.teacher}">
                        <label for="topic" style="margin: 0 10px">분야</label>
                        <input type="text" class="form-control mr-sm-2" id="topic" name="topic" placeholder="Input topic" value="${ls.topic}">

                        <button type="button" id="lec_search_btn" class="btn btn-primary" style="margin-left: 20px">Search</button>
                    </form>
                </div>
            </div>
        </div>

        <div class="col-md-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title pl-1 mt-1 mb-5 text-primary">강의 목록</h4>
                    <div class="table-responsive">
                        <table class="table table-striped" style="table-layout: fixed; text-align: center">
                            <thead>
                            <tr>
<%----------------------------전체 리스트에서 보여질 내역--------------------------%>
                                <th style="width:26%">강의명</th>
                                <th style="width:11%">강사</th>
                                <th style="width:14%">분야</th>
                                <th style="width:6%">별점</th>
                                <th style="width:11%">가격</th>
                                <th style="width:7%">할인률</th>
                                <th style="width:7%">인원</th>
                                <th style="width:10%">등록일</th>
                                <th style="width:8%">공개</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="obj" items="${lec}">
                                <tr>
                                    <td><a href="/lec/detail?id=${obj.id}" style="text-overflow: ellipsis">${obj.title}</a></td>
                                    <td>${obj.teacher}</td>
                                    <td>${obj.topic}</td>
                                    <td>${obj.rating}</td>
                                    <td>${obj.price}</td>
                                    <td>${obj.discRate}</td>
                                    <td>${obj.hit}</td>
                                    <td>${obj.rdate}</td>
                                    <td>${obj.isDelete}</td>
                                </tr>
                            </c:forEach>

                            </tbody>
                        </table>
                        <div style="display: flex; justify-content: end; margin-top: 20px">
                            <a href ="/lec/add" type="button" class="btn btn-primary mb-2" style="margin-right: 20px">강의 등록</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
                <!-- content-wrapper ends -->
