<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script>
    let lec_detail = {
        init: () => {
            $('#lec_delete_btn').click(() => {
                let b = confirm("삭제하시겠습니까?");
                if (b) {
                    location.href = '/lec/deleteimpl?id=${lec.id}';
                }
            })
        }
    };
    $(function () {
        lec_detail.init();
    });
</script>

<!-- partial -->
<div class="content-wrapper">
    <div class="row px-1">

        <div class="col-lg-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title pl-1 mt-1 mb-5 text-primary">강의 세부사항</h4>
                    <div class="table-responsive d-flex justify-content-between">
                        <div class="d-flex align-content-start" style="width: 30%">
                            <img src="/uimg/${lec.img}" alt="강의 이미지" style="width: 100%; height: auto">
                        </div>
                        <div class="pl-4 pr-2" style="width: 70%">
                            <table class="table table-border">
                                <thead>
                                <tr>
                                    <th class="text-center font-weight-bold" style="width: 30%">강의 등록번호</th>
                                    <th class="font-weight-normal" style="width: 70%">${lec.id}</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td class="text-center font-weight-bold">강의명</td>
                                    <td>${lec.title}</td>
                                </tr>
                                <tr>
                                    <td class="text-center font-weight-bold">강의코드</td>
                                    <td>${lec.lecCode}</td>
                                </tr>
                                <tr>
                                    <td class="text-center font-weight-bold">강사</td>
                                    <td>${lec.teacher}</td>
                                </tr>
                                <tr>
                                    <td class="text-center font-weight-bold">분야</td>
                                    <td>${lec.topic}</td>
                                </tr>
                                <tr>
                                    <td class="text-center font-weight-bold">연관 사이트</td>
                                    <td>${lec.target}</td>
                                </tr>
                                <tr>
                                    <td class="text-center font-weight-bold">총 강의 시간</td>
                                    <td>${lec.length}</td>
                                </tr>
                                <tr>
                                    <td class="text-center font-weight-bold">별점</td>
                                    <td>${lec.rating}</td>
                                </tr>
                                <tr>
                                    <td class="text-center font-weight-bold">가격</td>
                                    <td>${lec.price}</td>
                                </tr>
                                <tr>
                                    <td class="text-center font-weight-bold">할인률</td>
                                    <td>${lec.discRate}</td>
                                </tr>
                                <tr>
                                    <td class="text-center font-weight-bold">등록일자</td>
                                    <td>${lec.rdate}</td>
                                </tr>
                                <tr>
                                    <td class="text-center font-weight-bold">공개여부</td>
                                    <td>${lec.isDelete}</td>
                                </tr>
                                <tr>
                                    <td class="text-center font-weight-bold">삭제일자</td>
                                    <td>
                                        <c:if test="${lec.isDelete==1}">
                                            ${lec.delDate}
                                        </c:if>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="text-center font-weight-bold">수강생 수</td>
                                    <td>${lec.hit}</td>
                                </tr>


                                </tbody>
                            </table>


                            <div style="display: flex; justify-content: end; margin-top: 20px">
                                <a href="/lec/edit?id=${lec.id}" type="button" class="btn btn-primary mr-2">강의 수정</a>
                                <button type="button" id="lec_delete_btn" class="btn btn-primary mr-1">강의 삭제</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>