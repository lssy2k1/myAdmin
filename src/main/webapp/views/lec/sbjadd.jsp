<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    let sbj_code_maker = {
        init: () => {
            $('#sbj_send_btn').click(() => {
                $.ajax({
                    url: '/sbjcodemaker',
                    data: {
                        sbjName: $('#sbjName').val(),
                        sbjCode2: $('#sbjCode2').val()
                    },

                }).done(
                    (result) => {
                        console.log(result);
                        $('#sbjCode3').val(result);
                    }
                )
            })
        }
    }
    $(function () {
        sbj_code_maker.init();
    })
</script>


<%--<div class="content-wrapper d-flex align-items-center auth px-0">--%>
<%--    <div class="row w-100 mx-0">--%>
<%--        <div class="col-lg-6 mx-auto">--%>
<%--            <div class="forms-sample">--%>
<%--                <div class="brand-logo">--%>
<%--                    <img src="/images/logo_square.png" alt="logo">--%>
<%--                </div>--%>
<%--                <h4>강의 코드 추가</h4>--%>
<%--                <form id="sbj_add_form" class="pt-3">--%>
<%--                    <div class="form-group">--%>
<%--                        <label for="sbjName">과목이름</label>--%>
<%--                        <input type="text" class="form-control" name="sbjName" id="sbjName"--%>
<%--                               placeholder="과목명을 입력하세요...">--%>
<%--                    </div>--%>
<%--                    <div class="form-group">--%>
<%--                        <label for="sbjCode2">참조과목종류</label>--%>
<%--                        <select class="form-control" id="sbjCode2" name="sbjCode2">--%>
<%--                            <c:forEach var="obj" items="${sbjlist}">--%>
<%--                                <option value="${obj.sbjCode}">--%>
<%--                                        ${obj.sbjName}--%>
<%--                                </option>--%>
<%--                            </c:forEach>--%>
<%--                        </select>--%>
<%--                    </div>--%>
<%--                    <div class="form-group">--%>
<%--                        <label for="sbjCode3">생성된 과목코드</label>--%>
<%--                        <input type="text" class="form-control" id="sbjCode3" name="sbjCode3" readonly>--%>
<%--                    </div>--%>
<%--                    <div>--%>
<%--                        <button id="sbj_send_btn" type="button" class="btn btn-primary mr-2" style="float : right">--%>
<%--                            등록하기--%>
<%--                        </button>--%>
<%--                    </div>--%>
<%--                </form>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

<div class="content-wrapper d-flex align-items-center auth px-0">
    <div class="row w-100 mx-0">
        <div class="col-lg-6 mx-auto">
<div class="col-12 grid-margin stretch-card">
    <div class="card">
        <div class="card-body py-5 px-5">
            <div class="brand-logo">
                <img src="/images/logo_square.png" alt="logo">
            </div>
            <h4 class="card-title">강의 코드 추가</h4>
            <p class="card-description">
                Basic form elements
            </p>
            <form id="sbj_add_form">
                <div class="form-group">
                    <label for="sbjName">과목이름</label>
                    <input type="text" class="form-control" name="sbjName" id="sbjName"
                           placeholder="과목명을 입력하세요">
                </div>
                <div class="form-group">
                    <label for="sbjCode2">참조과목종류</label>
                    <select class="form-control" id="sbjCode2" name="sbjCode2" placeholder="과목종류를 선택하세요">
                        <c:forEach var="obj" items="${sbjlist}">
                            <option value="${obj.sbjCode}">
                                    ${obj.sbjName}
                            </option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label for="sbjCode3">생성된 과목코드</label>
                    <input type="text" class="form-control" id="sbjCode3" name="sbjCode3" readonly>
                </div>
                <div>
                    <button id="sbj_send_btn" type="button" class="btn btn-primary mr-2 mt-2" style="float : right">
                        등록하기
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
        </div>
    </div>
</div>