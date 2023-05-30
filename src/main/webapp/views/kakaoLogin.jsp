<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>

</script>

<div class="content-wrapper">
  <div class="row">
    <div class="col-md-12 grid-margin" style = "display: flex; flex-direction: row;">



        <div class = "row">
          <div class="col-12 mb-4 mb-xl-0" style="display: flex; justify-content: space-between">
            <div class="card">
              <div class="card-body">
                <div class="wrap">
                  <div class="title">로그인</div>
                  <a class="kakao" href="https://kauth.kakao.com/oauth/authorize?client_id=efd00f1a0b5734f9fdffac85acc7657d&redirect_uri=http://localhost:8089/kakaoLogin&response_type=code">
                    <!-- REST_API키 및 REDIRECT_URI는 본인걸로 수정하세요 -->

                    <div class="kakao_i"></div>
                    <div class="kakao_txt">카카오톡으로 간편로그인 </div>
                  </a>
                </div>
              </div>
            </div>
          </div>
        </div>


<%--      테두리 태그--%>
    </div>
  </div>
</div>
