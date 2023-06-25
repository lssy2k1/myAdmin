<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script>
    let lec_detail = {
        init:()=>{
            $('#lec_delete_btn').click(()=>{
                let b = confirm("삭제하시겠습니까?");
                if(b){
                    location.href = '/lec/deleteimpl?id=${lec.id}';
                }
            })
        }
    };
    $(function(){
        lec_detail.init();
    });
</script>

<!-- partial -->
<div class="content-wrapper">
    <div class="row">

        <div class="col-lg-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title pl-1 mt-1 mb-5 text-primary">강의 세부사항</h4>
                    <div class="table-responsive">
                        <div style = "display: flex; align-items: flex-start;">
                            <img src="/uimg/${lec.img}" style = "width:300px; height:300px">
                        <table class="table table-border">
                            <thead>
                                <tr>
<%--                                    <th></th>--%>
                                    <th>목록</th>
                                    <th>내용</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
<%--                                    <th rowspan="14"><img src="/uimg/${lec.img}"></th>--%>
                                    <td>강의 등록번호</td>
                                    <td>${lec.id}</td>
                                </tr>
                                <tr>
                                    <td>강의명</td>
                                    <td>${lec.title}</td>
                                </tr>
                                <tr>
                                    <td>강의코드</td>
                                    <td>${lec.lecCode}</td>
                                </tr>
                                <tr>
                                    <td>강사</td>
                                    <td>${lec.teacher}</td>
                                </tr>
                                <tr>
                                    <td>분야</td>
                                    <td>${lec.topic}</td>
                                </tr>
                                <tr>
                                    <td>연관 사이트</td>
                                    <td>${lec.target}</td>
                                </tr>
                                <tr>
                                    <td>총 강의 시간</td>
                                    <td>${lec.length}</td>
                                </tr>
                                <tr>
                                    <td>별점</td>
                                    <td>${lec.rating}</td>
                                </tr>
                                <tr>
                                    <td>가격</td>
                                    <td>${lec.price}</td>
                                </tr>
                                <tr>
                                    <td>할인률</td>
                                    <td>${lec.discRate}</td>
                                </tr>
                                <tr>
                                    <td>등록일자</td>
                                    <td>${lec.rdate}</td>
                                </tr>
                                <tr>
                                    <td>공개여부</td>
                                    <td>${lec.isDelete}</td>
                                </tr>
                                <tr>
                                    <td>삭제일자</td>
                                    <td>
                                        <c:if test="${lec.isDelete==1}">
                                            ${lec.delDate}
                                        </c:if>
                                    </td>
                                </tr>
                                <tr>
                                    <td>수강생 수</td>
                                    <td>${lec.hit}</td>
                                </tr>


                            </tbody>
                        </table>
                        </div>

                        <div style="display: flex; justify-content: end; margin-top: 20px">
                            <a href ="/lec/edit?id=${lec.id}" type="button" class="btn btn-primary mb-2" style="margin-right: 20px">강의 수정</a>
                            <button type="button" id = "lec_delete_btn" class="btn btn-primary mb-2" style="margin-right: 20px">강의 삭제</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>