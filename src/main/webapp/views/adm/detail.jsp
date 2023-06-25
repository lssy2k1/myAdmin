<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    let adm_detail = {
        init:()=>{
            $('#adm_delete_btn').click(()=>{
                let b = confirm("삭제하시겠습니까?");
                if(b){
                    location.href = '/adm/deleteimpl?id=${adm.id}';
                }
            })
        }
    };
    $(function(){
        adm_detail.init();
    });
</script>

<!-- partial -->

<div class="content-wrapper">
    <div class="row">

        <div class="col-lg-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title pl-1 mt-1 mb-5 text-primary">관리자 상세조회</h4>

                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>항목</th>
                                    <th>내용</th>
                                </tr>
                            </thead>
                            <tbody>

                                <tr>
                                    <td>아이디</td>
                                    <td>${adm.id}</td>
                                </tr>
                                <tr>
                                    <td>이름</td>
                                    <td>${adm.name}</td>
                                </tr>
                                <tr>
                                    <td>권한 타입</td>
                                    <td>${adm.lev}</td>
                                </tr>
                                <tr>
                                    <td>이메일</td>
                                    <td>${adm.email}</td>
                                </tr>
                                <tr>
                                    <td>연락처</td>
                                    <td>${adm.contact}</td>
                                </tr>
                                <tr>
                                    <td>주소</td>
                                    <td>${adm.addr}</td>
                                </tr>
                                <tr>
                                    <td>등록일자</td>
                                    <td>${adm.rdate}</td>
                                </tr>
                                <tr>
                                    <td>삭제여부</td>
                                    <td>${adm.isDelete}</td>
                                </tr>
                                <tr>
                                    <td>삭제날짜</td>
                                    <td>
                                        <c:if test="${adm.isDelete=='1'}">
                                            ${adm.delDate}
                                        </c:if>
                                    </td>

                                </tr>

                            </tbody>
                        </table>
                    </div>

                    <div class="float-right mt-3">
                        <a href = "/adm/edit?id=${adm.id}" type="button" class="btn btn-outline-primary mr-2">수정</a>
                        <button id="adm_delete_btn" type="button" class="btn btn-outline-primary mr-2">삭제</button>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
                <!-- content-wrapper ends -->
