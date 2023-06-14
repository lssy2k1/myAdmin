<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    let adm_register = {
        init:()=>{

            $('#adm_register_btn').addClass('disabled');

            $('#adm_register_btn').click(() =>{
                adm_register.send();
            });

            $('#email').keyup(function(){
                var id = $('#id').val();
                var pwd = $('#pwd').val();
                var name = $('#name').val();
                var email = $('#email').val();
                if(id != ''&& pwd != '' & name != '' & email != ''){
                    $('#adm_register_btn').removeClass('disabled');
                }
            });
            $('#id').keyup(() => {
                var txt_id = $('#id').val();
                if(txt_id.length <= 3){
                    return;
                }
                $.ajax({
                    url : '/checkid',
                    data : {id:txt_id},
                    success:function(result){
                        if(result == 0){
                            $('#check_id').text('사용가능합니다.')
                            // $('#pwd').focus();
                        } else{
                            $('#check_id').text('사용불가능합니다.')
                        }
                    }
                })
            });


            $('#adm_can_btn').click(()=>{
                location.href = '/';
            })
            $('#recommend_id').click(() =>{
                adm_register.giveid();
            })
        },
        send:()=>{

            var id = $('#id').val();
            var pwd = $('#pwd').val();
            var name = $('#name').val();
            var email = $('#email').val();
            if(id.length <= 3){
                $('#check_id').text('id는 4자리 이상이어야 합니다.');
                $('#id').focus();
                return;
            } else{
                $('#check_id').text('');
            }
            if(pwd.length <= 3){
                $('#check_pwd').text('pwd는 4자리 이상이어야 합니다.');
                $('#pwd').focus();
                return;
            } else{
                $('#check_pwd').text('');
            }
            if(name.length==''){
                $('#check_name').text('이름을 입력하세요.');
                $('#name').focus();
                return;
            } else{
                $('#check_name').text('');
            }
            if(email.length==''){
                $('#check_email').text('이메일을 입력하세요.');
                $('#email').focus();
                return;
            } else{
                $('#check_email').text('');
            }


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
                <h4>관리자 등록</h4>
                <h6 class="font-weight-light">기본 정보만 등록한 후, 마이 페이지에서 추가정보를 등록하세요.</h6>
                <form class="pt-3" id="adm_register_form">
                    <div class="form-group">
                        <label for="id">아이디</label>
                        <div class="input-group">
                            <input type="text" class="form-control" name = "id" id="id" placeholder="아이디를 입력하세요..." aria-label="input id">
                            <div class="input-group-prepend">
                                <button class="btn btn-sm btn-primary" type="button" id="recommend_id">아이디 추천</button>
                            </div>
                        </div>
                        <div>
                            <span id = "check_id"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="pwd">비밀번호</label>
                        <input type="password" class="form-control" name = "pwd" id="pwd" placeholder="비밀번호를 입력하세요...">
                        <div>
                            <span id = "check_pwd"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="name">이름</label>
                        <input type="text" class="form-control" name = "name" id="name" placeholder="이름을 입력하세요...">
                        <div>
                            <span id = "check_name"></span>
                        </div>
                    </div>

<%--                    디폴트로 레벨 1 부여--%>
<%--                    <div class="form-group">--%>
<%--                        <label for="lev">권한 타입</label>--%>
<%--                        <select class="form-control" id="lev" name = "lev" >--%>
<%--                            <option>1</option>--%>
<%--                            <option>2</option>--%>
<%--                            <option>3</option>--%>
<%--                        </select>--%>
<%--                    </div>--%>

                    <div class="form-group">
                        <label for="email">이메일</label>
                        <input type="email" class="form-control" name = "email" id="email" placeholder="이메일을 입력하세요...">
                    </div>

                    <div class="mt-3">
                        <button type="button" id="adm_register_btn" class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn">등록</button>
                    </div>
                    <div class="mt-3">
                        <button id = "adm_can_btn" class="btn btn-block btn-outline-primary btn-lg font-weight-medium auth-form-btn">취소</button>
                    </div>
                    <div class="text-center mt-4 font-weight-light">
                        이미 계정이 있으신가요? <a href="/logins" class="text-primary">로그인</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>