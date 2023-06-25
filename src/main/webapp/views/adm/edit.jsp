<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--daum 주소--%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                // document.getElementById('sample4_postcode').value = data.zonecode;
                // document.getElementById("sample4_roadAddress").value = roadAddr;
                // document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                document.getElementById("addr").value =
                    "("+ data.zonecode +") " + roadAddr + " ("+ data.jibunAddress +")"

                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    // document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                    document.getElementById("addr").value += extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                // var guideTextBox = document.getElementById("guide");
                // // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                // if(data.autoRoadAddress) {
                //     var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                //     guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                //     guideTextBox.style.display = 'block';
                //
                // } else if(data.autoJibunAddress) {
                //     var expJibunAddr = data.autoJibunAddress;
                //     guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                //     guideTextBox.style.display = 'block';
                // } else {
                //     guideTextBox.innerHTML = '';
                //     guideTextBox.style.display = 'none';
                // }
            }
        }).open();
    }
</script>
<script>
    let adm_edit = {
        init:()=>{
            $('#adm_update_btn').click(() =>{
                adm_edit.send();
            });
            $('#adm_delete_btn').click(()=>{
                let b = confirm("삭제하시겠습니까?");
                if(b){
                    location.href = '/adm/deleteimpl?id=${adm.id}';
                }
            });
        },
        send:()=>{
            $('#adm_edit_form').attr({
                action:'/adm/updateimpl',
                method:'post',
            });
            $('#adm_edit_form').submit();
        }
    };
    $(function(){
        if(${loginadm.lev < '3'}) {
            $('#adm_isdelete_select').css("display", "none");
            $('#adm_lev_select').css("display", "none");
        }

        adm_edit.init();
    });
</script>

<!-- partial -->

<div class="content-wrapper">
    <div class="row">

        <div class="col-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title pl-1 mt-1 mb-5 text-primary">관리자 정보 수정</h4>
                    <p class="card-description">
                        추가 정보를 입력하세요.
                    </p>

                    <form id = "adm_edit_form" class="forms-sample">
                        <div class="form-group">
                            <label for="id">아이디</label>
                            <input type="text" class="form-control" name = "id" id="id" value = "${adm.id}" readonly>
                        </div>
                        <div class="form-group">
                            <label for="pwd">비밀번호</label>
                            <input type="password" class="form-control" name = "pwd" id="pwd" placeholder="비밀번호를 새로 입력하세요...">
                        </div>
                        <div class="form-group">
                            <label for="name">이름</label>
                            <input type="text" class="form-control" name = "name" id="name" value = "${adm.name}">
                        </div>

<%--                        <c:if test="${loginadm.lev==3}">--%>

                            <div class="form-group" id="adm_lev_select">
                                <label for="lev">권한 타입</label>
                                <select class="form-control" id="lev" name = "lev" >
                                    <option value = '1' <c:if test="${adm.lev=='1'}">selected</c:if>>1</option>
                                    <option value = '2' <c:if test="${adm.lev=='2'}">selected</c:if>>2</option>
                                    <option value = '3' <c:if test="${adm.lev=='3'}">selected</c:if>>3</option>
                                </select>
                            </div>
<%--                        </c:if>--%>

                        <div class="form-group">
                            <label for="email">이메일</label>
                            <input type="email" class="form-control" name = "email" id="email" value="${adm.email}">
                        </div>
                        <div class="form-group">
                            <label for="contact">연락처</label>
                            <input type="text" class="form-control" name = "contact" id="contact" value="${adm.contact}">
                        </div>
                        <div class="form-group">
                            <label for="addr">주소</label>
                            <div class="input-group">
                                <input type="text" class="form-control" name = "addr" id="addr" value="${adm.addr}">
                                <div class="input-group-prepend">
                                    <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
                                </div>
                            </div>
                        </div>

                        <div class="form-group" id="adm_isdelete_select">
                            <label for="isDelete">공개여부</label>
                            <select class="form-control" id="isDelete" name = "isDelete" >
                                <option value="0" <c:if test="${adm.isDelete=='0'}">selected</c:if>>활성화</option>
                                <option value="1" <c:if test="${adm.isDelete=='1'}">selected</c:if>>삭제</option>
                            </select>
                        </div>

                        <button id = "adm_update_btn" type="button" class="btn btn-primary mr-2">Update</button>
                        <button id = "adm_delete_btn" type="button" class="btn btn-light">Delete</button>
                    </form>
                </div>
            </div>
        </div>

    </div>
</div>
<!-- content-wrapper ends -->
