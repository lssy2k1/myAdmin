    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <style>
        .media {
            overflow-y: auto; /* 반드시 overlay 처리 */
        }

        .media::-webkit-scrollbar {
            width: 14px;
            height: 14px;
        }

        .media::-webkit-scrollbar-thumb {
            outline: none;
            border-radius: 10px;
            border: 4px solid transparent;
            box-shadow: inset 6px 6px 0 rgba(34, 34, 34, 0.15);
        }

        .media::-webkit-scrollbar-thumb:hover {
            border: 4px solid transparent;
            box-shadow: inset 6px 6px 0 rgba(34, 34, 34, 0.3);
        }

        .media::-webkit-scrollbar-track {
            box-shadow: none;
            background-color: transparent;
        }
    </style>
    <script>
        let tab = {
            init: function() {
                $('ul.nav-tabs li a').click(function(){
                    var tab_id = $(this).attr('aria-controls');

                    $('ul.nav-tabs li a').removeClass('active');
                    $('.tab-pane').removeClass('active');

                    $(this).addClass('active');
                    $("#"+tab_id).addClass('active show');
                });
            }
        };
        // let trckattd = {
        //     init: function() {
        //         var stdnId = $('#stdnId').val();
        //         var day = $('#tableDay').text();
        //         var month = $('#tableMonth').text();
        //         $.ajax({
        //             url: '/trckattd',
        //             data: {
        //                 stdnId: stdnId,
        //                 month: month,
        //                 day: day
        //             },
        //             success: function (data) {
        //                 console.log(data);
        //                 var attd = data;
        //                 var cellId = "#" + month + "_" + day;
        //                 var attdImg;
        //
        //                 if (attd === '1') {
        //                     attdImg = 'attended.png';
        //                 } else if (attd === '2') {
        //                     attdImg = 'late.png';
        //                 } else {
        //                     attdImg = 'absent.png';
        //                 }
        //
        //                 // 이미지 출력
        //                 $(cellId).html('<img src="/images/'+attdImg+'">');
        //             }
        //         });
        //     }
        // }
        $(function(){
            tab.init();
            // trckattd.init();
        })
    </script>

    <div class="content-wrapper">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body" style="padding: 40px">
                        <div class="row">
                            <div class="col-lg-4">
                                <div class="border-bottom text-center pb-4">
                                    <c:choose>
                                        <c:when test="${stdn.img==null || (stdn.img).equals('')}"><img id="stdn_img"
                                                                                                       src="/images/adm.png"
                                                                                                       alt="profile img"
                                                                                                       class="img-lg rounded-circle mb-3"/>
                                        </c:when>
                                        <c:when test="${stdn.img!=null || !(stdn.img).equals('')}"><img id="stdn_img"
                                                                                                        src="/uimg/${stdn.img}"
                                                                                                        alt="profile img"
                                                                                                        class="img-lg rounded-circle mb-3"/>
                                        </c:when>
                                    </c:choose>
                                    <div class="mb-3">
                                        <h3>${stdn.name}</h3>
                                        <div class="d-flex align-items-center justify-content-center">
                                            <h5 class="mb-0 me-2 text-muted">KB국민은행</h5>
                                        </div>
                                    </div>
                                    <p class="w-75 mx-auto mb-3">"${mypage.detail}"</p>
                                    <div class="d-flex justify-content-center">
                                        <p class="nav-link">
                                            <i class="ti-calendar"></i>
                                            입행일 : ${mypage.comdate}
                                        </p>
                                        <p class="nav-link">
                                            <i class="ti-calendar"></i>
                                            입과일 : ${mypage.digidate}
                                        </p>
                                    </div>
                                </div>
                                <div class="border-bottom py-4">
                                    <p>관심사</p>
                                    <div>
                                        <label class="badge badge-outline-dark">${stdn.sbj1}</label>
                                        <label class="badge badge-outline-dark">${stdn.sbj2}</label>
                                        <label class="badge badge-outline-dark">${stdn.sbj3}</label>
                                    </div>
                                </div>
                                <div class="border-bottom py-4">
                                    <div class="d-flex mb-3">
                                        <div class="progress progress-md flex-grow">
                                            <div class="progress-bar bg-primary" role="progressbar" aria-valuenow="55"
                                                 style="width: 55%" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                    </div>
                                    <div class="d-flex">
                                        <div class="progress progress-md flex-grow">
                                            <div class="progress-bar bg-success" role="progressbar" aria-valuenow="75"
                                                 style="width: 75%" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="py-4">
                                    <p class="clearfix">
                                        <span class="float-left">출결</span>
                                        <span class="float-right text-muted">
                                            <c:choose>
                                                <c:when test="${attd.isAttend == '1'}">
                                                    <span class="badge badge-outline-success" style="padding:1px">출석</span>
                                                </c:when>
                                                <c:when test="${attd.isAttend == '2'}">
                                                    <span class="badge badge-outline-warning">지각</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="badge badge-outline-danger"
                                                          style="padding:4px 6px">결석</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </span>
                                    </p>
                                    <p class="clearfix">
                                        <span class="float-left">연락처</span>
                                        <span class="float-right text-muted">${stdn.contact}</span>
                                    </p>
                                    <p class="clearfix">
                                        <span class="float-left">이메일</span>
                                        <span class="float-right text-muted">${stdn.email}</span>
                                    </p>
                                    <p class="clearfix">
                                        <span class="float-left">Instagram</span>
                                        <span class="float-right text-muted">
                                            <a href="${mypage.insta}">바로가기</a>
                                        </span>
                                    </p>
                                    <p class="clearfix">
                                        <span class="float-left">Facebook</span>
                                        <span class="float-right text-muted">
                                            <c:choose>
                                                <c:when test="${mypage.facebook == null}">
                                                    없음
                                                </c:when>
                                                <c:otherwise>
                                                    <a href="${mypage.facebook}">바로가기</a>
                                                </c:otherwise>
                                            </c:choose>

                                        </span>
                                    </p>
                                </div>
                                <a class="btn btn-primary btn-block mb-2" href="/stdn/all" type="button">
                                    목록으로 돌아가기
                                </a>
                            </div>
                            <div class="col-lg-8">
                                <ul class="nav nav-tabs" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" id="home-tab" data-bs-toggle="tab" href="#" role="tab"
                                           aria-controls="home-1" aria-selected="false">기본정보</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="attd-tab" data-bs-toggle="tab" href="#"
                                           role="tab" aria-controls="attd-1" aria-selected="false">출결</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="study-tab" data-bs-toggle="tab" href="#"
                                           role="tab" aria-controls="study-1" aria-selected="true">스터디</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="test-tab" data-bs-toggle="tab" href="#"
                                           role="tab" aria-controls="test-1" aria-selected="true">테스트</a>
                                    </li>
                                </ul>
                                <div class="tab-content" style="padding:30px 30px 20px 30px">
                                    <div class="tab-pane fade active show" id="home-1" role="tabpanel" aria-labelledby="home-tab">
                                        <div class="media">
    <%--                                        <div class="float-left card-title text-primary" style="padding: 0 40px 0 20px">--%>
    <%--                                            <i class="fa fa-user-o"></i> 아이디--%>
    <%--                                        </div>--%>
    <%--                                        <div class="float-right">${stdn.id}</div>--%>
                                            <ul class="list-star">
                                                <li>아이디 : ${stdn.id}</li>
                                                <li>생일 : ${stdn.birthday}</li>
                                                <li>구독여부 : ${stdn.isSubsc}</li>
                                                <li>쿠폰 보유 :
                                                    <c:choose>
                                                        <c:when test="${cpn != null && !cpn.eqauls('')}">${stdn.cpn}개</c:when>
                                                        <c:otherwise>0개</c:otherwise>
                                                    </c:choose>
                                                </li>
                                                <li>최종 접속일 : ${stdn.lastVisit}</li>
                                                <li>비밀번호 오류횟수 :
                                                    <c:choose>
                                                        <c:when test="${loginError != null && !loginError.eqauls('')}">${stdn.loginError}회</c:when>
                                                        <c:otherwise>0회</c:otherwise>
                                                    </c:choose>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="attd-1" role="tabpanel" aria-labelledby="attd-tab"  style="overflow: scroll">
                                        <div class="media">
                                            <table class="table-bordered" style="text-align: center">
                                                <thead>
                                                    <tr>
                                                        <th class="px-lg-2 py-lg-3"><div style="width: 45px">월 \ 일</div></th>
                                                        <c:forEach var="day" begin="1" end="31">
                                                            <th class="px-lg-2"><div style="width: 50px">${String.format("%02d", day)}일</div></th>
                                                        </c:forEach>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:set value="0" var="cnt"></c:set>
                                                    <c:forEach var="month" begin="2" end="7">
                                                        <c:set var="num" value="${cnt = cnt+1}"></c:set>
                                                        <c:set var="lname" value="data${num}"></c:set>
                                                        <tr>
                                                            <th class="py-lg-3"><span>${month}월</th>
                                                            <c:forEach var="day" begin="1" end="31">
                                                                <td id="${String.format("%02d", month)}_${String.format("%02d", day)}">
                                                                    <c:forEach var="a" items="${requestScope[lname]}">
                                                                        <c:if test="${a.month eq String.format('%02d', month) && a.day eq day}">
                                                                            <c:if test="${a.isAttend == '1'}"><img src="/images/attended.png" style="width:80%; height:80%"></c:if>
                                                                            <c:if test="${a.isAttend == '2'}"><img src="/images/late.png" style="width:80%; height:80%"></c:if>
                                                                            <c:if test="${a.isAttend == '0'}"><img src="/images/absent.png" style="width:80%; height:80%"></c:if>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </td>
                                                            </c:forEach>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div style="margin-top:20px; display: inline-flex; float: right">
                                            <div style="margin-right: 40px"><img src="/images/attended.png" style="width: 40px; height: 40px"> : 출석</div>
                                            <div style="margin-right: 35px"><img src="/images/late.png" style="width: 40px; height: 40px"> : 지각</div>
                                            <div style="margin-right: 10px"><img src="/images/absent.png" style="width: 40px; height: 40px"> : 결석</div>
                                        </div>
                                    </div>
<%--                                    <div class="tab-pane fade" id="attd-1" role="tabpanel" aria-labelledby="attd-tab"  style="overflow: scroll">--%>
<%--                                        <div class="media">--%>
<%--                                            <input type="hidden" id="stdnId" name="stdnId" value=${stdn.id}>--%>
<%--                                            <table class="table-bordered" style="text-align: center">--%>
<%--                                                <tr>--%>
<%--                                                    <th>월\일</th>--%>
<%--                                                    <c:forEach var="day" begin="1" end="31">--%>
<%--                                                        <th class="w-10 p-2" id="tableDay">${String.format("%02d", day)}</th>--%>
<%--                                                    </c:forEach>--%>
<%--                                                </tr>--%>
<%--                                                <c:forEach var="month" begin="5" end="7">--%>
<%--                                                    <tr>--%>
<%--                                                        <th class="w-10 p-2"><span id="tableMonth">${String.format("%02d", month)}</span>월</th>--%>
<%--                                                        <c:forEach var="day" begin="1" end="31">--%>
<%--                                                            <td id="${String.format("%02d", month)}_${String.format("%02d", day)}"></td>--%>
<%--                                                        </c:forEach>--%>
<%--                                                    </tr>--%>
<%--                                                </c:forEach>--%>
<%--                                            </table>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
                                    <div class="tab-pane fade" id="study-1" role="tabpanel"
                                         aria-labelledby="study-tab">
                                        <h4>Contact us </h4>
                                        <p>
                                            Feel free to contact us if you have any questions!
                                        </p>
                                        <p>
                                            <i class="ti-headphone-alt text-info"></i>
                                            +123456789
                                        </p>
                                        <p>
                                            <i class="ti-email text-success"></i>
                                            contactus@example.com
                                        </p>
                                    </div>
                                    <div class="tab-pane fade" id="test-1" role="tabpanel"
                                         aria-labelledby="test-tab">
                                        <h4>Contact us </h4>
                                        <p>
                                            Feel free to contact us if you have any questions!
                                        </p>
                                        <p>
                                            <i class="ti-headphone-alt text-info"></i>
                                            +123456789
                                        </p>
                                        <p>
                                            <i class="ti-email text-success"></i>
                                            contactus@example.com
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- content-wrapper ends -->

