<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    let std_add = {
        init:()=>{
            $('#std_add_btn').click(() =>{
                std_add.send();
            });
            $('#std_can_btn').click(()=>{
                location.href = '/stdn/all';
            })
        },
        send:()=>{
            $('#std_add_form').attr({
                action:'/stdn/addimpl',
                method:'post',
            });
            $('#std_add_form').submit();
        }
    };
    $(function(){
        std_add.init();
    });
</script>

<!-- partial -->

<div class="content-wrapper align-items-center">
    <div class="row justify-content-center">

        <div class="col-6 grid-margin">
            <div class="card">
                <div class="card-body">
                    <div class="card-title pl-1 mt-1 mb-5 text-primary">수강생 추가</div>

                    <form id = "std_add_form" class="forms-sample">
                        <div class="form-group">
                            <label for="id">아이디</label>
                            <input type="text" class="form-control" name = "id" id="id" placeholder="Input ID">
                        </div>
                        <div class="form-group">
                            <label for="pwd">비밀번호</label>
                            <input type="password" class="form-control" name = "pwd" id="pwd" placeholder="Input Password">
                        </div>
                        <div class="form-group">
                            <label for="name">이름</label>
                            <input type="text" class="form-control" id="name" name = "name" placeholder="Input Name">
                        </div>
                        <div class="form-group">
                            <label for="email">이메일</label>
                            <input type="text" class="form-control" id="email" name = "email" placeholder="Input Email">
                        </div>
                        <div class="form-group">
                            <label for="contact">연락처</label>
                            <input type="text" class="form-control" id="contact" name = "contact" placeholder="Input Mobile Phone Number">
                        </div>

                        <button id = "std_can_btn" type="button" class="btn btn-outline-primary mt-3" style="float: right">취소</button>
                        <button id = "std_add_btn" type="button" class="btn btn-primary mt-3 mr-sm-2" style="float: right">추가</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- content-wrapper ends -->
