<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    #std_del_alert {
        width: 100%;
        box-sizing: border-box;
        position: absolute;
        display: none;
        z-index: 1;
        backdrop-filter: blur(100px);
    }

    #std_del_alert > .modal-dialog {
        top: 25vh;
        left: 5vw;
    }
</style>
<script>
    let std_upd = {
        init: () => {
            let stdnId = $('#id').val();
            $('#std_upd_btn').click(() => {
                std_upd.send();
            });
            $('#upd_can_btn').click(() => {
                location.href = '/stdn/detail?id=' + stdnId;
            });
            $('#std_del_btn').click(() => {
                $('#std_del_alert').css("display", "block");
            });
            $('#del_can_btn').click(()=>{
                $('#std_del_alert').css("display", "none");
            })
        },
        send: () => {
            $('#std_upd_form').attr({
                action: '/stdn/updateimpl',
                method: 'post',
            });
            $('#std_upd_form').submit();
        }
    };
    $(function () {
        std_upd.init();
    });
</script>

<!-- partial -->

<div class="content-wrapper align-items-center">
    <div class="row justify-content-center">

        <div class="col-6 grid-margin">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title pl-1 mt-1 mb-5 text-primary">정보 수정</h4>
                    <form id="std_upd_form" class="forms-sample">
                        <div class="form-group">
                            <label for="id">ID</label>
                            <input type="text" class="form-control" name="id" id="id" value="${stdn.id}" readonly>
                        </div>
                        <div class="form-group">
                            <label for="pwd">PWD</label>
                            <input type="password" class="form-control" name="pwd" id="pwd" value="${stdn.pwd}">
                        </div>
                        <div class="form-group">
                            <label for="name">NAME</label>
                            <input type="text" class="form-control" id="name" name="name" value="${stdn.name}">
                        </div>
                        <div class="form-group">
                            <label for="email">EMAIL</label>
                            <input type="text" class="form-control" id="email" name="email" value="${stdn.email}">
                        </div>
                        <div class="form-group">
                            <label for="contact">CONTACT</label>
                            <input type="text" class="form-control" id="contact" name="contact" value="${stdn.contact}">
                        </div>

                        <a id="std_del_btn" class="btn btn-outline-primary ml-1 mt-3" style="float: left">수강생 삭제</a>
                        <button id="upd_can_btn" type="button" class="btn btn-outline-primary mt-3"
                                style="float: right">취소
                        </button>
                        <button id="std_upd_btn" type="button" class="btn btn-primary mt-3 mr-sm-2"
                                style="float: right">수정
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- content-wrapper ends -->

<%--modal--%>
<div class="modal" id="std_del_alert">
    <div class="modal-dialog card-inverse-primary">
        <div class="modal-content ">
            <div class="modal-header" style="background-color: #DBDBED; padding: 15px 26px">
                <h5 class="modal-title">수강생 삭제</h5>
                <button type="button" class="close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
                <p>${stdn.name}님을 삭제하시겠습니까?</p>
            </div>
            <div class="modal-footer" style="padding: 10px 25px">
                <a href="/stdn/deleteimpl?id=${stdn.id}" type="button" class="btn btn-sm btn-inverse-primary">삭제</a>
                <button id="del_can_btn" type="button" class="btn btn-sm btn-outline-primary">취소</button>
            </div>
        </div>
    </div>
</div>