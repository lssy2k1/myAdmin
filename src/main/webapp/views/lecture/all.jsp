<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    let lec_search ={
        init: ()=> {
            $('#lec_search_btn').click(() => {
                $('#lec_search_form').attr({
                    action: '/lecture/search',
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

        <div class="col-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Search</h4>
                    <form id="lec_search_form" class="form-inline">

                        <label for="topic" style="margin-right: 10px">Topic</label>
                        <select id="topic" name="topic" value="${ls.topic}" class="form-control mb-2 mr-2">
                            <option value="">전체</option>
                            <option value="CS" <c:if test="${ls.topic=='CS'}">selected</c:if>>CS</option>
                            <option value="Programming" <c:if test="${ls.topic=='Programming'}">selected</c:if>>Programming</option>
                        </select>
                        <label for="title" style="margin: 0 10px">Title</label>
                        <input type="text" class="form-control mb-2 mr-sm-2" id="title" name="title" placeholder="Input title" value="${ls.title}">
                        <label for="teacher" style="margin: 0 10px">Teacher</label>
                        <input type="text" class="form-control mb-2 mr-sm-2" id="teacher" name="teacher" placeholder="Input teacher" value="${ls.teacher}">
                        <label for="rating" style="margin: 0 10px">Rating</label>
                        <input type="Number" class="form-control mb-2 mr-sm-2" id="rating" name="rating" placeholder="Input rating" value="${ls.rating}">
                        <label for="lowerPrice" style="margin: 0 10px">lowerPrice</label>
                        <input type="Number" class="form-control mb-2 mr-sm-2" id="lowerPrice" name="lowerPrice" placeholder="Input lowerPrice" value="${ls.lowerPrice}">
                        <label for="upperPrice" style="margin: 0 10px">upperPrice</label>
                        <input type="Number" class="form-control mb-2 mr-sm-2" id="upperPrice" name="upperPrice" placeholder="Input upperPrice" value="${ls.upperPrice}">

                        <button type="button" id="lec_search_btn" class="btn btn-primary mb-2" style="margin-left: 20px">Search</button>
                    </form>
                </div>
            </div>
        </div>

        <div class="col-lg-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Lecture List</h4>
<%--                    <p class="card-description">--%>
<%--                        Add class <code>.table-striped</code>--%>
<%--                    </p>--%>
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th>IMG</th>
                                <th>ID</th>
                                <th>Title</th>
                                <th>Teacher</th>
                                <th>Topic</th>
                                <th>Target</th>
                                <th>Rdate</th>
                                <th>Length</th>
                                <th>Price</th>
                                <th>Rating</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="obj" items="${lecture}">
                                <tr>
                                    <td class="py-1"><img src="/uimg/${obj.img}"></td>
                                    <td><a href="/lecture/detail?id=${obj.id}">${obj.id}</a></td>
                                    <td>${obj.title}</td>
                                    <td>${obj.teacher}</td>
                                    <td>${obj.topic}</td>
                                    <td>${obj.target}</td>
                                    <td>${obj.rdate}</td>
                                    <td>${obj.length}</td>
                                    <td>${obj.price}</td>
                                    <td>${obj.rating}</td>
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
