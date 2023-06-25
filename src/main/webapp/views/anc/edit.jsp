<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    let anc_detail = {
        init:()=>{
            $('#anc_update_btn').click(() =>{
                anc_detail.send();
            });
        },
        send:()=>{
            $('#anc_detail_form').attr({
                action:'/anc/updateimpl',
                method:'post',
                enctype:'multipart/form-data'
            });
            $('#anc_detail_form').submit();
        }
    };
    $(function(){
        anc_detail.init();
    });
</script>

<!-- partial -->

<div class="content-wrapper">
    <div class="row">

        <div class="col-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title pl-1 mt-1 mb-5 text-primary">공지사항 수정하기</h4>
                    <p class="card-description">
                        공지사항 수정하기
                    </p>

                    <form id = "anc_detail_form" class="forms-sample">
                        <input type = "hidden" id = "id" name = "id" value = "${anc.id}">
                        <input type = "hidden" id = "img" name = "img" value = "${anc.img}">
                        <div class="form-group">
                            <label for="writer">Writer</label>
                            <input type="text" class="form-control" name = "writer" id="writer" value = "${anc.writer}" readonly>
                        </div>
                        <div class="form-group">
                            <label for="title">Title</label>
                            <input type="text" class="form-control" name = "title" id="title" value = "${anc.title}">
                        </div>

                        <div class="form-group">
                            <label for="contents">Contents</label>
                            <textarea class="form-control" id="contents" name="contents" rows="6">${anc.contents}</textarea>
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

                        <button id = "anc_update_btn" type="button" class="btn btn-primary mr-2">수정하기</button>
                        <a href = "/anc/detail?id=${anc.id}" type="button" class="btn btn-light">취소</a>
                    </form>
                </div>
            </div>
        </div>

    </div>
</div>
<!-- content-wrapper ends -->
