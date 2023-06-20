<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    let std_upd = {
        init:()=>{
            let stdnId=$('#id').val();
            $('#std_upd_btn').click(() =>{
                std_upd.send();
            });
            $('#upd_can_btn').click(()=>{
                location.href = '/stdn/detail?id=' + stdnId;
            })
        },
        send:()=>{
            $('#std_upd_form').attr({
                action:'/stdn/updateimpl',
                method:'post',
            });
            $('#std_upd_form').submit();
        }
    };
    $(function(){
        std_upd.init();
    });
</script>

<!-- partial -->

<div class="content-wrapper align-items-center">
    <div class="row justify-content-center">

        <div class="col-6 grid-margin">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title text-primary mb-lg-5">정보 수정</h4>
                    <form id = "std_upd_form" class="forms-sample">
                        <div class="form-group">
                            <label for="id">ID</label>
                            <input type="text" class="form-control" name = "id" id="id" value="${stdn.id}" readonly>
                        </div>
                        <div class="form-group">
                            <label for="pwd">PWD</label>
                            <input type="password" class="form-control" name = "pwd" id="pwd" value="${stdn.pwd}">
                        </div>
                        <div class="form-group">
                            <label for="name">NAME</label>
                            <input type="text" class="form-control" id="name" name = "name" value="${stdn.name}">
                        </div>
                        <div class="form-group">
                            <label for="email">EMAIL</label>
                            <input type="text" class="form-control" id="email" name = "email" value="${stdn.email}">
                        </div>
                        <div class="form-group">
                            <label for="contact">CONTACT</label>
                            <input type="text" class="form-control" id="contact" name = "contact" value="${stdn.contact}">
                        </div>

                        <button id = "upd_can_btn" type="button" class="btn btn-outline-primary mt-3" style="float: right">취소</button>
                        <button id = "std_upd_btn" type="button" class="btn btn-primary mt-3 mr-sm-2" style="float: right">수정</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- content-wrapper ends -->
