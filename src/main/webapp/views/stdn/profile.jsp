<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script>
    $(document).ready(function(){
        $('ul.nav-tabs li a').click(function(){
            var tab_id = $(this).attr('aria-controls');

            $('ul.nav-tabs li a').removeClass('active');
            $('.tab-pane').removeClass('active');

            $(this).addClass('active');
            $("#"+tab_id).addClass('active show');
        });

    });
</script>

<div class="content-wrapper">
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body" style="padding: 40px">
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="border-bottom text-center pb-4">
                                <c:choose>
                                    <c:when test="${stdn.img==null || (stdn.img).equals('')}"><img id="stdn_img"
                                                                                                   src="/images/adm.png"
                                                                                                   alt="profile img"
                                                                                                   class="img-lg rounded-circle mb-3"/>
                                    </c:when>
                                    <c:when test="${stdn.img!=null || !(stdn.img).equals('')}"><img id="stdn_img"
                                                                                                    src="/uimg/${stdn.img}"
                                                                                                    alt="profile img"
                                                                                                    class="img-lg rounded-circle mb-3"/>
                                    </c:when>
                                </c:choose>
                                <div class="mb-3">
                                    <h3>${stdn.name}</h3>
                                    <div class="d-flex align-items-center justify-content-center">
                                        <h5 class="mb-0 me-2 text-muted">KB국민은행</h5>
                                    </div>
                                </div>
                                <p class="w-75 mx-auto mb-3">"${mypage.detail}"</p>
                                <div class="d-flex justify-content-center">
                                    <p class="nav-link">
                                        <i class="ti-calendar"></i>
                                        입행일 : ${mypage.comdate}
                                    </p>
                                    <p class="nav-link">
                                        <i class="ti-calendar"></i>
                                        입과일 : ${mypage.digidate}
                                    </p>
                                </div>
                            </div>
                            <div class="border-bottom py-4">
                                <p>관심사</p>
                                <div>
                                    <label class="badge badge-outline-dark">${stdn.sbj1}</label>
                                    <label class="badge badge-outline-dark">${stdn.sbj2}</label>
                                    <label class="badge badge-outline-dark">${stdn.sbj3}</label>
                                </div>
                            </div>
                            <div class="border-bottom py-4">
                                <div class="d-flex mb-3">
                                    <div class="progress progress-md flex-grow">
                                        <div class="progress-bar bg-primary" role="progressbar" aria-valuenow="55"
                                             style="width: 55%" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>
                                <div class="d-flex">
                                    <div class="progress progress-md flex-grow">
                                        <div class="progress-bar bg-success" role="progressbar" aria-valuenow="75"
                                             style="width: 75%" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="py-4">
                                <p class="clearfix">
                                    <span class="float-left">출결</span>
                                    <span class="float-right text-muted">
                                        <c:choose>
                                            <c:when test="${attd.isAttend == '1'}">
                                                <span class="badge badge-outline-success" style="padding:1px">출석</span>
                                            </c:when>
                                            <c:when test="${attd.isAttend == '2'}">
                                                <span class="badge badge-outline-warning">지각</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge badge-outline-danger"
                                                      style="padding:4px 6px">결석</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </span>
                                </p>
                                <p class="clearfix">
                                    <span class="float-left">연락처</span>
                                    <span class="float-right text-muted">${stdn.contact}</span>
                                </p>
                                <p class="clearfix">
                                    <span class="float-left">이메일</span>
                                    <span class="float-right text-muted">${stdn.email}</span>
                                </p>
                                <p class="clearfix">
                                    <span class="float-left">Instagram</span>
                                    <span class="float-right text-muted">
                                        <a href="${mypage.insta}">바로가기</a>
                                    </span>
                                </p>
                                <p class="clearfix">
                                    <span class="float-left">Facebook</span>
                                    <span class="float-right text-muted">
                                        <c:choose>
                                            <c:when test="${mypage.facebook == null}">
                                                없음
                                            </c:when>
                                            <c:otherwise>
                                                <a href="${mypage.facebook}">바로가기</a>
                                            </c:otherwise>
                                        </c:choose>

                                    </span>
                                </p>
                            </div>
                            <a class="btn btn-primary btn-block mb-2" href="/stdn/all" type="button">
                                목록으로 돌아가기
                            </a>
                        </div>
                        <div class="col-lg-8">
                            <ul class="nav nav-tabs" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="home-tab" data-bs-toggle="tab" href="#" role="tab"
                                       aria-controls="home-1" aria-selected="false">기본정보</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="attd-tab" data-bs-toggle="tab" href="#"
                                       role="tab" aria-controls="attd-1" aria-selected="false">출결</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="study-tab" data-bs-toggle="tab" href="#"
                                       role="tab" aria-controls="study-1" aria-selected="true">스터디</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="test-tab" data-bs-toggle="tab" href="#"
                                       role="tab" aria-controls="test-1" aria-selected="true">테스트</a>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane fade active show" id="home-1" role="tabpanel" aria-labelledby="home-tab">
                                    <div class="media">
                                        <div class="media-body">
                                            <h4 class="mt-0">Why choose us?</h4>
                                            <p>
                                                Far curiosity incommode now led smallness allowance. Favour bed assure
                                                son things yet. She consisted
                                                consulted elsewhere happiness disposing household any old the. Widow
                                                downs you new shade drift hopes
                                                small. So otherwise commanded sweetness we improving. Instantly by
                                                daughters resembled unwilling principle
                                                so middleton.
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="attd-1" role="tabpanel" aria-labelledby="attd-tab">
                                    <div class="media">
                                        <img class="me-3 w-25 rounded" src="../../../../images/faces/face12.jpg"
                                             alt="sample image">
                                        <div class="media-body">
                                            <h4 class="mt-0">John Doe</h4>
                                            <p>
                                                Fail most room even gone her end like. Comparison dissimilar unpleasant
                                                six compliment two unpleasing
                                                any add. Ashamed my company thought wishing colonel it prevent he in.
                                                Pretended residence are something
                                                far engrossed old off.
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="study-1" role="tabpanel"
                                     aria-labelledby="study-tab">
                                    <h4>Contact us </h4>
                                    <p>
                                        Feel free to contact us if you have any questions!
                                    </p>
                                    <p>
                                        <i class="ti-headphone-alt text-info"></i>
                                        +123456789
                                    </p>
                                    <p>
                                        <i class="ti-email text-success"></i>
                                        contactus@example.com
                                    </p>
                                </div>
                                <div class="tab-pane fade" id="test-1" role="tabpanel"
                                     aria-labelledby="test-tab">
                                    <h4>Contact us </h4>
                                    <p>
                                        Feel free to contact us if you have any questions!
                                    </p>
                                    <p>
                                        <i class="ti-headphone-alt text-info"></i>
                                        +123456789
                                    </p>
                                    <p>
                                        <i class="ti-email text-success"></i>
                                        contactus@example.com
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- content-wrapper ends -->

