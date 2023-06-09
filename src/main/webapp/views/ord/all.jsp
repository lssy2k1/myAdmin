<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    let ordchart={
        init:()=>{
            $.ajax({
                url:'/getordchart',
                success:(data)=>{
                    if(data.gettoday != null){

                        document.getElementById('todayOrd').textContent = data.gettoday.todayOrd + "건";
                        document.getElementById('todayOrd1').textContent = data.gettoday.today;


                        // 금일 결제 금액
                        document.getElementById('todayPrice').textContent = data.gettoday.todayPrice + "원";
                        document.getElementById('todayPrice1').textContent = data.gettoday.today;

                    }

                    document.getElementById('todayOrd').textContent = "0건";
                    document.getElementById('todayPrice').textContent = "0원";
                    // 이거 왜 있는겨



                    // Monthly 최다 주문 과목
                    document.getElementById('mostlec').textContent = data.mostlec.countLec +"건";
                    document.getElementById('mostlec1').textContent = data.mostlec.title;

                    // Monthly 최다 주문 학생
                    document.getElementById('moststdn').textContent = data.moststdn.countName +"건";
                    document.getElementById('moststdn1').textContent = data.moststdn.name;

                }
            })
        }
    }
    $(()=>{
        $('#ord_lec').click(() =>{
            window.location.href = '/ord/alllec';
        })
        ordchart.init();
        setInterval(ordchart.init, 5000);
    })

</script>

<!-- partial -->

<div class="content-wrapper">
    <div class="row px-1  ">

        <div class="col-md-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <p class="card-title pl-1 mt-1 mb-4 text-primary">주문 통계</p>
                    <div class="row px-1">
                            <div class="col-md-3 mb-1 stretch-card transparent">
                                <div class="card card-tale">
                                    <div class="card-body">
                                        <p class="mb-4">금일 주문 건수</p>
                                        <p class="fs-30 mb-2" id="todayOrd"></p>
                                        <p class="mb-0" id="todayOrd1"></p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 mb-1 stretch-card transparent">
                                <div class="card card-dark-blue">
                                    <div class="card-body">
                                        <p class="mb-4">금일 결제 금액</p>
                                        <p class="fs-30 mb-2" id ="todayPrice"></p>
                                        <p class="mb-0" id ="todayPrice1"></p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 mb-1 stretch-card transparent">
                                <div class="card card-light-blue">
                                    <div class="card-body">
                                        <p class="mb-4">Monthly 최다 주문 과목</p>
                                        <p class="fs-30 mb-2" id="mostlec"></p>
                                        <p class="mb-0" id="mostlec1"></p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 mb-1 stretch-card transparent">
                                <div class="card card-light-danger">
                                    <div class="card-body">
                                        <p class="mb-4">Monthly 최다 주문 학생</p>
                                        <p class="fs-30 mb-2" id="moststdn"></p>
                                        <p class="mb-0" id="moststdn1"></p>
                                    </div>
                                </div>
                            </div>

                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title pl-1 mt-1 mb-3 text-primary">주문 조회</h4>
                    <div class="float-right mr-1 mb-3">
                        <button type="button" id="ord_stdn" class="btn btn-primary btn-sm mr-1">학생별 주문</button>
                        <button type="button" id="ord_lec" class="btn btn-outline-primary btn-sm mr-1">과목별 주문</button>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-bordered">
                            <thead class="text-center">
                            <tr>
                                <th style="width: 7%">주문번호</th>
                                <th style="width: 15%">학생ID</th>
                                <th style="width: 23%">주문일자</th>
                                <th style="width: 14%">주문가격</th>
                                <th style="width: 14%">쿠폰사용금액</th>
                                <th style="width: 14%">결제방법</th>
                                <th style="width: 13%">주문상태</th>
                            </tr>
                            </thead>

                            <tbody class="text-center">
                            <c:forEach var="obj" items="${cpage.getList()}">
                                <tr>
                                    <td><a href = "/ord/detailstdn?id=${obj.id}">${obj.id}</a></td>
                                    <td><a href = "/stdn/detail?id=${obj.stdnId}">${obj.stdnId}</a></td>
                                    <td>${obj.rdate}</td>
                                    <td>${obj.ordPrice}원</td>
                                    <td>${obj.useCpn}원</td>
                                    <c:choose>
                                        <c:when test="${obj.payMethod==1}">
                                            <td>카드</td>
                                        </c:when>
                                        <c:when test="${obj.payMethod==2}">
                                            <td>카카오페이</td>
                                        </c:when>
                                    </c:choose>
                                    <c:choose>
                                        <c:when test="${obj.isDone==0}">
                                            <td>취소 및 환불</td>
                                        </c:when>
                                        <c:when test="${obj.isDone==1}">
                                            <td>결제완료</td>
                                        </c:when>
                                    </c:choose>
                                </tr>
                            </c:forEach>

                            </tbody>
                        </table>
                        <jsp:include page="../page.jsp"/>
                    </div>
<%--                    <a type="button" href="/anc/add" class="btn btn-outline-primary btn-icon-text" style="margin-top:15px; float:right">--%>
<%--                        <i class="ti-plus btn-icon-prepend"></i>--%>
<%--                        글쓰기--%>
<%--                    </a>--%>
                </div>
            </div>

        </div>


    </div>
</div>
                <!-- content-wrapper ends -->
