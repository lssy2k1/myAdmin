<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    let lec_edit = {
        init:()=>{
            $('#lec_update_btn').click(() =>{
                lec_edit.send();
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
        lec_edit.init();
    });
</script>

<!-- partial -->

<div class="content-wrapper">
    <div class="row justify-content-center px-1">

        <div class="col-md-9 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title pl-1 mt-1 text-primary">강의 정보 수정</h4>
                    <p class="card-description pl-1 mb-5">
                        변경하고자 하는 강의 정보를 입력하세요
                    </p>

                    <form id = "lec_update_form" class="forms-sample">
                        <input type = "hidden" id = "id" name = "id" value = "${lec.id}">
                        <input type = "hidden" id = "hit" name = "hit" value = "${lec.hit}">
                        <input type = "hidden" id = "rating" name = "rating" value = "${lec.rating}">
                        <input type = "hidden" id = "delDate" name = "delDate" value = "${lec.delDate}">
                        <input type = "hidden" id = "img" name = "img" value = "${lec.img}">

                        <div class="form-group">
                            <label for="title">강의명</label>
                            <input type="text" class="form-control" name = "title" id="title" value = "${lec.title}">
                        </div>
                        <div class="form-group">
                            <label for="teacher">강사</label>
                            <input type="text" class="form-control" name = "teacher" id="teacher"  value = "${lec.teacher}">
                        </div>
                        <div class="form-group">
                            <label for="admId">작성자</label>
                            <input type="text" class="form-control" name = "admId" id="admId" value="${loginadm.id}">
                        </div>
                        <div class="form-group">
                            <label for="lecCode">강의코드</label>
                            <input type="Number" class="form-control" name = "lecCode" id="lecCode"  value = "${lec.lecCode}">
                        </div>
                        <div class="form-group">
                            <label for="topic">분야</label>
                            <select class="form-control" id="topic" name = "topic" >
                                <option <c:if test="${lec.topic=='프론트엔드'}">selected</c:if>>프론트엔드</option>
                                <option <c:if test="${lec.topic=='백엔드'}">selected</c:if>>백엔드</option>
                                <option <c:if test="${lec.topic=='네트워크'}">selected</c:if>>네트워크</option>
                                <option <c:if test="${lec.topic=='운영체제'}">selected</c:if>>운영체제</option>
                                <option <c:if test="${lec.topic=='데이터베이스'}">selected</c:if>>데이터베이스</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="target">연관 사이트</label>
                            <input type="text" class="form-control" name = "target" id="target"  value = "${lec.target}">
                        </div>
                        <div class="form-group">
                            <label for="length">총 강의 시간</label>
                            <input type="text" class="form-control" name = "length" id="length"  value = "${lec.length}">
                        </div>
                        <div class="form-group">
                            <label for="price">가격</label>
                            <input type="text" class="form-control" name = "price" id="price"  value = "${lec.price}원">
                        </div>
                        <div class="form-group">
                            <label for="discRate">할인률</label>
                            <input type="text" class="form-control" name = "discRate" id="discRate"  value = "${lec.discRate}%">
                        </div>
                        <div class="form-group">
                            <label for="isDelete">공개여부</label>
                            <select class="form-control" id="isDelete" name = "isDelete" >
                                <option value="0" <c:if test="${lec.isDelete=='0'}">selected</c:if>>공개</option>
                                <option value="1" <c:if test="${lec.isDelete=='1'}">selected</c:if>>삭제</option>
                            </select>
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
                            <button id = "lec_update_btn" type="button" class="btn btn-primary mr-2">수정</button>
                            <button id = "lec_delete_btn" type="button" class="btn btn-light">삭제</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

    </div>
</div>
<!-- content-wrapper ends -->
