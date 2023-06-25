<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    let mrk_detail = {
        init:()=>{
            $('#mrk_update_btn').click(() =>{
                mrk_detail.send();
            });
            $('#mrk_delete_btn').click(()=>{
                let b = confirm("delete?");
                if(b){
                    location.href = '/mrk/deleteimpl?id=${mrk.id}';
                }
            })
        },
        send:()=>{
            $('#mrk_detail_form').attr({
                action:'/mrk/updateimpl',
                method:'post',
                enctype:'multipart/form-data'
            });
            $('#mrk_detail_form').submit();
        }
    };
    $(function(){
        mrk_detail.init();
    });
</script>

<!-- partial -->

<div class="content-wrapper">
    <div class="row">

        <div class="col-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title pl-1 mt-1 mb-5 text-primary">Detail Marker</h4>
                    <p class="card-description">
                        Detail Marker
                    </p>

                    <form id = "mrk_detail_form" class="forms-sample">
                        <input type="hidden" id="id" name="id" value="${mrk.id}">
                        <input type="hidden" id="img" name="img" value="${mrk.img}">
                        <div class="form-group">
                            <label for="title">Title</label>
                            <input type="text" class="form-control" name = "title" id="title" value="${mrk.title}">
                        </div>
                        <div class="form-group">
                            <label for="title">Writer</label>
                            <input type="text" class="form-control" name = "writer" id="writer" value="${mrk.writer}">
                        </div>
                        <div class="form-group">
                            <label for="title">Keyword</label>
                            <input type="text" class="form-control" name = "keyword" id="keyword" value="${mrk.keyword}">
                        </div>
                        <div class="form-group">
                            <label for="detail">Detail</label>
                            <input type="text" class="form-control" name = "detail" id="detail"  value="${mrk.detail}">
                        </div>
                        <div class="form-group">
                            <label for="rating">Rating</label>
                            <select class="form-control" id="rating" name = "rating" >
                                <option <c:if test="${mrk.rating=='5'}">selected</c:if>>5</option>
                                <option <c:if test="${mrk.rating=='4'}">selected</c:if>>4</option>
                                <option <c:if test="${mrk.rating=='3'}">selected</c:if>>3</option>
                                <option <c:if test="${mrk.rating=='2'}">selected</c:if>>2</option>
                                <option <c:if test="${mrk.rating=='1'}">selected</c:if>>1</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="lat">lat</label>
                            <input type="text" class="form-control" name = "lat" id="lat"  value="${mrk.lat}">
                        </div>
                        <div class="form-group">
                            <label for="lng">lng</label>
                            <input type="text" class="form-control" name = "lng" id="lng"  value="${mrk.lng}">
                        </div>

                        <div class="form-group">
                            <label>IMG upload</label><br/>
                            <input type="file" id = "imgfile" name="imgfile" class="btn btn-primary">
                        </div>

                        <button id = "mrk_update_btn" type="button" class="btn btn-primary mr-2">Update</button>
                        <button id = "mrk_delete_btn" type="button" class="btn btn-light">Delete</button>
                    </form>
                </div>
            </div>
        </div>

    </div>
</div>
<!-- content-wrapper ends -->
