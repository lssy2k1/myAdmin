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
            $("#delete_oneonone").click(function(){
                localStorage.removeItem('messages');
                $('#to').empty(); // 대화 내용을 비움
                // 반영된 데이터를 즉시 보여주기 위해 페이지 상단으로 스크롤
                $(window).scrollTop(0);
            })
            $("#sendto").click(function () {
                oneonone.sendTo();
            });

            // 알림 bell notification 설정해주기. 기본값 false, true시 블링크(true는 subscribe시 변동)
            const isNotificationSeen = localStorage.getItem('isNotificationSeen') || 'false';
            if (isNotificationSeen === 'true') {
                $('#notification_bell').addClass('count blinking');
            }

            // 저장된 알림 메시지 불러오기
            const notificationMessage = localStorage.getItem('notificationMessage') || '';
            if (notificationMessage) {
                const notificationBox = document.createElement('div');
                notificationBox.classList.add('dropdown-item', 'preview-item');
                const previewThumbnail = document.createElement('div');
                previewThumbnail.classList.add('preview-thumbnail');

                const thumbnailBtn = document.createElement('button');
                thumbnailBtn.classList.add('btn', 'btn-inverse-danger', 'btn-icon');
                const thumbnailIcon = document.createElement('i');
                thumbnailIcon.classList.add('ti-email', 'mx-0');
                thumbnailBtn.append(thumbnailIcon);
                previewThumbnail.append(thumbnailBtn);

                const thumbnailMsg = document.createElement('div');
                thumbnailMsg.classList.add('preview-item-content');
                const thumbnailMsgTxt = document.createElement('h6');
                thumbnailMsgTxt.classList.add('preview-subject', 'font-weight-normal', 'mb-0', 'pr-1');
                thumbnailMsg.append(thumbnailMsgTxt);

                thumbnailMsgTxt.textContent = notificationMessage;

                notificationBox.append(previewThumbnail);
                notificationBox.append(thumbnailMsg);
                $('#notification_contents').append(notificationBox);
            }

            // 저장된 메시지 불러오기
            const messages = JSON.parse(localStorage.getItem('messages')) || [];
            messages.sort((a, b) => a.timestamp - b.timestamp);

            for (const message of messages) {
                if (message.sendid === this.id) {
                    $('#to').append(
                        '<p class="w-75 p-2 ml-lg-5 mr-2 rounded-sm bg-inverse-info text-dark float-right"><b>'
                        + message.sendid + ' : ' + '</b>' + message.content1 + '</p>'
                    );
                } else if (message.receiveid === this.id){
                    $('#to').append(
                        '<p class="w-75 p-2 rounded-sm text-dark float-left" style="background-color:#e9ecef; margin-left:0.75rem">' +
                        '<b>' + message.sendid + ' : ' + '</b>' + message.content1 + '</p>'
                    );
                }
            }

            $('#to').animate({ scrollTop: $('#to')[0].scrollHeight }, 1000);

            // 알림 클릭 시 알림 처리
            $('#notification_bell_btn').click(function () {
                // 알림 확인 시 깜빡임 제거
                if ($('#notification_bell').hasClass('count blinking')) {
                    $('#notification_bell').removeClass('count blinking');

                    localStorage.setItem('isNotificationSeen', 'false');
                    localStorage.removeItem('notificationMessage');

                }

                <%--// 알림 확인 시 알림 메시지 유지--%>
                <%--$('#notification_contents').html(`<div class="preview-thumbnail mdi mdi-email">${sid}님의 메시지가 도착했습니다.</div>`);--%>
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
                        '<p class="w-75 p-2 rounded-sm text-dark float-left" style="background-color:#e9ecef; margin-left:0.75rem">' +
                        '<b>' + JSON.parse(msg.body).sendid + ' : ' + '</b>' + JSON.parse(msg.body).content1 + '</p>');
                    $('#to').animate({scrollTop: $('#to')[0].scrollHeight}, 1000);


                    // 저장 완료 시 화면에 알림 메시지 추가
                    // 알람 울리기위한 css 수정
                    var notificationBell = document.getElementById("notification_bell");
                    var notificationBellBtn = document.getElementById("notification_bell_btn");
                    notificationBell.classList.add("count");
                    notificationBell.classList.add("blinking");

                    // 알림 보내기 위한 html 추가
                    var notificationContents = document.getElementById("notification_contents");

                    const notificationBox = document.createElement('div');
                    notificationBox.classList.add('dropdown-item', 'preview-item');
                    var previewThumbnail = document.createElement("div");
                    previewThumbnail.classList.add("preview-thumbnail");

                    var thumbnailBtn = document.createElement("button");
                    thumbnailBtn.classList.add("btn", "btn-inverse-danger", "btn-icon");
                    var thumbnailIcon = document.createElement("i");
                    thumbnailIcon.classList.add("ti-email", "mx-0");
                    thumbnailBtn.appendChild(thumbnailIcon);
                    previewThumbnail.appendChild(thumbnailBtn);

                    var thumbnailMsg= document.createElement("div");
                    thumbnailMsg.classList.add("preview-item-content");
                    var thumbnailMsgTxt = document.createElement("h6");
                    thumbnailMsgTxt.classList.add("preview-subject", "font-weight-normal", "mb-0", "pr-1");
                    thumbnailMsg.appendChild(thumbnailMsgTxt);

                    thumbnailMsgTxt.textContent = JSON.parse(msg.body).sendid + "님의 메시지가 도착했습니다.";
                    notificationBox.appendChild(previewThumbnail);
                    notificationBox.appendChild(thumbnailMsg);
                    notificationContents.appendChild(notificationBox)

                    // 받은 메시지 저장 및 local storage에 저장
                    const messages = JSON.parse(localStorage.getItem('messages')) || [];
                    messages.push(JSON.parse(msg.body));
                    localStorage.setItem('messages', JSON.stringify(messages));

                    //벨 울리도록 true로 저장
                    localStorage.setItem('isNotificationSeen', 'true');

                    //도착한 내용 저장
                    localStorage.setItem('notificationMessage', thumbnailMsgTxt.textContent);
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
                '<p class="w-75 p-2 ml-lg-5 mr-2 rounded-sm bg-inverse-info text-dark float-right"><b>'
                + this.id + ' : ' + '</b>' + $('#totext').val() + '</p>'
            );
            $('#to').animate({scrollTop: $('#to')[0].scrollHeight}, 1000);
            $('#totext').val('');

            // 보낸 메시지 저장 및 local storage에 저장
            const messages = JSON.parse(localStorage.getItem('messages')) || [];
            messages.push(JSON.parse(msg));
            localStorage.setItem('messages', JSON.stringify(messages));


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
        <a id="delete_oneonone" class="px-1 text-info">비우기</a>

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
