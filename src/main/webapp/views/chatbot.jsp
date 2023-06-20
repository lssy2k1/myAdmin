<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
    #chatbot_box{
        width: 100%;
        height: 43rem;
    }
    #send_msg{
        height:15%;
    }
    #me {
        width: 100%;
        height: 84.5%;
        overflow: auto;
    }

</style>

<script>
    let chatbot = {
        id:null,
        stompClient:null,
        init:function(){
            this.id = $('#adm_id').val();//adm_id에서 적힌 글씨를 id로 뿌려줄 예정이다.
            $("#connect").click(function() {
                chatbot.connect();
                $("#connect").removeClass("text-info");
                $("#connect").addClass("text-light bg-info");
                $("#disconnect").removeClass("text-light bg-info");
                $("#disconnect").addClass("text-info");
            });
            $("#disconnect").click(function() {
                chatbot.disconnect();
                $("#connect").removeClass("text-light bg-info");
                $("#connect").addClass("text-info");
                $("#disconnect").removeClass("text-info");
                $("#disconnect").addClass("text-light bg-info");
            });
            $("#sendme").click(function() {
                chatbot.sendMe();
            });
        },
        connect:function(){
            var sid = this.id;
            var socket = new SockJS('${adminserver}/chbot');
            // SockJS는 웹소켓을 지원하지 않는 브라우저에서도 웹소켓과 유사한 방식으로 통신할 수 있게 해주는 js라이브러리
            this.stompClient = Stomp.over(socket);
            // Stomp는 웹소켓 프로토콜을 사용하는 메시징 서비스를 제공.(Simple Text Oriented Messaging Protocol)

            this.stompClient.connect({}, function(frame) {
                //첫 번째 매개변수는 연결 설정 객체, STOMP 메시지 브로커와의 인증을 위한 정보를 제공합니다.
                //두 번째 매개변수는 연결이 성공했을 때 실행될 콜백 함수입니다. 서버에서 전송한 메시지를 수신하기 위해 콜백 함수를 등록합니다.
                chatbot.setConnected(true);//단순히 connected, disconnected 적히게 하는 함수.
                console.log('Connected: ' + frame);

                this.subscribe('/chsend/'+sid, function(msg) {
                    $("#me").append(
                        '<p class="w-75 p-2 rounded-sm text-dark float-left" style="background-color: #f5f6f7; margin-left:0.75rem"><b>' + 'chatbot' +' : '+'</b>'+ JSON.parse(msg.body).content1+ '</p>');
                });

            });
        },
        disconnect:function(){
            if (this.stompClient !== null) {
                this.stompClient.disconnect();
            }
            chatbot.setConnected(false);
            console.log("Disconnected");
        },
        setConnected:function(connected){
            if (connected) {
                $("#status").text("Connected");
            } else {
                $("#status").text("Disconnected");
            }
        },

        sendMe:function(){
            var msg = JSON.stringify({
                'sendid' : this.id,
                'content1' : $('#metext').val()
            });
            this.stompClient.send("/chatbotme", {}, msg);
            $('#me').append(
                '<p class="w-75 p-2 ml-lg-5 mr-2 rounded-sm bg-inverse-info text-dark float-right"><b>'+this.id+' : '+'</b>'+ $('#metext').val()+'</p>'
            );
            $('#metext').val('');
        }
    };
    $(function(){
        chatbot.init();
    })

</script>


<div class="theme-setting-wrapper">
    <div class="d-flex dropup">
        <button id="settings-trigger" type="button" class="btn btn-dark btn-rounded btn-icon" style="background: #000" data-toggle="dropdown">
            <i class="ti-help"></i>
        </button>
    </div>
    <div id="theme-settings" class="settings-panel">
        <i class="settings-close ti-close"></i>
        <p class="settings-heading pl-3 mb-2">ChatBot
            <input type="hidden" id="adm_id" value="${loginadm.id}"/>
            <a id="connect" class="ml-2 px-1 text-info">연결</a>
            <a id="disconnect" class="px-1 text-info">연결해제</a>
        </p>
        <div class="d-flex">
        <div class="card" id = "chatbot_box">

                <div id="container"></div>
                <div class="col-sm-12" style="padding: 0">
                    <span class="ml-3">연결상태 : </span><span id="status"></span>


                    <div id="me" class="mt-3 mb-2"></div>
                    <div class="card-footer text-muted d-flex justify-content-start align-items-center p-2">
                        <input type="text" class="form-control form-control-lg px-3" id="metext"
                               placeholder="메세지를 입력하세요">
                        <button id="sendme" style="border: none; background: none; height: 3rem; font-size: larger"><i class="mdi mdi-send ml-2"></i></button>
                    </div>
                </div>


            </div>
        </div>
    </div>
</div>


    <!-- DataTales Example -->

