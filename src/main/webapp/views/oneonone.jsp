<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
    .settings-heading {
        height: 5.6vh;
    }

    #oneonone_box {
        width: 100%;
        height: calc(88.2vh - 60px);
    }

    #oneonone_msg {
        height: 12.1vh;
    }

    #to {
        width: 100%;
        height: calc(72.4vh - 60px);
        overflow-y: auto;
        overflow-x: hidden;
        scrollbar-width: none;
        -ms-overflow-style: none;
    }

    #to::-webkit-scrollbar {
        display: none;
        width: 14px;
        height: 14px;
    }

    #to::-webkit-scrollbar-thumb {
        outline: none;
        border-radius: 10px;
        border: 4px solid transparent;
        box-shadow: inset 6px 6px 0 rgba(34, 34, 34, 0.15);
    }

    #to::-webkit-scrollbar-thumb:hover {
        border: 4px solid transparent;
        box-shadow: inset 6px 6px 0 rgba(34, 34, 34, 0.3);
    }

    #to::-webkit-scrollbar-track {
        box-shadow: none;
        background-color: transparent;
    }

    #target {

    }
</style>

<script>
    let oneonone = {
        id: null,
        stompClient: null,
        init: function () {
            this.id = $('#adm_id_oneonone').val();//adm_id에서 적힌 글씨를 id로 뿌려줄 예정이다.
            $("#connect_oneonone").click(function () {
                oneonone.connect();
                $("#connect_oneonone").removeClass("text-info");
                $("#connect_oneonone").addClass("text-light bg-info");
                $("#disconnect_oneonone").removeClass("text-light bg-info");
                $("#disconnect_oneonone").addClass("text-info");
            });
            $("#disconnect_oneonone").click(function () {
                oneonone.disconnect();
                $("#connect_oneonone").removeClass("text-light bg-info");
                $("#connect_oneonone").addClass("text-info");
                $("#disconnect_oneonone").removeClass("text-info");
                $("#disconnect_oneonone").addClass("text-light bg-info");
            });
            $("#sendto").click(function () {
                oneonone.sendTo();
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
                oneonone.setConnected(true);//단순히 connected, disconnected 적히게 하는 함수.
                console.log('Connected: ' + frame);


                this.subscribe('/send/to/' + sid, function (msg) {
                    $("#to").append(
                        '<p class="w-75 p-2 rounded-sm text-dark float-left" style="background-color:#e9ecef; margin-left:0.75rem"><b>' + JSON.parse(msg.body).sendid + ' : ' + '</b>' + JSON.parse(msg.body).content1 + '</p>');
                    $('#to').animate({scrollTop: $('#to')[0].scrollHeight}, 1000);
                });
            });
        },

        disconnect: function () {
            if (this.stompClient !== null) {
                this.stompClient.disconnect();
            }
            oneonone.setConnected(false);
            console.log("Disconnected");
        },
        setConnected: function (connected) {
            if (connected) {
                $("#status_oneonone").text("Connected");
            } else {
                $("#status_oneonone").text("Disconnected");
            }
        },
        sendTo: function () {
            var msg = JSON.stringify({
                'sendid': this.id,
                'receiveid': $('#target').val(),
                'content1': $('#totext').val()
            });
            this.stompClient.send('/receiveto', {}, msg);

            this.stompClient.send("/receiveme", {}, msg);
            $('#to').append(
                '<p class="w-75 p-2 ml-lg-5 mr-2 rounded-sm bg-inverse-info text-dark float-right"><b>' + this.id + ' : ' + '</b>' + $('#totext').val() + '</p>'
            );
            $('#to').animate({scrollTop: $('#to')[0].scrollHeight}, 1000);
            $('#totext').val('');
        }

    };
    $(function () {
        oneonone.init();
    })

</script>


<div class="tab-pane fade show active" id="chats-section" role="tabpanel"
     aria-labelledby="chats-section">
    <p class="settings-heading pl-3">1:1 채팅방
        <input type="hidden" id="adm_id_oneonone" value="${loginadm.id}"/>
        <a id="connect_oneonone" class="ml-2 px-1 text-info">연결</a>
        <a id="disconnect_oneonone" class="px-1 text-info">연결해제</a>
    </p>
    <div class="card pt-2" id="oneonone_box">

        <div id="container_oneonone"></div>
        <div class="col-sm-12" style="padding: 0">
            <span class="ml-3">연결상태 : </span><span id="status_oneonone"></span>


            <div id="to" class="pt-3"></div>
            <div class="card-footer text-muted justify-content-start align-items-center p-2" id="oneonone_msg">
                <div class="d-flex align-items-center mb-2">
                    <label class="mb-0 mr-2" style="font-size: small">수신자</label>
                    <input type="text" id="target" class="px-1" style="font-size: small" placeholder="수신인을 입력하세요">
                </div>
                <div class="d-flex justify-content-start align-items-center">
                    <input type="text" id="totext" class="form-control form-control-lg px-3"
                           placeholder="메세지를 입력하세요" onkeypress="if( event.keyCode == 13 ){oneonone.sendTo();}"/>
                    <button id="sendto" style="border: none; background: none; height: 3rem; font-size: larger"><i
                            class="mdi mdi-send ml-2"></i></button>
                </div>
            </div>
        </div>
    </div>
</div>
