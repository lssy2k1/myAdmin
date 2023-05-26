<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    let adm_edit = {
        init:()=>{
            $('#adm_update_btn').click(() =>{
                adm_edit.send();
            });
            $('#adm_delete_btn').click(()=>{
                let b = confirm("삭제하시겠습니까?");
                if(b){
                    location.href = '/adm/deleteimpl?id=${adm.id}';
                }
            });
        },
        send:()=>{
            $('#adm_edit_form').attr({
                action:'/adm/updateimpl',
                method:'post',
            });
            $('#adm_edit_form').submit();
        }
    };
    $(function(){
        adm_edit.init();
    });
</script>

<!-- partial -->

<div class="content-wrapper">
    <div class="row">

        <div class="col-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">관리자 정보 수정</h4>
                    <p class="card-description">
                        추가 정보를 입력하세요.
                    </p>

                    <form id = "adm_edit_form" class="forms-sample">
                        <div class="form-group">
                            <label for="id">아이디</label>
                            <div class="input-group">
                                <input type="text" class="form-control" name = "id" id="id" value = "${adm.id}" readonly aria-label="input id">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="pwd">비밀번호</label>
                            <input type="password" class="form-control" name = "pwd" id="pwd" placeholder="비밀번호를 새로 입력하세요...">
                        </div>

                        <c:if test="${loginadm.lev==3}">
                            <div class="form-group">
                                <label for="lev">권한 타입</label>
                                <select class="form-control" id="lev" name = "lev" >
                                    <option <c:if test="${adm.lev=='1'}">selected</c:if>>1</option>
                                    <option <c:if test="${adm.lev=='2'}">selected</c:if>>2</option>
                                    <option <c:if test="${adm.lev=='3'}">selected</c:if>>3</option>
                                </select>
                            </div>
                        </c:if>

                        <div class="form-group">
                            <label for="email">연락처</label>
                            <input type="email" class="form-control" name = "email" id="email" value="${adm.email}">
                        </div>
                        <div class="form-group">
                            <label for="addr">주소</label>
                            <input type="text" class="form-control" name = "addr" id="addr" value="${adm.addr}">
                        </div>

                        <c:if test="${loginadm.lev==3}">
                            <div class="form-group">
                                <label for="isDelete">공개여부</label>
                                <select class="form-control" id="isDelete" name = "isDelete" >
                                    <option value="0" <c:if test="${adm.isDelete=='0'}">selected</c:if>>활성화</option>
                                    <option value="1" <c:if test="${adm.isDelete=='1'}">selected</c:if>>삭제</option>
                                </select>
                            </div>
                        </c:if>
                        
                        <button id = "adm_update_btn" type="button" class="btn btn-primary mr-2">Update</button>
                        <button id = "adm_delete_btn" type="button" class="btn btn-light">Delete</button>
                    </form>
                </div>
            </div>
        </div>

    </div>
</div>
<!-- content-wrapper ends -->
