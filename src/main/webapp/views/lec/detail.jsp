<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    let lec_detail = {
        init:()=>{
            $('#lec_update_btn').click(() =>{
                lec_detail.send();
            });
            $('#lec_delete_btn').click(()=>{
                let b = confirm("삭제하시겠습니까?");
                if(b){
                    location.href = '/lec/deleteimpl?id=${lec.id}';
                }
            })
        },
        send:()=>{
            $('#lec_update_form').attr({
                action:'/lec/updateimpl',
                method:'post',
                enctype:'multipart/form-data'
            });
            $('#lec_update_form').submit();
        }
    };
    $(function(){
        lec_detail.init();
    });
</script>

<!-- partial -->

<div class="content-wrapper">
    <div class="row">

        <div class="col-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Lecture Detail</h4>
                    <p class="card-description">
                        Lecture Detail
                    </p>

                    <form id = "lec_update_form" class="forms-sample">
                        <input type = "hidden" id = "id" name = "id" value = "${lec.id}">
                        <input type = "hidden" id = "img" name = "img" value = "${lec.img}">
                        <div class="form-group">
                            <label for="title">Title</label>
                            <input type="text" class="form-control" name = "title" id="title" value = "${lec.title}" placeholder="input title">
                        </div>
                        <div class="form-group">
                            <label for="teacher">Teacher</label>
                            <input type="text" class="form-control" name = "teacher" id="teacher" value = "${lec.teacher}" placeholder="input teacher">
                        </div>
                        <div class="form-group">
                            <label for="topic">Topic</label>
                            <select class="form-control" id="topic" name = "topic">
                                <option <c:if test="${lec.topic=='Programming'}">selected</c:if>>Programming</option>
                                <option <c:if test="${lec.topic=='CS'}">selected</c:if>>CS</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="target">Target</label>
                            <input type="text" class="form-control" name = "target" id="target" value = "${lec.target}" placeholder="input target">
                        </div>
                        <div class="form-group">
                            <label for="length">Length</label>
                            <input type="text" class="form-control" name = "length" id="length" value = "${lec.length}" placeholder="input length">
                        </div>
                        <div class="form-group">
                            <label for="price">Price</label>
                            <input type="text" class="form-control" name = "price" id="price" value = "${lec.price}" placeholder="input price">
                        </div>
                        <div class="form-group">
                            <label for="rating">Rating</label>
                            <input type="text" class="form-control" name = "rating" id="rating" value = "${lec.rating}" placeholder="input rating">
                        </div>
                        <div class="form-group">
                            <label>IMG upload</label><br/>
                            <input type="file" id = "imgfile" name="imgfile" class="btn btn-primary">
<%--                            <div class="input-group col-xs-12">--%>
<%--                                <input type="text" class="form-control file-upload-info" disabled placeholder="Upload Image">--%>
<%--                                <span class="input-group-append">--%>
<%--                                    <button class="file-upload-browse btn btn-primary" type="button">Upload</button>--%>
<%--                                </span>--%>
<%--                            </div>--%>
                        </div>

                        <button id = "lec_update_btn" type="button" class="btn btn-primary mr-2">Update</button>
                        <button id = "lec_delete_btn" type="button" class="btn btn-light">Delete</button>
                    </form>
                </div>
            </div>
        </div>

    </div>
</div>
<!-- content-wrapper ends -->
