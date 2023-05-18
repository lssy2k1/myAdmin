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
                action:'/adm/loginimpl',
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
                <h4>Hello! let's get started:D</h4>
                <h6 class="font-weight-light">Sign in to continue.</h6>
                <form id="adm_login_form" class="pt-3">
                    <div class="form-group">
                        <label for="id">ID</label>
                        <input type="text" class="form-control form-control-lg" name="id" id="id" placeholder="Input ID">
                    </div>
                    <div class="form-group">
                        <label for="pwd">PWD</label>
                        <input type="password" class="form-control form-control-lg" name="pwd" id="pwd" placeholder="Input Password">
                    </div>
                    <div class="mt-3">
                        <button id="adm_login_btn" type="button" class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn">SIGN IN</button>
                        <button id="adm_can_btn" type="button" class="btn btn-block btn-outline-primary btn-lg font-weight-medium auth-form-btn">Cancel</button>
                    </div>
                    <div class="my-2 d-flex justify-content-between align-items-center">
                        <div class="form-check">
                            <label class="form-check-label text-muted">
                                <input type="checkbox" class="form-check-input">
                                Keep me signed in
                            </label>
                        </div>
                        <a href="#" class="auth-link text-black">Forgot password?</a>
                    </div>
                    <div class="text-center mt-4 font-weight-light">
                        Don't have an account? <a href="/register" class="text-primary">Create</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- content-wrapper ends -->
