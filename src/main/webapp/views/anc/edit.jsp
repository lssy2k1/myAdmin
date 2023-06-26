<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    let anc_detail = {
        init: () => {
            $('#anc_update_btn').click(() => {
                anc_detail.send();
            });
        },
        send: () => {
            $('#anc_detail_form').attr({
                action: '/anc/updateimpl',
                method: 'post',
                enctype: 'multipart/form-data'
            });
            $('#anc_detail_form').submit();
        }
    };
    $(function () {
        anc_detail.init();
    });
</script>

<!-- partial -->

<div class="content-wrapper">
    <div class="row px-1 justify-content-center">

        <div class="col-md-8 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title pl-1 mt-1 text-primary">공지사항 수정</h4>
                    <p class="card-description mb-5">
                        수정할 내용을 입력해주세요
                    </p>

                    <form id="anc_detail_form" class="forms-sample">
                        <input type="hidden" id="id" name="id" value="${anc.id}">
                        <input type="hidden" id="img" name="img" value="${anc.img}">
                        <div class="form-group">
                            <label for="writer">작성자</label>
                            <input type="text" class="form-control" name="writer" id="writer" value="${anc.writer}"
                                   readonly>
                        </div>
                        <div class="form-group">
                            <label for="title">제목</label>
                            <input type="text" class="form-control" name="title" id="title" value="${anc.title}">
                        </div>

                        <div class="form-group">
                            <label for="contents">내용</label>
                            <textarea class="form-control" id="contents" name="contents"
                                      rows="6">${anc.contents}</textarea>
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
                            <button id="anc_update_btn" type="button" class="btn btn-primary mr-2">수정하기</button>
                            <a href="/anc/detail?id=${anc.id}" type="button" class="btn btn-light">취소</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>

    </div>
</div>
<!-- content-wrapper ends -->
