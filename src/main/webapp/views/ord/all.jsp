<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    let ordchart={
        init:()=>{
            $.ajax({
                url:'/getordchart',
                success:(data)=>{
                    if(data.gettoday != null){

                        document.getElementById('todayOrd').textContent = data.gettoday.todayOrd;
                        document.getElementById('todayOrd1').textContent = data.gettoday.today;


                        // 금일 결제 금액
                        document.getElementById('todayPrice').textContent = data.gettoday.todayPrice;
                        document.getElementById('todayPrice1').textContent = data.gettoday.today;

                    }

                    document.getElementById('todayOrd').textContent = 0;
                    document.getElementById('todayPrice').textContent = 0;



                    // Monthly 최다 주문 과목
                    document.getElementById('mostlec').textContent = data.mostlec.countLec;
                    document.getElementById('mostlec1').textContent = data.mostlec.title;

                    // Monthly 최다 주문 학생
                    document.getElementById('moststdn').textContent = data.moststdn.countName;
                    document.getElementById('moststdn1').textContent = data.moststdn.name;

                }
            })
        }
    }
    $(()=>{
        $('#ord_lec').click(() =>{
            window.location.href = '/orddetail/all';
        })
        ordchart.init();
        setInterval(ordchart.init, 5000);
    })

</script>

<!-- partial -->

<div class="content-wrapper">
    <div class="row">

        <div class="col-lg-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <p class="card-title">주문 통계</p>
                    <div class="row">

                            <div class="col-md-3 mb-4 stretch-card transparent">
                                <div class="card card-tale">
                                    <div class="card-body">
                                        <p class="mb-4">금일 주문 건수</p>
                                        <p class="fs-30 mb-2" id="todayOrd"></p>
                                        <p id="todayOrd1"></p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 mb-4 stretch-card transparent">
                                <div class="card card-dark-blue">
                                    <div class="card-body">
                                        <p class="mb-4">금일 결제 금액</p>
                                        <p class="fs-30 mb-2" id = "todayPrice"></p>
                                        <p id = "todayPrice1"></p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 mb-4 stretch-card transparent">
                                <div class="card card-light-blue">
                                    <div class="card-body">
                                        <p class="mb-4">Monthly 최다 주문 과목</p>
                                        <p class="fs-30 mb-2" id="mostlec"></p>
                                        <p id="mostlec1"></p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 mb-4 stretch-card transparent">
                                <div class="card card-light-danger">
                                    <div class="card-body">
                                        <p class="mb-4">Monthly 최다 주문 학생</p>
                                        <p class="fs-30 mb-2" id="moststdn"></p>
                                        <p id="moststdn1"></p>
                                    </div>
                                </div>
                            </div>

                    </div>
                </div>
            </div>
        </div>

        <div class="col-lg-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">주문 조회</h4>
                    <button type="button" id="ord_stdn" class="btn btn-primary btn-sm mr-1">학생별 주문</button>
                    <button type="button" id="ord_lec" class="btn btn-outline-primary btn-sm mr-1">과목별 주문</button>
                    <p></p>
                    <div class="table-responsive">
                        <table class="table table-bordered">
                            <thead>
                            <tr>

                                <th>주문번호</th>
                                <th>학생ID</th>
                                <th>주문일자</th>
                                <th>주문가격</th>
                                <th>쿠폰사용금액</th>
                                <th>결제방법</th>
                                <th>주문상태</th>
                                <th>수정일자</th>

                            </tr>
                            </thead>

                            <tbody>
                            <c:forEach var="obj" items="${cpage.getList()}">
                                <tr>
                                    <td><a href = "/ord/detail?id=${obj.id}">${obj.id}</a></td>
                                    <td><a href = "/stdn/detail?id=${obj.stdnId}">${obj.stdnId}</a></td>
                                    <td>${obj.rdate}</td>
                                    <td>${obj.ordPrice}</td>
                                    <td>${obj.useCpn}</td>
                                    <td>${obj.payMethod}</td>
                                    <td>${obj.isDone}</td>
                                    <td>${obj.updDate}</td>


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
