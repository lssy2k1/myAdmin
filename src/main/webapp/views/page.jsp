<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!-- pagination start -->
<div class="col text-center">
    <ul class="pagination d-flex flex-wrap justify-content-center pagination-primary mt-lg-3">

        <c:choose>
            <c:when test="${cpage.getPrePage() != 0}">
                <li class="page-item">
                    <a class="page-link" href="/${target}/all?pageNo=${cpage.getPrePage()}"><</a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="page-item disabled">
                    <a class="page-link" href="#"><</a>
                </li>
            </c:otherwise>
        </c:choose>

        <c:forEach begin="${cpage.getNavigateFirstPage() }" end="${cpage.getNavigateLastPage() }" var="page">
            <c:choose>
                <c:when test="${cpage.getPageNum() == page}">
                    <li class="page-item active">
                        <a class="page-link" href="/${target}/all?pageNo=${page}">${page}</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="page-item">
                        <a class="page-link" href="/${target}/all?pageNo=${page}">${page}</a>
                    </li>
                </c:otherwise>
            </c:choose>

        </c:forEach>
        <c:choose>
            <c:when test="${cpage.getNextPage() != 0}">
                <li class="page-item">
                    <a class="page-link" href="/${target}/all?pageNo=${cpage.getNextPage()}">></a></li>
            </c:when>
            <c:otherwise>
                <li class="page-item disabled">
                    <a class="page-link"href="#">></a>
                </li>
            </c:otherwise>
        </c:choose>

    </ul>
</div>
<!-- pagination end -->