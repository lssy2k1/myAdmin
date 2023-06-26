<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script>
    let adm_login = {
        init:()=>{
            $('#adm_login_btn').click(() =>{
                adm_login.send();
            });
            $('#adm_can_btn').click(()=>{
                location.href = '/';
            })
        },
        send:()=>{
            $('#adm_login_form').attr({
                action:'/loginimpl',
                method:'post'
            });
            $('#adm_login_form').submit();
        }
    };
    $(function(){
        adm_login.init();
    });
</script>

<div class="content-wrapper d-flex align-items-center auth px-0">
    <div class="row w-100 mx-0">
        <div class="col-lg-6 mx-auto">
            <div class="auth-form-light text-left py-5 px-4 px-sm-5">
                <div class="brand-logo">
                    <img src="/images/logo_square.png" alt="logo">
                </div>
                <h4>안녕하세요! 오늘도 좋은 하루 보내세요:D</h4>
                <h6 class="font-weight-light">계속하시려면 로그인해주세요</h6>
                <form id="adm_login_form" class="pt-3">
                    <div class="form-group">
                        <label for="id">ID</label>
                        <input type="text" class="form-control form-control-lg" name="id" id="id" placeholder="Input ID">
                    </div>
                    <div class="form-group">
                        <label for="pwd">PWD</label>
                        <input type="password" class="form-control form-control-lg" name="pwd" id="pwd" placeholder="Input Password" onkeypress="if( event.keyCode == 13 ){adm_login.send();}">
                    </div>
                    <div class="mt-3">
                        <button id="adm_login_btn" type="button" class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn">로그인</button>
                        <button id="adm_can_btn" type="button" class="btn btn-block btn-outline-primary btn-lg font-weight-medium auth-form-btn">취소</button>
                    </div>
                    <div class="my-2 d-flex justify-content-between align-items-center">
                        <div class="form-check">
                            <label class="form-check-label text-muted">
                                <input type="checkbox" class="form-check-input">
                                로그인 유지
                            </label>
                        </div>
                        <a href="#" class="auth-link text-black">비밀번호 찾기</a>
                    </div>
                    <div class="text-center mt-4 font-weight-light">
                        계정이 없다면? <a href="/register" class="text-primary">가입하기</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- content-wrapper ends -->
