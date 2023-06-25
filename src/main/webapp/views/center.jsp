<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
  #map{
    width: 100%;
    height: 400px;
    border: transparent 1px solid;
  }

  .chart-container {
    flex-grow: 1;
    display: flex;
    justify-content: center;
    align-items: center;
  }
</style>



<script>

  let makepiechart = {
    init: ()=>{
      $.ajax({
        url:'/piechartdata',
        success:(data)=>{

          var doughnutPieData = {
            datasets: [{
              data: data.sbjcount,
              backgroundColor: [
                'rgba(255, 99, 132, 0.5)',
                'rgba(54, 162, 235, 0.5)',
                'rgba(255, 206, 86, 0.5)',
                'rgba(75, 192, 192, 0.5)',
                'rgba(153, 102, 255, 0.5)',
                'rgba(255, 159, 64, 0.5)'
              ],
              borderColor: [
                'rgba(255,99,132,1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
              ],
            }],
            // These labels appear in the legend and in the tooltips when hovering different arcs
            labels: data.sbjname
          };

          var doughnutPieOptions = {
            responsive: false,//true로 하면 커짐.
            animation: {
              animateScale: true,
              animateRotate: true
            },
            plugins: {
              legend: {
                position: 'bottom' // 라벨을 차트 아래에 표시
              }
            }

          }

          if ($("#pieChart1").length) {
            var pieChartCanvas1 = $("#pieChart1").get(0).getContext("2d");
            var pieChart1 = new Chart(pieChartCanvas1, {
              type: 'pie',
              data: doughnutPieData,
              options: doughnutPieOptions
            });
          }

        }
      })

    }
  };

  let lectabledefault ={
    init:()=>{
      $.ajax({
        url:'/getcurritable',
        method:'get',
        dataType:'json',
        success: function(lecs) {
          // console.log(lecs);
          var html = '';
          lecs.forEach(function(lec) {
            html += `
                <tr>
                    <td>\${lec.title}</td>
                    <td>\${lec.topic}</td>
                    <td>\${lec.teacher}</td>
                    <td>\${lec.rating}</td>
                    <td>\${lec.hit}</td>
                    <td>\${lec.curriSum}</td>
                </tr>
            `;
            // Lec 객체의 속성에 따라 변경해야 합니다.
          });
          $('#hottable').html(html); // 변경하려는 테이블 body 요소의 ID. 실제 ID로 바꿔야 함
        },
        error: function(request, status, error) {
          console.error("데이터를 불러오는데 실패했습니다 : ", error);
        }
      })
    }
  }

  let lectable = {
    init: ()=>{
      //인기강의 관련 화면에서 버튼 누르면 데이터 변경되도록
      $('#table_curri').click(() => {
        $.ajax({
          url:'/getcurritable',
          method:'get',
          dataType:'json',
          success: function(lecs) {
            $('#table_curri').removeClass("btn-outline-primary").addClass("btn-primary");
            $('#table_hit').removeClass("btn-primary").addClass("btn-outline-primary");
            $('#table_rating').removeClass("btn-primary").addClass("btn-outline-primary");
            var html = '';
            lecs.forEach(function(lec) {
              html += '<tr>' +
                      '<td>' + lec.title + '</td>' +
                      '<td>' + lec.topic + '</td>' +
                      '<td>' + lec.teacher + '</td>' +
                      '<td>' + lec.rating + '</td>' +
                      '<td>' + lec.hit + '</td>' +
                      '<td>' + lec.curriSum + '</td>' +
                      '</tr>';
              // Lec 객체의 속성에 따라 변경해야 합니다.
            });
            $('#hottable').html(html); // 변경하려는 테이블 body 요소의 ID. 실제 ID로 바꿔야 함
          },
          error: function(request, status, error) {
            console.error("데이터를 불러오는데 실패했습니다 : ", error);
          }
        })
      })
      $('#table_hit').click(() => {
        $.ajax({
          url:'/gethittable',
          method:'get',
          dataType:'json',
          success: function(lecs) {
            $('#table_curri').removeClass("btn-primary").addClass("btn-outline-primary");
            $('#table_hit').removeClass("btn-outline-primary").addClass("btn-primary");
            $('#table_rating').removeClass("btn-primary").addClass("btn-outline-primary");
            var html = '';
            lecs.forEach(function(lec) {
              html += '<tr>' +
                      '<td>' + lec.title + '</td>' +
                      '<td>' + lec.topic + '</td>' +
                      '<td>' + lec.teacher + '</td>' +
                      '<td>' + lec.rating + '</td>' +
                      '<td>' + lec.hit + '</td>' +
                      '<td>' + lec.curriSum + '</td>' +
                      '</tr>';// Lec 객체의 속성에 따라 변경해야 합니다.
            });
            $('#hottable').html(html); // 변경하려는 테이블 body 요소의 ID. 실제 ID로 바꿔야 함
          },
          error: function(request, status, error) {
            console.error("데이터를 불러오는데 실패했습니다 : ", error);
          }
        })
      })
      $('#table_rating').click(() => {
        $.ajax({
          url:'/getratingtable',
          method:'get',
          dataType:'json',
          success: function(lecs) {
            $('#table_curri').removeClass("btn-primary").addClass("btn-outline-primary");
            $('#table_hit').removeClass("btn-primary").addClass("btn-outline-primary");
            $('#table_rating').removeClass("btn-outline-primary").addClass("btn-primary");
            var html = '';
            lecs.forEach(function(lec) {
              html += '<tr>' +
                      '<td>' + lec.title + '</td>' +
                      '<td>' + lec.topic + '</td>' +
                      '<td>' + lec.teacher + '</td>' +
                      '<td>' + lec.rating + '</td>' +
                      '<td>' + lec.hit + '</td>' +
                      '<td>' + lec.curriSum + '</td>' +
                      '</tr>';// Lec 객체의 속성에 따라 변경해야 합니다.
            });
            $('#hottable').html(html); // 변경하려는 테이블 body 요소의 ID. 실제 ID로 바꿔야 함
          },
          error: function(request, status, error) {
            console.error("데이터를 불러오는데 실패했습니다 : ", error);
          }
        })
      })
    }
  }

  let getrecentlec = {
    init : ()=>{
      $.ajax({
        url: "/getrecentlec",
        method:'get',
        dataType:'json',
        success:(lecs)=>{
          var html = '';
          lecs.forEach(function(lec) {
            html += '<tr>' +
                    '<td>' + lec.odId + '</td>' +
                    '<td>' + lec.title + '</td>' +
                    '<td>' + lec.topic + '</td>' +
                    '<td>' + lec.teacher + '</td>' +
                    '<td>' + lec.name + '</td>' +
                    '<td>' + lec.hit + '</td>' +
                    '<td>' + lec.curriSum + '</td>' +
                    '<td>' + lec.odate + '</td>' +
                    '</tr>';// Lec 객체의 속성에 따라 변경해야 합니다.
          });
          $('#recent_buy_lec').html(html); // 변경하려는 테이블 body 요소의 ID. 실제 ID로 바꿔야 함
        }
      })
    }
  }


  let getDate = {
    init: ()=>{
      getDate.getdate();
    },
    getdate : ()=>{
      $.ajax({
        url: "/getdate",
        success: (result)=>{
          $('#getdate').text(result);
        }
      })
    }
  }
  let getWeather = {
    init:()=>{
      getWeather.getdata();
    },
    getdata:()=>{
      $.ajax({
        url:'/giveweather',
        success:(result)=>{
          let humi = result.humi;
          let temper = result.temper;
          if(temper > 30){
            $('#temperimg').attr('class', 'mdi mdi-fire');
          }
          $('#temperature').text(temper);
          $('#humidity').text(humi);
          let rain = result.rain;
          if(rain == 1 || rain == 2 || rain ==5){
            $('#rain').attr('src', '/images/rain.png');
            $('#temperimg').attr('class', 'mdi mdi-weather-rainy');
          }
          if(rain == 3 || rain == 6 || rain==7){
            $('#rain').attr('src', '/images/snow.png');
            $('#temperimg').attr('class', 'mdi mdi-weather-snowy');
          }
        }
      })
    },
  }
  $(()=>{
    lectable.init();
    lectabledefault.init();
    getWeather.init();
    getDate.init();
    makeKakaoMap3.init();
    setInterval(getrecentlec.init, 2000);
    makepiechart.init();
    setInterval(makepiechart.init, 10000);
    // 로그인 안했을 경우 dashboard화면 안보이도록

    if(${loginadm==null}) {
      $('#onlylogin').css("display", "none");
    }
    //실행시 커리순으로 차트 만들어지도록.




  })
</script>

<!-- partial -->

  <div class="content-wrapper" >
    <div class="row">
      <div class="col-md-12 grid-margin">
        <div class="row">
          <div class="col-12 mb-4 mb-xl-0" style="display: flex; justify-content: space-between">
            <h1 class="font-weight-bold" >Welcome ${loginadm.id}!</h1>
            <div class="btn btn-sm btn-light bg-white" style="height: 2.1rem">
              <a id="getdate" class="text-dark" style="font-size: medium; text-decoration: none" href="/anc/cal"></a>
            </div>
          </div>


          <c:if test="${loginadm == null}">
            <MARQUEE behavior="scroll" direction="right" style="margin-top:15px; font-weight: 600"><img src="/images/carrot.png" style="width:30px; height:30px"/> [DIGI Campus 당케] 관리자 전용 화면입니다.<img src="/images/carrot.png" style="width:30px; height:30px"/></MARQUEE>

          </c:if>
        </div>
      </div>
    </div>

<%--  <c:if test="${loginadm != null}">--%>
    <div id="onlylogin">
    <div class="row">
<%------------------------------------날씨창 수정-----------------------------------------%>
      <div class="col-md-6 grid-margin stretch-card">
        <div class="card tale-bg">
          <div class="weather-info" style="z-index: 10">
            <div class="d-flex">
              <div class="mr-2">
                <h2 class="mb-0 font-weight-normal"><i id = "temperimg" class="icon-sun mr-2"></i><span id = "temperature"></span><sup>°C</sup></h2>
              </div>
              <div class="mr-2">
                <h2 class="mb-0 font-weight-normal"><i class="icon-drop mr-2"></i><span id = "humidity"></span><sup>%</sup></h2>
              </div>
              <div class="ml-2">
                <h4 class="location font-weight-normal">Seongsu</h4>
                <h6 class="font-weight-normal">Seoul</h6>
              </div>
            </div>
        </div>
          <div class="card-people mt-auto">
            <img id = "rain" src="/images/dashboard/people.svg" alt="people">
          </div>
        </div>
      </div>
      <div class="col-md-6 grid-margin transparent">
        <div class="row">
          <div class="col-md-6 mb-4 stretch-card transparent">
            <div class="card card-tale">
              <div class="card-body d-flex flex-column justify-content-between">
                <p class="mb-4">승인 대기 수강생 수</p>
                <a href="/stdn/approve" class="fs-30 mb-2 text-decoration-none text-white">${approveCnt}명 >></a>
                <div class="d-inline-flex justify-content-between align-bottom">
                  <p class="mb-0">${approvepercent}%</p>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-6 mb-4 stretch-card transparent">
            <div class="card card-dark-blue">
              <div class="card-body d-flex flex-column justify-content-between">
                <p class="mb-4">출결 현황</p>
                <a href="/stdn/absent" class="fs-30 mb-2 text-decoration-none text-white">미출석 ${total-attdCnt}명 >></a>
                <p class="mb-0">출석률 ${attdpercent}%</p>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-6 mb-4 mb-lg-0 stretch-card transparent">
            <div class="card card-light-blue">
              <div class="card-body d-flex flex-column justify-content-between">
                <p class="mb-4">스터디 진행 수강생 수</p>
                <a href="#" class="fs-30 mb-2 text-decoration-none text-white">5명 >></a>
                <p class="mb-0">20.00%</p>
              </div>
            </div>
          </div>
          <div class="col-md-6 stretch-card transparent">
            <div class="card card-light-danger">
              <div class="card-body d-flex flex-column justify-content-between">
                <p class="mb-4">오늘의 일정</p>
                <a href="/anc/cal" class="fs-30 mb-2 text-decoration-none text-white">1건 >></a>
                <p class="mb-0">다가오는 일정 5건</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-md-6 grid-margin stretch-card">
        <div class="card">
          <div class="card-body">
            <p class="card-title">성수동 맛집</p>
<%-------------------------------맵 뿌리는 위치-----------------------------------------------------------------------------%>
            <div id="map"></div>
            <p id="result"></p>
          </div>
        </div>
      </div>
      <div class="col-md-6 grid-margin stretch-card">
        <div class="card">
          <div class="card-body">

            <h4 class="card-title">관심 과목 차트</h4>
            <div class="chart-container">
              <canvas id="pieChart1" style="height:40vh; width:40vw; margin-top:30px;"></canvas>
            </div>

          </div>
        </div>
      </div>
    </div>


<%--      이달의 우수 학생--%>

    <div class="row">
      <div class="col-md-12 grid-margin stretch-card">
        <div class="card position-relative">
          <div class="card-body">
            <div id="detailedReports" class="carousel slide detailed-report-carousel position-static pt-2" data-ride="carousel">
              <div class="carousel-inner">
                <div class="carousel-item active">

                  <div class="row">
                    <div class="col-md-12 col-xl-3 d-flex flex-column justify-content-start">
                      <div class="ml-xl-4 mt-3">
                        <p class="card-title">DIGICAM 우수 학생</p>
                        <h1 class="text-primary">${topstdn.name}</h1>
                        <h3 class="font-weight-500 mb-xl-4 text-primary">${tostdn.id}</h3>
                        <p class="mb-2 mb-xl-0">
                          <img src="/uimg/${topstdn.img}" style = "width: 150px; height: 150px">
                        </p>
                      </div>
                    </div>
                    <div class="col-md-12 col-xl-9">
                      <div class="row">
                        <div class="col-md-6 border-right">
                          <div class="table-responsive mb-3 mb-md-0 mt-3">
                            <table class="table table-borderless report-table">
                              <tr>
                                <td class="text-muted">스터디 횟수</td>
                                <td class="w-100 px-0">
                                  <div class="progress progress-md mx-4">
                                    <div class="progress-bar bg-primary" role="progressbar" style="width: 70%" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"></div>
                                  </div>
                                </td>
                                <td><h5 class="font-weight-bold mb-0">${topstdn.topStdy}</h5></td>
                              </tr>
                              <tr>
                                <td class="text-muted">테스트 점수</td>
                                <td class="w-100 px-0">
                                  <div class="progress progress-md mx-4">
                                    <div class="progress-bar bg-warning" role="progressbar" style="width: 30%" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"></div>
                                  </div>
                                </td>
                                <td><h5 class="font-weight-bold mb-0">${topstdn.topScore}</h5></td>
                              </tr>
                              <tr>
                                <td class="text-muted">수강 강의 수</td>
                                <td class="w-100 px-0">
                                  <div class="progress progress-md mx-4">
                                    <div class="progress-bar bg-danger" role="progressbar" style="width: 95%" aria-valuenow="95" aria-valuemin="0" aria-valuemax="100"></div>
                                  </div>
                                </td>
                                <td><h5 class="font-weight-bold mb-0">${topstdn.topLec}</h5></td>
                              </tr>
                              <tr>
                                <td class="text-muted">출석률</td>
                                <td class="w-100 px-0">
                                  <div class="progress progress-md mx-4">
                                    <div class="progress-bar bg-info" role="progressbar" style="width: 60%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
                                  </div>
                                </td>
                                <td><h5 class="font-weight-bold mb-0">${topstdn.topAttd}</h5></td>
                              </tr>
                              <tr>
                                <td class="text-muted">커리큘럼</td>
                                <td class="w-100 px-0">
                                  <div class="progress progress-md mx-4">
                                    <div class="progress-bar bg-primary" role="progressbar" style="width: 40%" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
                                  </div>
                                </td>
<%--                                <td><h5 class="font-weight-bold mb-0">${topstdn.curri}</h5></td>--%>
                              </tr>
<%--                              <tr>--%>
<%--                                <td class="text-muted">Alaska</td>--%>
<%--                                <td class="w-100 px-0">--%>
<%--                                  <div class="progress progress-md mx-4">--%>
<%--                                    <div class="progress-bar bg-danger" role="progressbar" style="width: 75%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>--%>
<%--                                  </div>--%>
<%--                                </td>--%>
<%--                                <td><h5 class="font-weight-bold mb-0">793</h5></td>--%>
<%--                              </tr>--%>
                            </table>
                          </div>
                        </div>
                        <div class="col-md-6 mt-3">
                          <h2 class="card-title">지난 달 우수 학생</h2>
                          <h4 class="card-title">박선미</h4>
                          <img src="/images/psm.jpg" style = "width: 150px; height: 150px">
<%--                          <canvas id="north-america-chart"></canvas>--%>
<%--                          <div id="north-america-legend"></div>--%>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="carousel-item">

                  <div class="row">
                    <div class="col-md-12 col-xl-3 d-flex flex-column justify-content-start">
                      <div class="ml-xl-4 mt-3">
                        <p class="card-title">Frontend 우수 학생</p>
                        <h1 class="text-primary">${topfront.name}</h1>
                        <h3 class="font-weight-500 mb-xl-4 text-primary">${topfront.id}</h3>
                        <p class="mb-2 mb-xl-0">
                          <img src="/uimg/${topfront.img}" style = "width: 150px; height: 150px">
                        </p>
                      </div>
                    </div>
                    <div class="col-md-12 col-xl-9">
                      <div class="row">
                        <div class="col-md-6 border-right">
                          <div class="table-responsive mb-3 mb-md-0 mt-3">
                            <table class="table table-borderless report-table">
                              <tr>
                                <td class="text-muted">스터디 횟수</td>
                                <td class="w-100 px-0">
                                  <div class="progress progress-md mx-4">
                                    <div class="progress-bar bg-primary" role="progressbar" style="width: 70%" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"></div>
                                  </div>
                                </td>
                                <td><h5 class="font-weight-bold mb-0">${topfront.topStdy}</h5></td>
                              </tr>
                              <tr>
                                <td class="text-muted">테스트 점수</td>
                                <td class="w-100 px-0">
                                  <div class="progress progress-md mx-4">
                                    <div class="progress-bar bg-warning" role="progressbar" style="width: 30%" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"></div>
                                  </div>
                                </td>
                                <td><h5 class="font-weight-bold mb-0">${topfront.topScore}</h5></td>
                              </tr>
                              <tr>
                                <td class="text-muted">수강 강의 수</td>
                                <td class="w-100 px-0">
                                  <div class="progress progress-md mx-4">
                                    <div class="progress-bar bg-danger" role="progressbar" style="width: 95%" aria-valuenow="95" aria-valuemin="0" aria-valuemax="100"></div>
                                  </div>
                                </td>
                                <td><h5 class="font-weight-bold mb-0">${topfront.topLec}</h5></td>
                              </tr>
                              <tr>
                                <td class="text-muted">출석률</td>
                                <td class="w-100 px-0">
                                  <div class="progress progress-md mx-4">
                                    <div class="progress-bar bg-info" role="progressbar" style="width: 60%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
                                  </div>
                                </td>
                                <td><h5 class="font-weight-bold mb-0">${topfront.topAttd}</h5></td>
                              </tr>
                              <tr>
                                <td class="text-muted">커리큘럼</td>
                                <td class="w-100 px-0">
                                  <div class="progress progress-md mx-4">
                                    <div class="progress-bar bg-primary" role="progressbar" style="width: 40%" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
                                  </div>
                                </td>
                                <%--                                <td><h5 class="font-weight-bold mb-0">${topfront.curri}</h5></td>--%>
                              </tr>
                              <%--                              <tr>--%>
                              <%--                                <td class="text-muted">Alaska</td>--%>
                              <%--                                <td class="w-100 px-0">--%>
                              <%--                                  <div class="progress progress-md mx-4">--%>
                              <%--                                    <div class="progress-bar bg-danger" role="progressbar" style="width: 75%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>--%>
                              <%--                                  </div>--%>
                              <%--                                </td>--%>
                              <%--                                <td><h5 class="font-weight-bold mb-0">793</h5></td>--%>
                              <%--                              </tr>--%>
                            </table>
                          </div>
                        </div>
                        <div class="col-md-6 mt-3">
                          <h2 class="card-title">지난 달 우수 학생</h2>
                          <h4 class="card-title">박선미</h4>
                          <img src="/images/psm.jpg" style = "width: 150px; height: 150px">
<%--                          <canvas id="south-america-chart"></canvas>--%>
<%--                          <div id="south-america-legend"></div>--%>
                        </div>
                      </div>
                    </div>
                  </div>

                </div>

                <div class="carousel-item">

                  <div class="row">
                    <div class="col-md-12 col-xl-3 d-flex flex-column justify-content-start">
                      <div class="ml-xl-4 mt-3">
                        <p class="card-title">Backend 우수 학생</p>
                        <h1 class="text-primary">${topback.name}</h1>
                        <h3 class="font-weight-500 mb-xl-4 text-primary">${topback.id}</h3>
                        <p class="mb-2 mb-xl-0">
                          <img src="/uimg/${topback.img}" style = "width: 150px; height: 150px">
                        </p>
                      </div>
                    </div>
                    <div class="col-md-12 col-xl-9">
                      <div class="row">
                        <div class="col-md-6 border-right">
                          <div class="table-responsive mb-3 mb-md-0 mt-3">
                            <table class="table table-borderless report-table">
                              <tr>
                                <td class="text-muted">스터디 횟수</td>
                                <td class="w-100 px-0">
                                  <div class="progress progress-md mx-4">
                                    <div class="progress-bar bg-primary" role="progressbar" style="width: 70%" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"></div>
                                  </div>
                                </td>
                                <td><h5 class="font-weight-bold mb-0">${topback.topStdy}</h5></td>
                              </tr>
                              <tr>
                                <td class="text-muted">테스트 점수</td>
                                <td class="w-100 px-0">
                                  <div class="progress progress-md mx-4">
                                    <div class="progress-bar bg-warning" role="progressbar" style="width: 30%" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"></div>
                                  </div>
                                </td>
                                <td><h5 class="font-weight-bold mb-0">${topback.topScore}</h5></td>
                              </tr>
                              <tr>
                                <td class="text-muted">수강 강의 수</td>
                                <td class="w-100 px-0">
                                  <div class="progress progress-md mx-4">
                                    <div class="progress-bar bg-danger" role="progressbar" style="width: 95%" aria-valuenow="95" aria-valuemin="0" aria-valuemax="100"></div>
                                  </div>
                                </td>
                                <td><h5 class="font-weight-bold mb-0">${topback.topLec}</h5></td>
                              </tr>
                              <tr>
                                <td class="text-muted">출석률</td>
                                <td class="w-100 px-0">
                                  <div class="progress progress-md mx-4">
                                    <div class="progress-bar bg-info" role="progressbar" style="width: 60%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
                                  </div>
                                </td>
                                <td><h5 class="font-weight-bold mb-0">${topback.topAttd}</h5></td>
                              </tr>
                              <tr>
                                <td class="text-muted">커리큘럼</td>
                                <td class="w-100 px-0">
                                  <div class="progress progress-md mx-4">
                                    <div class="progress-bar bg-primary" role="progressbar" style="width: 40%" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
                                  </div>
                                </td>
                                <%--                                <td><h5 class="font-weight-bold mb-0">${topback.curri}</h5></td>--%>
                              </tr>
                              <%--                              <tr>--%>
                              <%--                                <td class="text-muted">Alaska</td>--%>
                              <%--                                <td class="w-100 px-0">--%>
                              <%--                                  <div class="progress progress-md mx-4">--%>
                              <%--                                    <div class="progress-bar bg-danger" role="progressbar" style="width: 75%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>--%>
                              <%--                                  </div>--%>
                              <%--                                </td>--%>
                              <%--                                <td><h5 class="font-weight-bold mb-0">793</h5></td>--%>
                              <%--                              </tr>--%>
                            </table>
                          </div>
                        </div>
                        <div class="col-md-6 mt-3">
                          <h2 class="card-title">지난 달 우수 학생</h2>
                          <h4 class="card-title">박선미</h4>
                          <img src="/images/psm.jpg" style = "width: 150px; height: 150px">
<%--                          <canvas id="east-america-chart"></canvas>--%>
<%--                          <div id="east-america-legend"></div>--%>
                        </div>
                      </div>
                    </div>
                  </div>

                </div>



              </div>
              <a class="carousel-control-prev" href="#detailedReports" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
              </a>
              <a class="carousel-control-next" href="#detailedReports" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>

<%--      인기강의 뿌립니다---------------------------------------------------------------------------------%>
    <div class="row">
      <div class="col-md-12 grid-margin stretch-card">
        <div class="card">
          <div class="card-body">
            <div class="d-flex align-items-center ml-1 mb-2">
              <span class="card-title mb-0 ml-1 mr-3">인기강의 순위</span>
              <button type="button" id="table_curri" class="btn btn-primary btn-sm mr-1">찜하기</button>
              <button type="button" id="table_hit" class="btn btn-outline-primary btn-sm mr-1">수강생</button>
              <button type="button" id="table_rating" class="btn btn-outline-primary btn-sm mr-1">별점</button>
            </div>
            <div class="table-responsive">
              <table class="table table-striped table-borderless">
                <thead>
                <tr>
                  <th>강의명</th>
                  <th>분류</th>
                  <th>강사</th>
                  <th>별점</th>
                  <th>수강생</th>
                  <th>찜</th>
                </tr>
                </thead>
                <tbody id="hottable">

                <c:forEach var="h" items="${hotlec}">
                  <tr>
                    <td>${h.title}</td>
                    <td>${h.topic}</td>
                    <td>${h.teacher}</td>
                    <td>${h.rating}</td>
                    <td>${h.hit}</td>
                    <td>${h.curriSum}</td>
                  </tr>
                </c:forEach>

                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>

    </div>

    <div class="row">
      <div class="col-md-12 grid-margin stretch-card">
        <div class="card">
          <div class="card-body">
            <p class="card-title">최근 결제된 강의</p>
            <div class="row">
              <div class="col-12">
                <div class="table-responsive">
                  <table class="display expandable-table" style="width:100%">
                    <thead>
                    <tr>
                      <th>주문번호</th>
                      <th>강의명</th>
                      <th>분류</th>
                      <th>강사명</th>
                      <th>구매자</th>
                      <th>수강생 수</th>
                      <th>커리큘럼 수</th>
                      <th>구입일시</th>
                      <th></th>
                    </tr>
                    </thead>
                    <tbody id="recent_buy_lec">
<%--                      <c:forEach var="obj" items="${recentlec}">--%>
<%--                        <tr>--%>
<%--                          <td>${obj.odId}</td>--%>
<%--                          <td>${obj.title}</td>--%>
<%--                          <td>${obj.topic}</td>--%>
<%--                          <td>${obj.teacher}</td>--%>
<%--                          <td>${obj.name}</td>--%>
<%--                          <td>${obj.hit}</td>--%>
<%--                          <td>${obj.curriSum}</td>--%>
<%--                          <td>${obj.odate}</td>--%>
<%--                        </tr>--%>
<%--                      </c:forEach>--%>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>


      </div>
    </div>
<%--  </c:if>--%>


      <div class="row">
        <div class="col-12 stretch-card grid-margin">
          <div class="card" style="width: 100%; height: 85vh">
            <div class="card-body">
              <iframe src="https://calendar.google.com/calendar/embed?src=digicamjava%40gmail.com&ctz=Asia%2FSeoul" style="border: 0" width="100%" height="100%" frameborder="0" scrolling="no"></iframe>

            </div>
          </div>
        </div>
      </div>

    </div>
  </div>
  <!-- content-wrapper ends -->
