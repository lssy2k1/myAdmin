<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
  // let navermail = {
  //   init: () => {
  //     $('#navermail_send_btn').click(() => {
  //       let naveremail = $('#naveremail').val();
  //       let navertitle = $('#navertitle').val();
  //       let navercontents = $('#navercontents').val();
  //       $.ajax({
  //         url:'/sendEmail.do',
  //         data: {
  //           naveremail: naveremail
  //           , navertitle : navertitle
  //           , navercontents : navercontents
  //         }
  //       }).done( (res) => {
  //         alert(res);
  //         alert("mail sended")
  //       }).fail( (error) => {
  //         alert(error);
  //         alert("fail to send mail")
  //       })
  //     })
  //
  //   }
  // };
</script>


<div class="content-wrapper">
  <div class="row">
    <div class="col-md-12 grid-margin">

      <%-----------네이버 메일 폼 양식-----------------------------------------%>
      <div class="row">
        <div class="col-12 mb-4 mb-xl-0" style="display: flex; justify-content: space-between">
          <div class="card">
            <div class="card-body">
              <form id = "naver_mail_form" class="forms-sample">
                <div class="form-group">
                  <label for="naveremail">email</label>
                  <input type="email" class="form-control" name = "naveremail" id="naveremail" placeholder="input email">
                </div>
                <div class="form-group">
                  <label for="navertitle">Title</label>
                  <input type="text" class="form-control" name = "navertitle" id="navertitle" placeholder="input title">
                </div>
                <div class="form-group">
                  <label for="navercontents">Contents</label>
                  <textarea class="form-control" id="navercontents" name="navercontents" rows="6"></textarea>
                </div>
                <button id = "navermail_send_btn" type="button" class="btn btn-primary mr-2">Send</button>
                <button id = "navermail_can_btn" type="button" class="btn btn-outline-primary">Cancel</button>
              </form>
            </div>
          </div>
        </div>
      </div>


<%--        카카오페이--------------------------------%>
        <div class = "row">
          <div class="col-12 mb-4 mb-xl-0" style="display: flex; justify-content: space-between">
            <div class="card">
              <div class="card-body">
                <h4> kakaoPay api 이용하기 </h4>

                <form method="post" action="/kakaoPay">
                  <button style = "border : none; background : none"><img type = "submit" src = "uimg/kakaopay.png"></button>
                </form>
              </div>
            </div>
          </div>
        </div>

<%--alphavantage---------------------------------------------%>
        <div class = "row">
          <div class="col-12 mb-4 mb-xl-0" style="display: flex; justify-content: space-between">
            <div class="card">
              <div class="card-body">
                <table class="table table-borderless report-table">
                  <thead>
                    <th>time</th>
                    <th>open</th>
                    <th>high</th>
                    <th>low</th>
                    <th>close</th>
                    <th>volume</th>
                  </thead>
<%--                  <tbody>--%>
<%--                    <c:forEach var="obj" items="alpha">--%>
<%--                      <tr>--%>
<%--                        <td>${alpha.column0}</td>--%>
<%--                        <td>${alpha.column1}</td>--%>
<%--                        <td>${alpha.column2}</td>--%>
<%--                        <td>${alpha.column3}</td>--%>
<%--                        <td>${alpha.column4}</td>--%>
<%--                        <td>${alpha.column5}</td>--%>
<%--                      </tr>--%>
<%--                    </c:forEach>--%>
<%--                  </tbody>--%>
                </table>
              </div>
            </div>
          </div>
        </div>
<%--      테두리 태그--%>
    </div>
  </div>
</div>
