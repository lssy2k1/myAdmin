<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!-- pagination start -->
<div class="col text-center">
  <ul class="pagination d-flex flex-wrap justify-content-center pagination-primary mt-lg-4 mb-2">
    <c:choose>
      <c:when test="${cpage.getPrePage() != 0}">
        <li class="page-item">
          <a class="page-link" href="/${target}/${function}?pageNo=${cpage.getPrePage()}&keyword1=id&search1=${search.search1}&&keyword2=name&search2=${search.search2}"><</a>
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
            <a class="page-link" href="/${target}/${function}?pageNo=${page}&keyword1=id&search1=${search.search1}&&keyword2=name&search2=${search.search2}">${page}</a>
          </li>
        </c:when>
        <c:otherwise>
          <li class="page-item">
            <a class="page-link" href="/${target}/${function}?pageNo=${page}&keyword1=id&search1=${search.search1}&&keyword2=name&search2=${search.search2}">${page}</a>
          </li>
        </c:otherwise>
      </c:choose>

    </c:forEach>
    <c:choose>
      <c:when test="${cpage.getNextPage() != 0}">
        <li class="page-item">
          <a class="page-link" href="/${target}/${function}?pageNo=${cpage.getNextPage()}&keyword1=id&search1=${search.search1}&&keyword2=name&search2=${search.search2}">></a>
        </li>
      </c:when>
      <c:otherwise>
        <li class="page-item disabled">
          <a class="page-link" href="#">></a>
        </li>
      </c:otherwise>
    </c:choose>

  </ul>
</div>
<!-- pagination end -->
