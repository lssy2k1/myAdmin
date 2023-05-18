<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    let adm_register = {
        init:()=>{
            $('#adm_register_btn').click(() =>{
                adm_register.send();
            });
            $('#adm_can_btn').click(()=>{
                location.href = '/';
            })
            $('#recommend_id').click(() =>{
                adm_register.giveid();
            })
        },
        send:()=>{
            $('#adm_register_form').attr({
                action:'/adm/addimpl',
                method:'post',
            });
            $('#adm_register_form').submit();
        },
        giveid: (result)=>{
            $.ajax({
                url:'/giveid',
                success:(result)=>{
                    if(result) {
                        $('#id').val(result);
                    }
                }
            });
        }
    };
    $(function(){
        adm_register.init();
    });
</script>

<div class="content-wrapper d-flex align-items-center auth px-0">
    <div class="row w-100 mx-0">
        <div class="col-lg-6 mx-auto">
            <div class="auth-form-light text-left py-5 px-4 px-sm-5">
                <div class="brand-logo">
                    <img src="/images/logo_square.png" alt="logo">
                </div>
                <h4>Register</h4>
                <h6 class="font-weight-light">Signing up is easy. It only takes a few steps!</h6>
                <form class="pt-3" id="adm_register_form">
                    <div class="form-group">
                        <label for="id">ID</label>
                        <div class="input-group">
                            <input type="text" class="form-control" name = "id" id="id" placeholder="input id" aria-label="input id">
                            <div class="input-group-prepend">
                                <button class="btn btn-sm btn-primary" type="button" id="recommend_id">Recommend ID</button>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="pwd">PWD</label>
                        <input type="password" class="form-control" name = "pwd" id="pwd" placeholder="input pwd">
                    </div>
                    <div class="form-group">
                        <label for="lev">LEVEL</label>
                        <select class="form-control" id="lev" name = "lev" >
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                        </select>
                    </div>
                    <div class="mt-3">
                        <button id="adm_register_btn" class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn">REGISTER</button>
                    </div>
                    <div class="mt-3">
                        <button id = "adm_can_btn" class="btn btn-block btn-outline-primary btn-lg font-weight-medium auth-form-btn">CANCEL</button>
                    </div>
                    <div class="text-center mt-4 font-weight-light">
                        Already have an account? <a href="/logins" class="text-primary">Login</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- content-wrapper ends -->