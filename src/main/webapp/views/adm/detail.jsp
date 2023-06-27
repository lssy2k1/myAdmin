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
    <div class="row justify-content-center">

        <div class="col-md-7 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title pl-1 mt-1 mb-4 text-primary">관리자 상세조회</h4>

                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead class="text-center font-weight-bold">
                                <tr class="font-weight-bold">
                                    <th style="width: 35%"></th>
                                    <th style="width: 65%"></th>
                                </tr>
                            </thead>
                            <tbody class="text-center">

                                <tr>
                                    <td class="font-weight-bold">아이디</td>
                                    <td class="text-left">${adm.id}</td>
                                </tr>
                                <tr>
                                    <td class="font-weight-bold">이름</td>
                                    <td class="text-left">${adm.name}</td>
                                </tr>
                                <tr>
                                    <td class="font-weight-bold">권한 타입</td>
                                    <td class="text-left">${adm.lev}</td>
                                </tr>
                                <tr>
                                    <td class="font-weight-bold">이메일</td>
                                    <td class="text-left">${adm.email}</td>
                                </tr>
                                <tr>
                                    <td class="font-weight-bold">연락처</td>
                                    <td class="text-left">${adm.contact}</td>
                                </tr>
                                <tr>
                                    <td class="font-weight-bold">주소</td>
                                    <td class="text-left">${adm.addr}</td>
                                </tr>
                                <tr>
                                    <td class="font-weight-bold">등록일자</td>
                                    <td class="text-left">${adm.rdate}</td>
                                </tr>
                                <tr>
                                    <td class="font-weight-bold">삭제여부</td>
                                    <td class="text-left">${adm.isDelete}</td>
                                </tr>
                                <tr>
                                    <td class="font-weight-bold">삭제날짜</td>
                                    <td class="text-left">
                                        <c:if test="${adm.isDelete=='1'}">
                                            ${adm.delDate}
                                        </c:if>
                                    </td>

                                </tr>

                            </tbody>
                        </table>
                    </div>

                    <div class="float-right mt-4">
                        <a href = "/adm/edit?id=${adm.id}" type="button" class="btn btn-outline-primary mr-2">수정</a>
                        <button id="adm_delete_btn" type="button" class="btn btn-outline-primary mr-2">삭제</button>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
                <!-- content-wrapper ends -->
