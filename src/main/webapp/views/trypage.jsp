<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
  <%--let oneonone = {--%>
  <%--  id: null,--%>
  <%--  stompClient: null,--%>

  <%--  init: function () {--%>
  <%--    this.id = $('#adm_id_oneonone').val();--%>
  <%--    $("#connect_oneonone").click(() => {--%>
  <%--      this.connect();--%>
  <%--      $("#connect_oneonone").removeClass("text-info");--%>
  <%--      $("#connect_oneonone").addClass("text-light bg-info");--%>
  <%--      $("#disconnect_oneonone").removeClass("text-light bg-info");--%>
  <%--      $("#disconnect_oneonone").addClass("text-info");--%>
  <%--    });--%>
  <%--    $("#disconnect_oneonone").click(() => {--%>
  <%--      this.disconnect();--%>
  <%--      $("#connect_oneonone").removeClass("text-light bg-info");--%>
  <%--      $("#connect_oneonone").addClass("text-info");--%>
  <%--      $("#disconnect_oneonone").removeClass("text-info");--%>
  <%--      $("#disconnect_oneonone").addClass("text-light bg-info");--%>
  <%--    });--%>
  <%--    $("#delete_oneonone").click(() => {--%>
  <%--      this.clearMessages();--%>
  <%--    });--%>
  <%--    $("#sendto").click(() => {--%>
  <%--      this.sendTo();--%>
  <%--    });--%>

  <%--    // 알림 bell notification 설정해주기. 기본값 false, true시 블링크(true는 subscribe시 변동)--%>
  <%--    const isNotificationSeen = localStorage.getItem('isNotificationSeen') || 'false';--%>
  <%--    if (isNotificationSeen === 'true') {--%>
  <%--      $('#notification_bell').addClass('count blinking');--%>
  <%--    }--%>

  <%--    // Redis에서 저장된 알림 메시지 불러오기--%>
  <%--    this.getNotificationMessageFromRedis((notificationMessage) => {--%>
  <%--      if (notificationMessage) {--%>
  <%--        const previewThumbnail = document.createElement('div');--%>
  <%--        previewThumbnail.classList.add('preview-thumbnail', 'mdi', 'mdi-email');--%>
  <%--        previewThumbnail.innerText = notificationMessage;--%>
  <%--        $('#notification_contents').append(previewThumbnail);--%>
  <%--      }--%>
  <%--    });--%>

  <%--    // Redis에서 저장된 메시지 불러오기--%>
  <%--    this.getMessagesFromRedis((messages) => {--%>
  <%--      for (const message of messages) {--%>
  <%--        if (message.sendid === this.id) {--%>
  <%--          $('#to').append(--%>
  <%--                  '<p class="w-75 p-2 ml-lg-5 mr-2 rounded-sm bg-inverse-info text-dark float-right"><b>'--%>
  <%--                  + message.sendid + ' : ' + '</b>' + message.content1 + '</p>'--%>
  <%--          );--%>
  <%--        } else if (message.receiveid === this.id) {--%>
  <%--          $('#to').append(--%>
  <%--                  '<p class="w-75 p-2 rounded-sm text-dark float-left" style="background-color:#e9ecef; margin-left:0.75rem">' +--%>
  <%--                  '<b>' + message.sendid + ' : ' + '</b>' + message.content1 + '</p>'--%>
  <%--          );--%>
  <%--        }--%>
  <%--      }--%>

  <%--      $('#to').animate({ scrollTop: $('#to')[0].scrollHeight }, 1000);--%>
  <%--    });--%>

  <%--    $('#notification_bell').click(() => {--%>
  <%--      // 알림 확인 시 깜빡임 제거--%>
  <%--      if ($('#notification_bell').hasClass('count blinking')) {--%>
  <%--        $('#notification_bell').removeClass('count blinking');--%>
  <%--        this.setNotificationSeen(false);--%>
  <%--      }--%>
  <%--    });--%>
  <%--  },--%>

  <%--  connect: function () {--%>
  <%--    var sid = this.id;--%>
  <%--    var socket = new SockJS('${adminserver}/ws');--%>
  <%--    this.stompClient = Stomp.over(socket);--%>

  <%--    this.stompClient.connect({}, (frame) => {--%>
  <%--      oneonone.setConnected(true);--%>
  <%--      console.log('Connected: ' + frame);--%>

  <%--      this.stompClient.subscribe('/send/to/' + sid, (msg) => {--%>
  <%--        const message = JSON.parse(msg.body);--%>

  <%--        $("#to").append(--%>
  <%--                '<p class="w-75 p-2 rounded-sm text-dark float-left" style="background-color:#e9ecef; margin-left:0.75rem">' +--%>
  <%--                '<b>' + message.sendid + ' : ' + '</b>' + message.content1 + '</p>'--%>
  <%--        );--%>
  <%--        $('#to').animate({ scrollTop: $('#to')[0].scrollHeight }, 1000);--%>

  <%--        // Redis에 메시지 저장--%>
  <%--        this.saveMessageToRedis(message);--%>

  <%--        // 알림 처리--%>
  <%--        this.processNotification(message.sendid, message.content1);--%>
  <%--      });--%>
  <%--    });--%>
  <%--  },--%>

  <%--  disconnect: function () {--%>
  <%--    if (this.stompClient !== null) {--%>
  <%--      this.stompClient.disconnect();--%>
  <%--    }--%>
  <%--    oneonone.setConnected(false);--%>
  <%--    console.log("Disconnected");--%>
  <%--  },--%>

  <%--  setConnected: function (connected) {--%>
  <%--    if (connected) {--%>
  <%--      $("#status_oneonone").text("Connected");--%>
  <%--    } else {--%>
  <%--      $("#status_oneonone").text("Disconnected");--%>
  <%--    }--%>
  <%--  },--%>

  <%--  sendTo: function () {--%>
  <%--    var msg = JSON.stringify({--%>
  <%--      'sendid': this.id,--%>
  <%--      'receiveid': $('#target').val(),--%>
  <%--      'content1': $('#totext').val()--%>
  <%--    });--%>

  <%--    this.stompClient.send('/receiveto', {}, msg);--%>
  <%--    this.stompClient.send("/receiveme", {}, msg);--%>

  <%--    $('#to').append(--%>
  <%--            '<p class="w-75 p-2 ml-lg-5 mr-2 rounded-sm bg-inverse-info text-dark float-right"><b>'--%>
  <%--            + this.id + ' : ' + '</b>' + $('#totext').val() + '</p>'--%>
  <%--    );--%>
  <%--    $('#to').animate({ scrollTop: $('#to')[0].scrollHeight }, 1000);--%>
  <%--    $('#totext').val('');--%>

  <%--    // Redis에 메시지 저장--%>
  <%--    this.saveMessageToRedis(JSON.parse(msg));--%>
  <%--  },--%>

  <%--  clearMessages: function () {--%>
  <%--    // Redis에서 메시지 삭제--%>
  <%--    this.clearMessagesFromRedis(() => {--%>
  <%--      $('#to').empty();--%>
  <%--      $(window).scrollTop(0);--%>
  <%--    });--%>
  <%--  },--%>

  <%--  saveMessageToRedis: function (message) {--%>
  <%--    // Redis에 메시지 저장--%>
  <%--    $.ajax({--%>
  <%--      type: "POST",--%>
  <%--      url: "/saveMessage",--%>
  <%--      data: JSON.stringify(message),--%>
  <%--      contentType: "application/json",--%>
  <%--      success: function (response) {--%>
  <%--        console.log("Message saved to Redis: ", response);--%>
  <%--      },--%>
  <%--      error: function (error) {--%>
  <%--        console.error("Failed to save message to Redis: ", error);--%>
  <%--      }--%>
  <%--    });--%>
  <%--  },--%>

  <%--  getMessagesFromRedis: function (callback) {--%>
  <%--    // Redis에서 메시지 불러오기--%>
  <%--    $.ajax({--%>
  <%--      type: "GET",--%>
  <%--      url: "/getMessages",--%>
  <%--      success: function (response) {--%>
  <%--        console.log("Messages retrieved from Redis: ", response);--%>
  <%--        callback(response);--%>
  <%--      },--%>
  <%--      error: function (error) {--%>
  <%--        console.error("Failed to retrieve messages from Redis: ", error);--%>
  <%--        callback([]);--%>
  <%--      }--%>
  <%--    });--%>
  <%--  },--%>

  <%--  clearMessagesFromRedis: function (callback) {--%>
  <%--    // Redis에서 메시지 삭제--%>
  <%--    $.ajax({--%>
  <%--      type: "DELETE",--%>
  <%--      url: "/clearMessages",--%>
  <%--      success: function (response) {--%>
  <%--        console.log("Messages cleared from Redis: ", response);--%>
  <%--        callback();--%>
  <%--      },--%>
  <%--      error: function (error) {--%>
  <%--        console.error("Failed to clear messages from Redis: ", error);--%>
  <%--        callback();--%>
  <%--      }--%>
  <%--    });--%>
  <%--  },--%>

  <%--  processNotification: function (sender, content) {--%>
  <%--    // 알림 처리--%>
  <%--    // 알람 울리기위한 CSS 수정--%>
  <%--    var notificationBell = document.getElementById("notification_bell");--%>
  <%--    notificationBell.classList.add("count");--%>
  <%--    notificationBell.classList.add("blinking");--%>

  <%--    // 알림 보내기 위한 HTML 추가--%>
  <%--    var notificationContents = document.getElementById("notification_contents");--%>
  <%--    var previewThumbnail = document.createElement("div");--%>
  <%--    previewThumbnail.classList.add("preview-thumbnail", "mdi", "mdi-email");--%>
  <%--    previewThumbnail.innerText = `${sender}님의 메시지가 도착했습니다.`;--%>
  <%--    notificationContents.appendChild(previewThumbnail);--%>

  <%--    // 알림 메시지 Redis에 저장--%>
  <%--    this.saveNotificationMessageToRedis(previewThumbnail.innerText);--%>
  <%--  },--%>

  <%--  saveNotificationMessageToRedis: function (message) {--%>
  <%--    // 알림 메시지 Redis에 저장--%>
  <%--    $.ajax({--%>
  <%--      type: "POST",--%>
  <%--      url: "/saveNotificationMessage",--%>
  <%--      data: JSON.stringify({ message: message }),--%>
  <%--      contentType: "application/json",--%>
  <%--      success: function (response) {--%>
  <%--        console.log("Notification message saved to Redis: ", response);--%>
  <%--      },--%>
  <%--      error: function (error) {--%>
  <%--        console.error("Failed to save notification message to Redis: ", error);--%>
  <%--      }--%>
  <%--    });--%>
  <%--  },--%>

  <%--  getNotificationMessageFromRedis: function (callback) {--%>
  <%--    // 알림 메시지 Redis에서 불러오기--%>
  <%--    $.ajax({--%>
  <%--      type: "GET",--%>
  <%--      url: "/getNotificationMessage",--%>
  <%--      success: function (response) {--%>
  <%--        console.log("Notification message retrieved from Redis: ", response);--%>
  <%--        callback(response.message);--%>
  <%--      },--%>
  <%--      error: function (error) {--%>
  <%--        console.error("Failed to retrieve notification message from Redis: ", error);--%>
  <%--        callback('');--%>
  <%--      }--%>
  <%--    });--%>
  <%--  },--%>

  <%--  setNotificationSeen: function (isSeen) {--%>
  <%--    // 알림 확인 상태 설정--%>
  <%--    localStorage.setItem('isNotificationSeen', isSeen.toString());--%>
  <%--  }--%>
  <%--};--%>

  <%--$(function () {--%>
  <%--  oneonone.init();--%>
  <%--});--%>

</script>


<div class="content-wrapper">
  <div class="row">





    <div class="col-md-12 grid-margin" style = "display: flex; flex-direction: row;">

    </div>

    <div class="col-md-12 grid-margin" style = "display: flex; flex-direction: row;">

      <%-----------네이버 메일 폼 양식-----------------------------------------%>
      <div class="row">
        <div class="col-12 mb-4 mb-xl-0" style="display: flex; justify-content: space-between">
          <div class="card">
            <div class="card-body">
              <form id = "naver_mail_form" class="forms-sample">
                <div class="form-group">
                  <label for="naveremail">email</label>
                  <input type="email" class="form-control" name = "naveremail" id="naveremail" placeholder="input email">
                </div>
                <div class="form-group">
                  <label for="navertitle">Title</label>
                  <input type="text" class="form-control" name = "navertitle" id="navertitle" placeholder="input title">
                </div>
                <div class="form-group">
                  <label for="navercontents">Contents</label>
                  <textarea class="form-control" id="navercontents" name="navercontents" rows="6"></textarea>
                </div>
                <button id = "navermail_send_btn" type="button" class="btn btn-primary mr-2">Send</button>
                <button id = "navermail_can_btn" type="button" class="btn btn-outline-primary">Cancel</button>
              </form>
            </div>
          </div>
        </div>
      </div>


<%--        카카오페이--------------------------------%>
        <div class = "row">
          <div class="col-12 mb-4 mb-xl-0" style="display: flex; justify-content: space-between">
            <div class="card">
              <div class="card-body">
                <h4> kakaoPay api 이용하기 </h4>

                <form method="post" action="/kakaoPay">
                  <button style = "border : none; background : none"><img type = "submit" src = "uimg/kakaopay.png"></button>
                </form>
              </div>
            </div>
          </div>
        </div>

<%--alphavantage---------------------------------------------%>
        <div class = "row">
          <div class="col-12 mb-4 mb-xl-0" style="display: flex; justify-content: space-between">
            <div class="card">
              <div class="card-body">
                <table class="table table-borderless report-table">
                  <thead>
                    <th>time</th>
                    <th>open</th>
                    <th>high</th>
                    <th>low</th>
                    <th>close</th>
                    <th>volume</th>
                  </thead>
<%--                  <tbody>--%>
<%--                    <c:forEach var="obj" items="alpha">--%>
<%--                      <tr>--%>
<%--                        <td>${alpha.column0}</td>--%>
<%--                        <td>${alpha.column1}</td>--%>
<%--                        <td>${alpha.column2}</td>--%>
<%--                        <td>${alpha.column3}</td>--%>
<%--                        <td>${alpha.column4}</td>--%>
<%--                        <td>${alpha.column5}</td>--%>
<%--                      </tr>--%>
<%--                    </c:forEach>--%>
<%--                  </tbody>--%>
                </table>
              </div>
            </div>
          </div>
        </div>


        <div class = "row">
          <div class="col-12 mb-4 mb-xl-0" style="display: flex; justify-content: space-between">
            <div class="card">
              <div class="card-body">
                <div class="wrap">
                  <div class="title">로그인</div>
                  <a class="kakao" href="https://kauth.kakao.com/oauth/authorize?client_id=efd00f1a0b5734f9fdffac85acc7657d&redirect_uri=http://localhost:8089/kakaoLogin&response_type=code">
                    <!-- REST_API키 및 REDIRECT_URI는 본인걸로 수정하세요 -->

                    <div class="kakao_i"></div>
                    <div class="kakao_txt">카카오톡으로 간편로그인 </div>
                  </a>
                </div>
              </div>
            </div>
          </div>
        </div>


<%--      테두리 태그--%>
    </div>
  </div>
</div>
