<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- partial -->
<div class="content-wrapper">
    <div class="row">
        <div class="col-md-12 grid-margin">
            <div class="col-lg-12 grid-margin stretch-card">
                <div class="card">
                    <div class="card-body">
                        <div class="card-title pl-1 mt-1 mb-5 text-primary">전체 수강생 목록</div>
                        <form action="/stdn/approvesearch" method="get">
                            <div class="form-group"
                                 style="display: flex; align-items: center; float: right; margin: 0 0 0.7em 0; width: 50%">
                                <input type="hidden" name="keyword1" value="id">
                                <input type="hidden" name="keyword2" value="name">
                                <label style="margin: 0 0.7em 0 0">ID</label>
                                <input class="form-control" type="text" name="search1" style="width: 39%"
                                       <c:if test="${value1 != ''}">value="${value1}"</c:if>>
                                <label style="margin: 0 0.7em 0 2em">NAME</label>
                                <input class="form-control" style="width: 39%" type="text" name="search2"
                                       <c:if test="${value2 != ''}">value="${value2}"</c:if>>
                                <button type="submit" id="approveSearchBtn" class="btn btn-inverse-primary btn-sm ml-3 mr-1"
                                        style="width: 2rem; white-space: nowrap; width: 11%">검색
                                </button>
                            </div>
                        </form>
                        <div class="table-responsive pt-3">
                            <table class="table table-bordered text-center">
                                <thead>
                                <tr>
                                    <th style="width: 15%">
                                        이미지
                                    </th>
                                    <th style="width: 18%">
                                        아이디
                                    </th>
                                    <th style="width: 12%">
                                        이름
                                    </th>
                                    <th style="width: 25%">
                                        이메일
                                    </th>
                                    <th style="width: 20%">
                                        연락처
                                    </th>
                                    <th style="width: 10%">
                                        승인
                                    </th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="s" items="${cpage.getList()}">
                                            <tr>
                                                <td>
                                                    <a href="#" data-toggle="modal" data-target="#target${s.id}">
                                                        <c:choose>
                                                            <c:when test="${s.img==null || (s.img).equals('') || s.img=='default.jpg'}">
                                                                <img id="item_img" src="/images/adm.png"
                                                                     alt="profile img"
                                                                     style="width:7em; height:7em"/>
                                                            </c:when>
                                                            <c:when test="${s.img!=null || !(s.img).equals('')}">
                                                                <img id="item_img" src="/images/${s.img}"
                                                                     alt="${s.img}"
                                                                     style="width:7em; height:7em"/>
                                                            </c:when>
                                                        </c:choose>
                                                    </a>
                                                </td>
                                                <td><a href="#">${s.id}</a></td>
                                                <td>${s.name}</td>
                                                <td>${s.email}</td>
                                                <td>${s.contact}</td>
                                                <td>
                                                    <a href="/stdn/approveimpl?id=${s.id}" type="button" class="btn btn-block btn-outline-primary btn-sm font-weight-medium auth-form-btn">승인</a>
                                                </td>
                                            </tr>


                                            <!-- Modal -->
                                            <div id="target${s.id}" class="modal fade" role="dialog">
                                                <div class="modal-dialog">

                                                    <!-- Modal content-->
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h4 class="modal-title">${s.name}</h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <img src="/uimg/${s.img}" alt="${s.img}"
                                                                 style="width:445px; height:445px"
                                                                 style="align-items: center"/>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <a href="#" class="btn btn-primary"
                                                               role="button">상세조회</a>
                                                            <a href="#" class="btn btn-outline-primary" role="button"
                                                               data-dismiss="modal">닫기</a>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                </c:forEach>
                                </tbody>
                            </table>
                            <c:choose>
                                <c:when test="${pagination==null}">
                                    <jsp:include page ="../page.jsp"/>
                                </c:when>
                                <c:otherwise>
                                    <jsp:include page = "../${pagination}.jsp"/>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <a type="button" href="/stdn/approveallimpl" class="btn btn-outline-primary btn-icon-text mt-lg-2 mr-1"
                           style="float:right; display:flex; align-items: center">
                            <i class="ti-check btn-icon-prepend"></i>
                            전체 승인
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- content-wrapper ends -->