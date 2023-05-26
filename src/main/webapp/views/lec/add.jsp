<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    let lec_register = {
        init:()=>{
            $('#lec_register_btn').click(() =>{
                lec_register.send();
            });
            $('#lec_can_btn').click(()=>{
                location.href = '/lec/all';
            })
        },
        send:()=>{
            $('#lec_register_form').attr({
                action:'/lec/addimpl',
                method:'post',
                enctype:'multipart/form-data'
            });
            $('#lec_register_form').submit();
        }
    };
    $(function(){
        lec_register.init();
    });
</script>

<!-- partial -->

<div class="content-wrapper">
    <div class="row">

        <div class="col-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">강의 등록</h4>
                    <p class="card-description">
                        강의 세부 내용을 입력하세요...
                    </p>

                    <form id = "lec_register_form" class="forms-sample">
<%--                        id(시퀀스), rdate, delDate(타임스탬프), rating, hit(외부데이터)는 인풋 불가--%>
                        <div class="form-group">
                            <label for="title">강의명</label>
                            <input type="text" class="form-control" name = "title" id="title" placeholder="강의명을 입력하세요...">
                        </div>
                        <div class="form-group">
                            <label for="teacher">강사</label>
                            <input type="text" class="form-control" name = "teacher" id="teacher" placeholder="강사를 입력하세요...">
                        </div>
                        <div class="form-group">
                            <label for="admId">작성자</label>
                            <input type="text" class="form-control" name = "admId" id="admId" value="${loginadm.id}">
                        </div>
                        <div class="form-group">
                            <label for="lecCode">강의코드</label>
                            <input type="Number" class="form-control" name = "lecCode" id="lecCode" placeholder="강의코드를 입력하세요...">
                        </div>
                        <div class="form-group">
                            <label for="topic">분야</label>
                            <select class="form-control" id="topic" name = "topic" >
                                <option>프론트엔드</option>
                                <option>백엔드</option>
                                <option>네트워크</option>
                                <option>운영체제</option>
                                <option>데이터베이스</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="target">연관 사이트</label>
                            <input type="text" class="form-control" name = "target" id="target" placeholder="강의 연관 사이트를 입력하세요...">
                        </div>
                        <div class="form-group">
                            <label for="length">총 강의 시간</label>
                            <input type="text" class="form-control" name = "length" id="length" placeholder="총 강의 시간을 입력하세요...">
                        </div>
                        <div class="form-group">
                            <label for="price">가격</label>
                            <input type="text" class="form-control" name = "price" id="price" placeholder="강의 가격을 입력하세요...">
                        </div>
                        <div class="form-group">
                            <label for="discRate">할인률</label>
                            <input type="text" class="form-control" name = "discRate" id="discRate" placeholder="할인률을 입력하세요...">
                        </div>
                        <div class="form-group">
                            <label for="isDelete">공개여부</label>
                            <select class="form-control" id="isDelete" name = "isDelete" >
                                <option value="0">공개</option>
                                <option value="1">삭제</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>IMG upload</label><br/>
                            <input type="file" id = "imgfile" name="imgfile" class="btn btn-primary">
                        </div>

                        <button id = "lec_register_btn" type="button" class="btn btn-primary mr-2">등록</button>
                        <button id = "lec_can_btn" type="button" class="btn btn-light">취소</button>
                    </form>
                </div>
            </div>
        </div>

    </div>
</div>
<!-- content-wrapper ends -->
