<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    let sbj_code_maker = {
        init : () =>{
            $('#sbj_send_btn').click(() => {
                $.ajax({
                    url:'/sbjcodemaker',
                    data:{
                        sbjName : $('#sbjName').val(),
                        sbjCode2 : $('#sbjCode2').val()
                    },

                }).done(
                    (result)=>{
                        console.log(result);
                        $('#sbjCode3').val(result);
                    }
                )
            })
        }
    }
    $(function (){
        sbj_code_maker.init();
    })
</script>


<div class="content-wrapper">
    <div class="row">
        <div class="col-md-12 grid-margin" style = "display: flex; flex-direction: row;">

            <%-----------네이버 메일 폼 양식-----------------------------------------%>
            <div class="row">
                <div class="col-12 mb-4 mb-xl-0" style="display: flex; justify-content: space-between">
                    <div class="card">
                        <div class="card-body">
                            <form id = "sbj_add_form" class="forms-sample">
                                <h4>강의 코드 추가</h4>
                                <div class="form-group">
                                    <label for="sbjName">과목이름</label>
                                    <input type="text" class="form-control" name = "sbjName" id="sbjName" placeholder="과목명을 입력하세요...">
                                </div>
                                <div class="form-group">
                                    <label for="sbjCode2">참조과목종류</label>
                                    <select class="form-control" id="sbjCode2" name = "sbjCode2" >
                                        <c:forEach var="obj" items="${sbjlist}">
                                            <option value="${obj.sbjCode}">
                                                    ${obj.sbjName}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="sbjCode3">생성된 과목코드</label>

                                    <input type="text" class="form-control"  id="sbjCode3" name = "sbjCode3" readonly>

                                </div>
                                <button id = "sbj_send_btn" type="button" class="btn btn-primary mr-2" style="float : right">등록하기</button>
<%--                                <button id = "sbj_can_btn" type="button" class="btn btn-outline-primary">취소하기</button>--%>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

