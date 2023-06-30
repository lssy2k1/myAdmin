<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
  .card .card-body {
    padding: 1.25rem 1.5rem 2rem 1.5rem;
  }

  .fc .fc-header-toolbar {
    margin-top: 1rem;
  }

  .fc-scrollgrid .fc-scrollgrid-liquid {
    margin-bottom: 2rem;
  }

  .fc .fc-button {
    padding: 0.4em;
    border-radius: 50%;
  }

  .fc .fc-button-primary {
    background-color: #A9A9A9;
    border: 1px solid #A9A9A9;
    color: #FFFFFF;
  }

  .fc .fc-button-primary:disabled {
    background-color: #ffffff;
    border: 1px solid gray;
    color: #666666;
  }

  .fc button:not(:disabled):not(.disabled) {
    background-color: #A9A9A9;
    color: #ffffff;
    border: 1px solid #A9A9A9;
  }

  /*title 옆에 동그란 점*/
  /*.fc-daygrid-event-dot {*/
  /*  border: calc(var(--fc-daygrid-event-dot-width,8px)/ 2) solid var(--fc-event-border-color,#739be1)*/
  /*}*/

  .fc .fc-daygrid-event {
    padding: 0.2rem;
  }

  .fc-event-time {
    font-size: 0.2rem;
  }

  #calendar {
    max-width: 1400px;
    min-height: 500px;
    margin: 0 auto;
  }

  /*요일*/
  .fc-col-header-cell-cushion {
    color: #000;
    font-size: 0.9rem;
  }
  .fc-col-header-cell-cushion:hover {
    text-decoration: none;
    color:#000;
  }
  /*일자*/
  .fc-daygrid-day-number{
    color: #000;
    font-size:0.9rem;
  }

  /*종일제목 = 여러날인 경우 스케줄 타이틀*/
  .fc-event-title {
    font-size: 0.2rem;
  }
  /*일정시간*/
  /*.fc-daygrid-event > .fc-event-time{*/
  /*  color:#000;*/
  /*}*/
  /*!*시간제목*!*/
  /*!*.fc-daygrid-dot-event > .fc-event-title {*!*/
  /*!*  color:#000 !important;*!*/
  /*!*}*!*/

  /*.fc-h-event {*/
  /*  background-color: var(--fc-event-bg-color, #5a78a8);*/
  /*}*/

  #next_btn > a {
    margin-left: 0 !important;
    margin-top: 0.7rem;
    background-color: #A9A9A9;
    border-color: #A9A9A9;
  }
</style>

<script>

  var calFunc ={

    calcDate: function(arg,calendar){
        var rObj = new Object();
        var start  = null;
        var end    = null;
        var allDay = arg.allDay;
        var startDisp =null;
        var endDisp = null;
        var id = null;
        var xcontent = null;
        var title = null;
      //============================== date get / set ======================================

      if(arg.id!=""&& arg.id!=null && arg.id!=undefined) id=arg.id;
      if(arg.title!=""&& arg.title!=null && arg.title!=undefined) title=arg.title;
      if(arg.extendedProps!=undefined){
        if(arg._def.extendedProps.xcontent!=""&& arg._def.extendedProps.xcontent!=null && arg._def.extendedProps.xcontent!=undefined){
          xcontent=arg._def.extendedProps.xcontent;
        }
      }

      if(allDay){//하루종일이면
        var start  = arg.start.toISOString().slice(0,10); //returnCdate(calendar,arg.start);
        var end=null;
        if(arg.end!=""&& arg.end!=null && arg.end!=undefined){
          end    = arg.end.toISOString().slice(0,10);  //실제 데이터는 날짜를 하루 빼지 않는다
        }
        if(start==end) end=start;  //같은날이면 end날짜 없음 //start로 변경함 20230613 (null이었음 원래)// 원상복귀함

        startDisp = start;
        // if(end!=null) endDisp = arg.end.toISOString().slice(0,10); //알릴때만 날짜 하루 빼기
        if(end!=null) endDisp = calFunc.dateRel(arg.end.toISOString().slice(0,10)); //알릴때만 날짜 하루 빼기
      }
      // else{//시간이 같이 들어오면
      //   start = arg.start.toISOString();
      //   if(arg.end!=""&& arg.end!=null && arg.end!=undefined){
      //     end   = arg.end.toISOString();
      //   }
      //   startDisp = calFunc.returnCdate(calendar,arg.start);
      //   if(end!=null) endDisp = calFunc.returnCdate(calendar,arg.end);
      // }
      rObj.start=start;
      rObj.end=end;

      rObj.startDisp=startDisp;
      rObj.endDisp=endDisp;
      rObj.id=id;
      rObj.xcontent=xcontent;
      rObj.title=title;
      //============================== date get / set ======================================
      return rObj;
    },
    dateRel:function(date){
      var selectDate = date.split("-");
      var changend = new Date();
      changend.setFullYear(selectDate[0], selectDate[1]-1, selectDate[2]-1);

      var y = changend.getFullYear();
      var m = changend.getMonth() + 1;
      var d = changend.getDate();

      if(m < 10) {
        m = "0" + m;
      }

      if(d < 10) {
        d = "0" + d;
      }
      var resultDate = y + "-" + m + "-" + d;
      return resultDate;
    },
    returnCdate:function(cal,time){
      return cal.formatDate(time,{month: 'long',year: 'numeric',day: 'numeric'
        , hour:'numeric',minute:'numeric', timeZone: 'Asia/Seoul',locale: 'ko'});
    }

  };

  $(function(){
    $('#next_btn').hide();

    var calendar = new FullCalendar.Calendar($('#calendar')[0], {
      googleCalendarApiKey : "${googleCalKey}",
      eventSources :[
        { //DIGI CAMPUS
          googleCalendarId : 'digicamjava@gmail.com'
          , color: '#A9D0F5'
          , textColor: 'black'
        },
        {
          googleCalendarId : 'ko.south_korea.official#holiday@group.v.calendar.google.com'
          , color: 'white'   // an option!
          , textColor: 'red' // an option!
        },
        { //PROJECT
          googleCalendarId: '6aed560ddb96902fc3a54594c783535c6b95236888a404c6f2b558d57dab4b26@group.calendar.google.com'
          , color: '#D5EABF'   // an option!
          , textColor: 'black' // an option!
        },
        { //KB
          googleCalendarId: 'de30a7b2d591c35198385c519295056696e91166c6e5a09f854b8e3a1498c0a5@group.calendar.google.com'
          , color: '#FFF6B7'
          , textColor: 'black'
        }
      ],
      locale:'ko',
      timeZone: 'Asia/Seoul',
      height: '79vh', // calendar 높이 설정
      //expandColumns: true,

      expandRows: true, // 화면에 맞게 높이 재설정
      // 해더에 표시할 툴바
      headerToolbar: {
        left: 'prev next',
        center: 'title',
        right: 'today'
      },
      businessHours: true,//토요일을 회색으로 반전시킴

      // initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
      //initialDate: '2022-11-01', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
      //navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
      editable: true, // 수정 가능
      selectable: true, // 달력 일자 드래그 설정가능
      nowIndicator: true, // 현재 시간 마크
      // dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)

      select: function(arg) {
        var xObj = calFunc.calcDate(arg,calendar);
        const date = new Date();

        const year = date.getFullYear();
        const month = ('0' + (date.getMonth() + 1)).slice(-2);
        const day = ('0' + date.getDate()).slice(-2);
        const dateStr = year + '-' + month + '-' + day;

        if(new Date(xObj.startDisp) < new Date(dateStr)){
          alert('Fail');
          return;
        }

        $('#start').text(xObj.startDisp);
        $('#end').text(xObj.endDisp);

        $('#next_btn').fadeIn();

      }
      // ,
      // events: '/getcal2'
      //지금은 1-12월까지 데이터를 가져와서 현재 실행된 달력만 뿌리는건가?
      //무조건 줘. 라고 요청을 하고 있음. cal6이랑 비교해보자

    });


    calendar.render();

    $('#next_btn').click(function(){
      var c  = confirm('등록하시겠습니까');
      if(c == true){
        var title = $('#title').val();
        var contents = $('#contents').val();
        // var start = calFunc.calcDate().start;
        // var end = calFunc.calcDate().end;
        var start = $('#start').text()+"T00:00:00";
        var end = $('#end').text()+"T15:00:00";
        $.ajax({
          url:'/calevent',
          data:{
            title : title, contents : contents, start:start, end:end
          },
          success:()=>{
            alert("일정이 등록되었습니다");
          }
        })
      }

    });


  });
</script>


<div class="content-wrapper">
  <div class="row">

    <div class="col-lg-12 grid-margin-sm-0 stretch-card">
      <div class="card">
        <div class="card-body">

          <div class="col-sm-12 text-left px-0">
            <div class="container px-0">
              <div class="row content">
                <div class="col-sm-2 pr-0 text-left">
                  <div class="container mt-lg-5 px-0">
                    <form>
                      <h6>시작일자: <span id="start"></span></h6>
                      <h6>종료일자: <span id="end"></span></h6>
                      일정 : <input type="text" name="title" id = "title" style="width: 100%">
                      내용 : <input type="text" name="contents" id = "contents" style="width: 100%">
                      <h6 id="next_btn"><a type="button" class="btn btn-sm btn-primary ml-lg-4">예약</a></h6>
                    </form>
                  </div>
                </div>
                <div class="col-sm-10 pl-4 text-left ">
                  <div id='calendar-container'>
                    <div class="well"> <div id="calendar"></div></div>
                  </div>
                </div>
              </div>
            </div>
          </div>

        </div>
      </div>
    </div>
  </div>
</div>