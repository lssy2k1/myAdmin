<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    let mrk_detail = {
        init:()=>{
            $('#mrk_update_btn').click(() =>{
                mrk_detail.send();
            });
            $('#mrk_delete_btn').click(()=>{
                let b = confirm("삭제하시겠습니까?");
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
    <div class="row px-1 justify-content-center">

        <div class="col-md-8 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title pl-1 mt-1 mb-5 text-primary">마커 상세조회</h4>

                    <form id = "mrk_detail_form" class="forms-sample">
                        <input type="hidden" id="id" name="id" value="${mrk.id}">
                        <input type="hidden" id="img" name="img" value="${mrk.img}">
                        <div class="form-group">
                            <label for="title">제목</label>
                            <input type="text" class="form-control" name = "title" id="title" value="${mrk.title}">
                        </div>
                        <div class="form-group">
                            <label for="title">작성자</label>
                            <input type="text" class="form-control" name = "writer" id="writer" value="${mrk.writer}">
                        </div>
                        <div class="form-group">
                            <label for="title">키워드</label>
                            <input type="text" class="form-control" name = "keyword" id="keyword" value="${mrk.keyword}">
                        </div>
                        <div class="form-group">
                            <label for="detail">설명</label>
                            <input type="text" class="form-control" name = "detail" id="detail"  value="${mrk.detail}">
                        </div>
                        <div class="form-group">
                            <label for="rating">별점</label>
                            <select class="form-control" id="rating" name = "rating" >
                                <option <c:if test="${mrk.rating=='5'}">selected</c:if>>5점</option>
                                <option <c:if test="${mrk.rating=='4'}">selected</c:if>>4점</option>
                                <option <c:if test="${mrk.rating=='3'}">selected</c:if>>3점</option>
                                <option <c:if test="${mrk.rating=='2'}">selected</c:if>>2점</option>
                                <option <c:if test="${mrk.rating=='1'}">selected</c:if>>1점</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="lat">위도</label>
                            <input type="text" class="form-control" name = "lat" id="lat"  value="${mrk.lat}">
                        </div>
                        <div class="form-group">
                            <label for="lng">경도</label>
                            <input type="text" class="form-control" name = "lng" id="lng"  value="${mrk.lng}">
                        </div>

                        <div class="form-group">
                            <label>이미지 업로드</label><br/>
                            <input type="file" name="filename" class="file-upload-default">
                            <div class="input-group col-xs-12" id="fileForm">
                                <input id="fileName" type="text" class="form-control file-upload-info" disabled
                                       placeholder="이미지를 업로드해주세요">
                                <label for="chooseFile" class="input-group-prepend" style="height: 46px">
                                    <div class="file-upload-browse btn btn-outline-primary">파일첨부</div>
                                </label>
                                <input type="file" name="imgfile" id="chooseFile" hidden onchange="loadFile(this)">
                            </div>
                        </div>
                        <div class="float-right mt-4">
                            <button id = "mrk_update_btn" type="button" class="btn btn-primary mr-2">수정</button>
                            <button id = "mrk_delete_btn" type="button" class="btn btn-light">삭제</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

    </div>
</div>
<!-- content-wrapper ends -->
