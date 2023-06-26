<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    let lec_register = {
        init: () => {
            $('#lec_register_btn').click(() => {
                lec_register.send();
            });
            $('#lec_can_btn').click(() => {
                location.href = '/lec/all';
            });
        },
        send: () => {
            $('#lec_register_form').attr({
                action: '/lec/addimpl',
                method: 'post',
                enctype: 'multipart/form-data'
            });
            $('#lec_register_form').submit();
        }
    };

    let lec_code_maker = {
        init: () => {
            $('#lec_code_btn').click(() => {
                $.ajax({
                    url: '/leccodemaker',
                    data: {
                        sbjCode: $('#sbjCode').val(),
                        sbjCode2: $('#sbjCode2').val(),
                        sbjCode3: $('#sbjCode3').val()
                    },
                    success: (result) => {
                        console.log(result);
                        if (result) {
                            $('#lecCode').val(result);
                        }
                    }
                })
            })
        }
    }
    $(function () {
        lec_register.init();
        lec_code_maker.init();
    });
</script>

<!-- partial -->

<div class="content-wrapper">
    <div class="row justify-content-center px-1">

        <div class="col-md-9 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title pl-1 mt-1 text-primary">강의 등록</h4>
                    <p class="card-description pl-1 mb-5">
                        강의 세부 내용을 입력하세요
                    </p>

                    <form id="lec_code_form" class="form-inline mt-lg-3 mb-0 d-flex justify-content-between">
                        <div class="form-group pl-1">
                            <label class="mb-0 mr-2" for="sbjCode">과목 분류 </label>
                            <select class="form-control mr-3" id="sbjCode" name="sbjCode">
                                <c:forEach var="obj" items="${sbjlist}">
                                    <option value=${obj.sbjCode}>
                                            ${obj.sbjName}
                                    </option>
                                </c:forEach>
                            </select>
                            <label class="mb-0 mr-2" for="sbjCode2">과목 분류 </label>
                            <select class="form-control mr-3" id="sbjCode2" name="sbjCode2">
                                <c:forEach var="obj" items="${sbjlist}">
                                    <option value=${obj.sbjCode}>
                                            ${obj.sbjName}
                                    </option>
                                </c:forEach>
                            </select>
                            <label class="mb-0 mr-2" for="sbjCode3">과목 분류 </label>
                            <select class="form-control mr-3" id="sbjCode3" name="sbjCode3">
                                <c:forEach var="obj" items="${sbjlist}">
                                    <option value=${obj.sbjCode}>
                                            ${obj.sbjName}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>

                        <button type="button" id="lec_code_btn" class="btn btn-outline-primary"
                                style="margin-left: 20px">강의 코드 생성
                        </button>

                    </form>
                </div>
            </div>
        </div>


        <div class="col-md-9 grid-margin stretch-card mt-0">
            <div class="card px-1">
                <div class="card-body">
                    <form id="lec_register_form" class="forms-sample">
                        <%--                        id(시퀀스), rdate, delDate(타임스탬프), rating, hit(외부데이터)는 인풋 불가--%>
                        <div class="form-group">
                            <label for="title">강의명</label>
                            <input type="text" class="form-control" name="title" id="title" placeholder="강의명을 입력하세요...">
                        </div>
                        <div class="form-group">
                            <label for="teacher">강사</label>
                            <input type="text" class="form-control" name="teacher" id="teacher"
                                   placeholder="강사를 입력하세요...">
                        </div>
                        <div class="form-group">
                            <label for="admId">작성자</label>
                            <input type="text" class="form-control" name="admId" id="admId" value="${loginadm.id}"
                                   readonly>
                        </div>
                        <div class="form-group">
                            <label for="lecCode">강의코드</label>
                            <input type="Number" class="form-control" name="lecCode" id="lecCode"
                                   placeholder="페이지 위의 강의코드 생성을 누르세요" readonly>
                        </div>
                        <div class="form-group">
                            <label for="topic">분야</label>
                            <select class="form-control" id="topic" name="topic">

                                <c:forEach var="objbig" items="${sbjlistbig}">
                                    <option>
                                            ${objbig.sbjName}
                                    </option>
                                </c:forEach>

                            </select>
                        </div>
                        <div class="form-group">
                            <label for="target">연관 사이트</label>
                            <input type="text" class="form-control" name="target" id="target"
                                   placeholder="강의 연관 사이트를 입력하세요...">
                        </div>
                        <div class="form-group">
                            <label for="length">총 강의 시간</label>
                            <input type="text" class="form-control" name="length" id="length"
                                   placeholder="총 강의 시간을 입력하세요...">
                        </div>
                        <div class="form-group">
                            <label for="price">가격</label>
                            <input type="text" class="form-control" name="price" id="price"
                                   placeholder="강의 가격을 입력하세요...">
                        </div>
                        <div class="form-group">
                            <label for="discRate">할인률</label>
                            <input type="text" class="form-control" name="discRate" id="discRate"
                                   placeholder="할인률을 입력하세요...">
                        </div>
                        <div class="form-group">
                            <label for="isDelete">공개여부</label>
                            <select class="form-control" id="isDelete" name="isDelete">
                                <option value="0">공개</option>
                                <option value="1">삭제</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>이미지 업로드</label>
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
                        <%--                        <div class="form-group">--%>
                        <%--                            <label>IMG upload</label><br/>--%>
                        <%--                            <input type="file" id = "imgfile" name="imgfile" class="btn btn-primary">--%>
                        <%--                        </div>--%>
                        <div class="float-right mt-4">
                            <button id="lec_register_btn" type="button" class="btn btn-primary mr-2">등록</button>
                            <button id="lec_can_btn" type="button" class="btn btn-light">취소</button>
                        </div>

                    </form>
                </div>
            </div>
        </div>

    </div>
</div>
<!-- content-wrapper ends -->
