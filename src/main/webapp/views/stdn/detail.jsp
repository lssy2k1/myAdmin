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

        .scoreText {
            background-color: #ffffff;
            color: #000000;
            display:none;
            font-size: smaller;
        }

        .scoreTd:hover {
            background-color: #FFFFFF;
        }
        .scoreTd:hover .scoreTitle {
            display: none;
        }
        .scoreTd:hover .scoreText {
            display:block;
        }
    </style>

    <script>

        let chartmaker = {
            init:() =>{
                // alert('start chart making')
                chartmaker.getdata();
            },
            getdata(){
                // alert('start chart making2')

                $.ajax({
                    url:'/chartmaker',
                    data : {
                        id : '${stdn.id}'
                    },
                    method:'GET',
                    success: (data)=>{
                        // console.log(data);
                        // console.log('succeess ===== chartmaker');
                        //alert(data);
                        chartmaker.makechart(data);
                    }
                })
            },
            makechart(data){
                    var SalesChartCanvas = $("#sales-chart").get(0).getContext("2d");
                    var SalesChart = new Chart(SalesChartCanvas, {
                        type: 'bar',
                        data: {
                            labels: ["전체", "프론트엔드", "백엔드"],
                            datasets: [{
                                label: '평균',
                                data: data.avg,
                                backgroundColor: '#98BDFF'
                            },
                                {
                                    label: '내 성적',
                                    data: data.my,
                                    backgroundColor: '#4B49AC'
                                }
                            ]
                        },
                        options: {
                            cornerRadius: 5,
                            responsive: false,
                            maintainAspectRatio: false,
                            layout: {
                                padding: {
                                    left: 0,
                                    right: 0,
                                    top: 20,
                                    bottom: 0
                                }
                            },
                            scales: {
                                yAxes: [{
                                    display: true,
                                    gridLines: {
                                        display: true,
                                        drawBorder: false,
                                        color: "#F2F2F2"
                                    },
                                    ticks: {
                                        display: true,
                                        min: 0,
                                        max: 100,
                                        callback: function(value, index, values) {
                                            return  value + '$' ;
                                        },
                                        // autoSkip: true,
                                        maxTicksLimit: 10,
                                        fontColor:"#6C7383",
                                    }
                                }],
                                xAxes: [{
                                    stacked: false,
                                    ticks: {
                                        beginAtZero: true,
                                        fontColor: "#6C7383"
                                    },
                                    gridLines: {
                                        color: "rgba(0, 0, 0, 0)",
                                        display: false
                                    },
                                    barPercentage: 0.3
                                }]
                            },
                            legend: {
                                display: false
                            },
                            elements: {
                                point: {
                                    radius: 0
                                }
                            }
                        },
                    });
                    document.getElementById('sales-legend').innerHTML = SalesChart.generate();
                }
        }

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
        $(function(){
            tab.init();
            chartmaker.init();
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
                                    <div>
                                        <div class="nav-link" style="padding: 20px 0 0 0">
                                            <i class="ti-calendar"></i>
                                            입행일 : ${mypage.comdate}
                                        </div>
                                        <div class="nav-link">
                                            <i class="ti-calendar"></i>
                                            입과일 : ${mypage.digidate.substring(0, 4)}-${mypage.digidate.substring(4, 6)}-${mypage.digidate.substring(6)}
                                        </div>
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
                                    <div class="d-flex mb-3" style="display:inline-flex; justify-content: space-between; align-items: center">
                                        <p class="mr-1 my-0" style="width: 3rem">스터디</p>
                                        <div class="progress progress-md flex-grow">
                                            <div class="progress-bar bg-primary" role="progressbar" style="width: ${totalTime.get(2)/1920*100}%" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                    </div>
                                    <div class="d-flex">
                                        <p class="mr-1 my-0" style="width: 3rem">테스트</p>
                                        <div class="progress progress-md flex-grow">
                                            <div class="progress-bar bg-success" role="progressbar" style="width: ${testCnt/50*100}%" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="py-4">
                                    <p class="clearfix">
                                        <span class="float-left">출결</span>
                                        <span class="float-right text-muted">
                                            <c:choose>
                                                <c:when test="${attd.isAttend == '1'}">
                                                    <span class="badge badge-outline-success" style="padding:4px 6px">출석</span>
                                                </c:when>
                                                <c:when test="${attd.isAttend == '2'}">
                                                    <span class="badge badge-outline-warning" style="padding:4px 6px">지각</span>
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
                                <a class="btn btn-outline-primary btn-block mb-2" href="/stdn/update?id=${stdn.id}" type="button">
                                    정보 수정
                                </a>
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
                                        <a class="nav-link" id="test-tab" data-bs-toggle="tab" href="#"
                                           role="tab" aria-controls="test-1" aria-selected="true">테스트</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="study-tab" data-bs-toggle="tab" href="#"
                                           role="tab" aria-controls="study-1" aria-selected="true">스터디</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="stat-tab" data-bs-toggle="tab" href="#"
                                           role="tab" aria-controls="stat-1" aria-selected="true">통계</a>
                                    </li>
                                </ul>
                                <div class="tab-content" style="padding:30px 30px 20px 30px">
                                    <div class="tab-pane fade active show" id="home-1" role="tabpanel" aria-labelledby="home-tab">
                                        <div class="media">
                                            <ul class="list-star" style="font-size: medium">
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
                                    <div class="tab-pane fade" id="attd-1" role="tabpanel" aria-labelledby="attd-tab"  style="overflow: auto">
                                        <div class="media">
                                            <table class="table-bordered" style="text-align: center; vertical-align: center;">
                                                <thead>
                                                    <tr>
                                                        <th class="px-lg-2 py-lg-1">
                                                            <div style="width: 45px; height: 50px; padding-top: 13px">월 \ 일</div>
                                                        </th>
                                                        <c:forEach var="day" begin="1" end="31">
                                                            <th class="px-lg-2">
                                                                <div style="width: 50px; height: 50px; padding-top: 13px">${String.format("%02d", day)}일</div>
                                                            </th>
                                                        </c:forEach>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:set value="0" var="cnt"></c:set>
                                                    <c:forEach var="month" begin="2" end="7">
                                                        <c:set var="num" value="${cnt = cnt+1}"></c:set>
                                                        <c:set var="lname" value="data${num}"></c:set>
                                                        <tr>
                                                            <th class="py-lg-1"><span>${month}월</th>
                                                            <c:forEach var="day" begin="1" end="31">
                                                                <td id="${String.format("%02d", month)}_${String.format("%02d", day)}" style="height: 65px">
                                                                    <c:forEach var="a" items="${requestScope[lname]}">
                                                                        <c:if test="${a.month eq String.format('%02d', month) && a.day eq day}">
                                                                            <c:if test="${a.isAttend == '1'}"><img src="/images/attended.png" style="width:45px; height:45px"></c:if>
                                                                            <c:if test="${a.isAttend == '2'}"><img src="/images/late.png" style="width:45px; height:45px"></c:if>
                                                                            <c:if test="${a.isAttend == '0'}"><img src="/images/absent.png" style="width:45px; height:45px"></c:if>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </td>
                                                            </c:forEach>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div style="margin-top:20px; display: inline-flex; float: right; font-weight: 800">
                                            <div style="margin-right: 40px"><img src="/images/attended.png" style="width: 40px; height: 40px"> : 출석</div>
                                            <div style="margin-right: 35px"><img src="/images/late.png" style="width: 40px; height: 40px"> : 지각</div>
                                            <div style="margin-right: 10px"><img src="/images/absent.png" style="width: 40px; height: 40px"> : 결석</div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="test-1" role="tabpanel"
                                         aria-labelledby="test-tab">
                                        <div class="media">
                                            <table class="table-bordered" style="text-align: center;">
                                                <thead>
                                                <tr>
                                                    <th class="px-lg-2 py-lg-1">
                                                        <div style="width: 45px; height: 50px; padding-top: 13px">월 \ 일</div>
                                                    </th>
                                                    <c:forEach var="day" begin="1" end="31">
                                                        <th class="px-lg-2">
                                                            <div style="width: 50px; height: 50px; padding-top: 13px">${String.format("%02d", day)}일</div>
                                                        </th>
                                                    </c:forEach>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:set value="0" var="cnt"></c:set>
                                                <c:forEach var="month" begin="2" end="7">
                                                    <c:set var="num" value="${cnt = cnt+1}"></c:set>
                                                    <c:set var="lname" value="test${num}"></c:set>
                                                    <tr>
                                                        <th class="py-lg-1"><span>${month}월</th>
                                                        <c:forEach var="day" begin="1" end="31">
                                                            <td class="scoreTd" id="${String.format("%02d", month)}_${String.format("%02d", day)}" style="height: 65px">
                                                                <c:forEach var="t" items="${requestScope[lname]}">
                                                                    <c:if test="${t.month eq String.format('%02d', month) && t.day eq day}">
                                                                        <c:if test="${t.score > 50}">
                                                                            <img src="/images/pass.png" class="scoreTitle"  style="width:45px; height:45px" alt="pass">
                                                                            <div class="scoreText">
                                                                                <div style="font-weight: bold"><span style="font-weight: bolder; color: #008a00"> 주제:</span> ${t.sbj}</div>
                                                                                <div style="font-weight: bold"><span style="font-weight: bolder; color: #008a00"> 점수:</span> ${t.score}</div>
                                                                            </div>
                                                                        </c:if>
                                                                        <c:if test="${t.score <= 50}">
                                                                            <img src="/images/fail.png" class="scoreTitle" style="width:45px; height:45px" alt="fail">
                                                                            <div class="scoreText">
                                                                                <div style="font-weight: bold"><span style="font-weight: bolder; color: #aa1111"> 주제:</span> ${t.sbj}</div>
                                                                                <div style="font-weight: bold"><span style="font-weight: bolder; color: #aa1111"> 점수:</span> ${t.score}</div>
                                                                            </div>
                                                                        </c:if>
                                                                    </c:if>
                                                                </c:forEach>
                                                            </td>
                                                        </c:forEach>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div style="writing-mode: horizontal-tb; margin-top: 20px; font-weight: 800; display: flex; align-items: center"><i class="mdi mdi-comment-question-outline" style="margin-right: 10px"></i> 상세 점수 확인을 위해서는 아이콘 위에 마우스 커서를 올려주세요!</div>
                                    </div>
                                    <div class="tab-pane fade" id="study-1" role="tabpanel"
                                         aria-labelledby="study-tab">
                                        <div class="media">
                                            <table class="table-bordered" style="text-align: center;">
                                                <thead>
                                                <tr>
                                                    <th class="px-lg-2 py-lg-1">
                                                        <div style="width: 45px; height: 50px; padding-top: 13px">월 \ 일</div>
                                                    </th>
                                                    <c:forEach var="day" begin="1" end="31">
                                                        <th class="px-lg-2">
                                                            <div style="width: 50px; height: 50px; padding-top: 13px">${String.format("%02d", day)}일</div>
                                                        </th>
                                                    </c:forEach>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:set value="0" var="cnt"></c:set>
                                                <c:forEach var="month" begin="2" end="7">
                                                    <c:set var="num" value="${cnt = cnt+1}"></c:set>
                                                    <c:set var="lname" value="stdy${num}"></c:set>
                                                    <tr>
                                                        <th class="py-lg-1"><span>${month}월</th>
                                                        <c:forEach var="day" begin="1" end="31">
                                                            <td id="${String.format("%02d", month)}_${String.format("%02d", day)}" style="height: 65px">
                                                                <c:forEach var="s" items="${requestScope[lname]}">
                                                                    <c:if test="${s.month eq String.format('%02d', month) && s.day eq day}">
                                                                        <div style="height: 65px; background-color: lemonchiffon; display: flex; align-items: center; justify-content: center">
                                                                            <div style="font-weight: bold"><span style="font-weight: bolder; color: #008a00"></span> ${s.time}</div>
                                                                        </div>
                                                                    </c:if>
                                                                </c:forEach>
                                                            </td>
                                                        </c:forEach>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div style="writing-mode: horizontal-tb; margin-top: 20px; font-weight: 800; display: flex; align-items: center"><i class="mdi mdi-alarm" style="margin-right: 10px"></i> 스터디 총 합계 : ${totalTime.get(0)}시간 ${totalTime.get(1)}분</div>
                                    </div>
<%--통계 탭 추가----------------------------------------------------------------------------------------------------------------%>
                                    <div class="tab-pane fade" id="stat-1" role="tabpanel" aria-labelledby="stat-tab"  style="overflow: auto">
                                        <div class="media">

                                                <div class="card-body">
                                                    <div class="d-flex justify-content-between">
                                                        <p class="card-title">학생별 통계</p>
                                                        <a href="/stdn/attd" class="text-info">전체 출결</a>
                                                    </div>
<%--                                                    <p class="font-weight-500">The total number of sessions within the date range. It is the period time a user is actively engaged with your website, page or app, etc</p>--%>
                                                    <div id="sales-legend" class="chartjs-legend mt-4 mb-2"></div>
                                                    <canvas id="sales-chart" style = "width : 85vh; height : 60vh"></canvas>
                                                </div>

                                        </div>
                                    </div>
<%--통계 탭 추가----------------------------------------------------------------------------------------------------------------%>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- content-wrapper ends -->

