<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script>
    let anc_edit = {
        init:()=>{
            $('#anc_delete_btn').click(()=>{
                let b = confirm("삭제하시겠습니까?");
                if(b){
                    location.href = '/anc/deleteimpl?id=${anc.id}';
                }
            });
        }
    };
    $(function(){
        anc_edit.init();
    });
</script>

<!-- partial -->

<div class="content-wrapper">
    <div class="row">

        <div class="col-lg-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title pl-1 mt-1 mb-5 text-primary">상세보기</h4>

                    <div class="table-responsive">
                        <table class="table table-borderless">


                            <tbody>
                                <tr>
                                    <td width="200">글번호</td>
                                    <td>${anc.id}</td>
                                </tr>
                                <tr>
                                    <td>작성자</td>
                                    <td>${anc.writer}</td>
                                </tr>
                                <tr>
                                    <td>제목</td>
                                    <td>${anc.title}</td>
                                </tr>
                                <tr>
                                    <td>내용</td>
                                    <td>${anc.contents}</td>
                                </tr>
                                <tr>
                                    <td>등록일자</td>
                                    <td>${anc.rdate}</td>
                                </tr>
                                <tr>
                                    <td>첨부파일</td>
                                    <td><img src = "/uimg/${anc.img}"></td>
                                </tr>

                                </tbody>
                        </table>
                    </div>
                    <div  style="margin-top:15px; float:right">
                        <a type="button" href="/anc/edit?id=${anc.id}" class="btn btn-outline-primary btn-icon-text">
                            수정하기
                        </a>
                        <button id = "anc_delete_btn" type="button" class="btn btn-light">삭제하기</button>
                    </div>
                </div>
            </div>

        </div>


    </div>
</div>
                <!-- content-wrapper ends -->
