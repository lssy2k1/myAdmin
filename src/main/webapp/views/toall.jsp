<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
    .settings-heading {
        height: 5.6vh;
    }

    #toall_box {
        width: 100%;
        height: calc(88.2vh - 60px);
    }

    .card-footer {
        height: 8.4vh;
    }

    #all {
        width: 100%;
        height: calc(76.2vh - 60px);
        overflow-y: auto;
        overflow-x: hidden;
        scrollbar-width: none;
        -ms-overflow-style: none;
    }

    #all::-webkit-scrollbar {
        display: none;
        width: 14px;
        height: 14px;
    }

    #all::-webkit-scrollbar-thumb {
        outline: none;
        border-radius: 10px;
        border: 4px solid transparent;
        box-shadow: inset 6px 6px 0 rgba(34, 34, 34, 0.15);
    }

    #all::-webkit-scrollbar-thumb:hover {
        border: 4px solid transparent;
        box-shadow: inset 6px 6px 0 rgba(34, 34, 34, 0.3);
    }

    #all::-webkit-scrollbar-track {
        box-shadow: none;
        background-color: transparent;
    }
</style>

<script>
    let toall = {
        id: null,
        stompClient: null,
        init: function () {
            this.id = $('#adm_id_toall').val();//adm_id에서 적힌 글씨를 id로 뿌려줄 예정이다.
            $("#connect_toall").click(function () {
                toall.connect();
                $("#connect_toall").removeClass("text-info");
                $("#connect_toall").addClass("text-light bg-info");
                $("#disconnect_toall").removeClass("text-light bg-info");
                $("#disconnect_toall").addClass("text-info");
            });
            $("#disconnect_toall").click(function () {
                toall.disconnect();
                $("#connect_toall").removeClass("text-light bg-info");
                $("#connect_toall").addClass("text-info");
                $("#disconnect_toall").removeClass("text-info");
                $("#disconnect_toall").addClass("text-light bg-info");
            });
            $("#sendall").click(function () {
                toall.sendAll();
            });
        },
        connect: function () {
            var sid = this.id;
            var socket = new SockJS('${adminserver}/ws');
            // SockJS는 웹소켓을 지원하지 않는 브라우저에서도 웹소켓과 유사한 방식으로 통신할 수 있게 해주는 js라이브러리
            this.stompClient = Stomp.over(socket);
            // Stomp는 웹소켓 프로토콜을 사용하는 메시징 서비스를 제공.(Simple Text Oriented Messaging Protocol)

            this.stompClient.connect({}, function (frame) {
                //첫 번째 매개변수는 연결 설정 객체, STOMP 메시지 브로커와의 인증을 위한 정보를 제공합니다.
                //두 번째 매개변수는 연결이 성공했을 때 실행될 콜백 함수입니다. 서버에서 전송한 메시지를 수신하기 위해 콜백 함수를 등록합니다.
                toall.setConnected(true);//단순히 connected, disconnected 적히게 하는 함수.
                console.log('Connected: ' + frame);
                this.subscribe('/send', function (msg) {
                    //두번째 매개변수 function(msg)는
                    //메시지가 도착했을 때 호출할 콜백 함수입니다. 이 함수는 서버에서 보낸 메시지를 전달받습니다
                    if ((JSON.parse(msg.body).sendid) != ($('#adm_id_toall').val())) {
                        $("#all").append(
                            '<p class="w-75 p-2 rounded-sm text-dark float-left" style="background-color:#e9ecef; margin-left:0.75rem"><b>' + JSON.parse(msg.body).sendid + ' : ' + '</b>' + JSON.parse(msg.body).content1 + '</p>');
                        $('#all').animate({scrollTop: $('#all')[0].scrollHeight}, 1000);
                    }
                });

            });
        },
        disconnect: function () {
            if (this.stompClient !== null) {
                this.stompClient.disconnect();
            }
            toall.setConnected(false);
            console.log("Disconnected");
        },
        setConnected: function (connected) {
            if (connected) {
                $("#status_toall").text("connected");
            } else {
                $("#status_toall").text("disconnected");
            }
        },
        sendAll: function () {
            var msg = JSON.stringify({
                'sendid': this.id,
                'content1': $("#alltext").val()
            });
            this.stompClient.send("/receiveall", {}, msg);
            $('#all').append(
                '<p class="w-75 p-2 ml-lg-5 mr-2 rounded-sm bg-inverse-info text-dark float-right"><b>' + this.id + ' : ' + '</b>' + $('#alltext').val() + '</p>'
            );
            $('#all').animate({scrollTop: $('#all')[0].scrollHeight}, 1000);
            $('#alltext').val('');
        }
    };
    $(function () {
        toall.init();
    })

</script>


<div class="tab-pane fade show active" id="todo-section" role="tabpanel"
     aria-labelledby="todo-section">
    <p class="settings-heading pl-3">전체 채팅방
        <input type="hidden" id="adm_id_toall" value="${loginadm.id}"/>
        <a id="connect_toall" class="ml-2 px-1 text-info">연결</a>
        <a id="disconnect_toall" class="px-1 text-info">연결해제</a>
    </p>
    <div class="card pt-2" id="toall_box">

        <div id="container_toall"></div>
        <div class="col-sm-12" style="padding: 0">
            <span class="ml-3">연결상태 : </span><span id="status_toall"></span>


            <div id="all" class="pt-3"></div>
            <div class="card-footer text-muted d-flex justify-content-start align-items-center p-2">
                <input type="text" id="alltext" class="form-control form-control-lg px-3"
                       placeholder="메세지를 입력하세요" onkeypress="if( event.keyCode == 13 ){toall.sendAll();}"/>
                <button id="sendall" style="border: none; background: none; height: 3rem; font-size: larger"><i
                        class="mdi mdi-send ml-2"></i></button>


            </div>
        </div>
    </div>
</div>

<!-- To do section tab ends -->