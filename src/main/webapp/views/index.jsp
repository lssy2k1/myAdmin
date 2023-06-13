<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
  #scroll-btn {
    opacity: 0;
    width: 50px;
    height: 50px;
    color: #fff;
    background-color: cornflowerblue;
    position: fixed;
    bottom: 12%;
    right: 5%;
    border: 2px solid #fff;
    border-radius: 50%;
    font: 2px monospace;
    transition: opacity 2s, transform 2s;
  }

  #scroll-btn.show {
    opacity: 1;
    transition: opacity 5s, transform 5s;
  }
  #scroll-btn2 {
    opacity: 0;
    width: 50px;
    height: 50px;
    color: #fff;
    background-color: cornflowerblue;
    position: fixed;
    bottom: 5%;
    right: 5%;
    border: 2px solid #fff;
    border-radius: 50%;
    font: bold 10px monospace;
    transition: opacity 2s, transform 2s;
  }

  #scroll-btn2.show {
    opacity: 1;
    transition: opacity 5s, transform 5s;
  }

  #scroll-btn3 {
    opacity: 0;
    width: 50px;
    height: 50px;
    color: #fff;
    background-color: cornflowerblue;
    position: fixed;
    bottom: 19%;
    right: 5%;
    border: 2px solid #fff;
    border-radius: 50%;
    font: bold 10px monospace;
    transition: opacity 2s, transform 2s;
  }
  #scroll-btn3.show {
    opacity: 1;
    transition: opacity 5s, transform 5s;
  }
</style>



<html lang="en">


<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Skydash Admin</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="/vendors/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="/vendors/feather/feather.css">
  <link rel="stylesheet" href="/vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" href="/vendors/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- Plugin css for this page -->
  <link rel="stylesheet" href="/vendors/datatables.net-bs4/dataTables.bootstrap4.css">
  <link rel="stylesheet" href="/vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" type="text/css" href="/js/select.dataTables.min.css">
  <link rel="stylesheet" href="/vendors/font-awesome/css/font-awesome.min.css">
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="/css/vertical-layout-light/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="/images/favicon.png" />
  <script
          src="https://code.jquery.com/jquery-3.7.0.js"
          integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
          crossorigin="anonymous"></script>
  <script src="/js/makeKakaoMap.js"></script>
  <script src="/js/makeKakaoMap2.js"></script>
  <script src="/js/makeKakaoMap3.js"></script>
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d005c7797282324dfcb26cf31188fc01"></script>
  <script src="/webjars/sockjs-client/sockjs.min.js"></script>
  <script src="/webjars/stomp-websocket/stomp.min.js"></script>
  <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>

  <script>
    let chatbtn = {
      init:function(){
        const chatbotbox = $('#chatbot_box');
        const oneononebox = $('#oneonone_box');
        const toallbox = $('#toall_box');

        const scrollBtn = document.createElement("button");
        scrollBtn.innerHTML = "chatbot";
        scrollBtn.setAttribute("id", "scroll-btn");
        document.body.appendChild(scrollBtn);
        scrollBtn.classList.add("show");
        scrollBtn.addEventListener("click", function(){
          chatbotbox.toggle();
        });
        const scrollBtn2 = document.createElement("button");
        scrollBtn2.innerHTML = "1:1";
        scrollBtn2.setAttribute("id", "scroll-btn2");
        document.body.appendChild(scrollBtn2);
        scrollBtn2.classList.add("show");
        scrollBtn2.addEventListener("click", function(){
          oneononebox.toggle();
        });

        const scrollBtn3 = document.createElement("button");
        scrollBtn3.innerHTML = "공지";
        scrollBtn3.setAttribute("id", "scroll-btn3");
        document.body.appendChild(scrollBtn3);
        scrollBtn3.classList.add("show");
        scrollBtn3.addEventListener("click", function(){
          toallbox.toggle();
        });
      }
    };

    $(function(){
      chatbtn.init();
    });
  </script>
</head>
<body>

  <div class="container-scroller">
    <!-- partial:partials/_navbar.html -->
    <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
      <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
        <a class="navbar-brand brand-logo mr-2" href="/"><img src="/images/logo.png" class="mr-2" alt="logo"/></a>
        <a class="navbar-brand brand-logo-mini" href="/"><img src="/images/logo_s.png" alt="logo"/></a>
      </div>
      <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
        <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
          <span class="icon-menu"></span>
        </button>
        <ul class="navbar-nav mr-lg-2">
          <li class="nav-item nav-search d-none d-lg-block">
            <div class="input-group">
              <div class="input-group-prepend hover-cursor" id="navbar-search-icon">
                <span class="input-group-text" id="search">
                  <i class="icon-search"></i>
                </span>
              </div>
              <input type="text" class="form-control" id="navbar-search-input" placeholder="Search now" aria-label="search" aria-describedby="search">
            </div>
          </li>
        </ul>
        <ul class="navbar-nav navbar-nav-right">
          <li class="nav-item dropdown">
            <a class="nav-link count-indicator dropdown-toggle" id="notificationDropdown" href="#" data-toggle="dropdown">
              <i class="icon-bell mx-0"></i>
              <span class="count"></span>
            </a>
            <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list" aria-labelledby="notificationDropdown">
              <p class="mb-0 font-weight-normal float-left dropdown-header">Notifications</p>
              <a class="dropdown-item preview-item">
                <div class="preview-thumbnail">
                  <div class="preview-icon bg-success">
                    <i class="ti-info-alt mx-0"></i>
                  </div>
                </div>
                <div class="preview-item-content">
                  <h6 class="preview-subject font-weight-normal">Application Error</h6>
                  <p class="font-weight-light small-text mb-0 text-muted">
                    Just now
                  </p>
                </div>
              </a>
              <a class="dropdown-item preview-item">
                <div class="preview-thumbnail">
                  <div class="preview-icon bg-warning">
                    <i class="ti-settings mx-0"></i>
                  </div>
                </div>
                <div class="preview-item-content">
                  <h6 class="preview-subject font-weight-normal">Settings</h6>
                  <p class="font-weight-light small-text mb-0 text-muted">
                    Private message
                  </p>
                </div>
              </a>
              <a class="dropdown-item preview-item">
                <div class="preview-thumbnail">
                  <div class="preview-icon bg-info">
                    <i class="ti-user mx-0"></i>
                  </div>
                </div>
                <div class="preview-item-content">
                  <h6 class="preview-subject font-weight-normal">New user registration</h6>
                  <p class="font-weight-light small-text mb-0 text-muted">
                    2 days ago
                  </p>
                </div>
              </a>
            </div>
          </li>

          <c:choose>
            <c:when test="${loginadm == null}">
              <li class="nav-item nav-profile dropdown">
                <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" id="profileDropdown">
                  <img src="/images/adm.png" alt="profile"/>
                </a>
                <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown">
                  <a class="dropdown-item" href="/register">
                    <i class="ti-plus text-primary"></i>
                    Register
                  </a>
                  <a class="dropdown-item" href="/logins">
                    <i class="ti-power-off text-primary"></i>
                    Login
                  </a>
                </div>
            </c:when>
            <c:otherwise>
              <li class="nav-item nav-profile dropdown">
                <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" id="profileDropdown">
                  <img src="/images/loginprofile.png" alt="profile"/>
                </a>
                <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown">
                  <a class="dropdown-item" href="/adm/detail?id=${loginadm.id}">
                    <i class="ti-face-smile text-primary"></i>
                    Profile
                  </a>
                  <a class="dropdown-item" href="/logouts">
                    <i class="ti-power-off text-primary"></i>
                    Logout
                  </a>
                </div>
            </c:otherwise>
          </c:choose>

          <li class="nav-item nav-settings d-none d-lg-flex">
            <a class="nav-link" href="#">
              <i class="icon-ellipsis" style="margin-top: 5px"></i>
            </a>
          </li>
        </ul>
        <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
          <span class="icon-menu"></span>
        </button>
      </div>
    </nav>
    <!-- partial -->

    <div class="container-fluid page-body-wrapper">
      <!-- partial:partials/_settings-panel.html -->
      <div class="theme-setting-wrapper">
        <div id="settings-trigger"><i class="ti-settings"></i></div>
        <div id="theme-settings" class="settings-panel">
          <i class="settings-close ti-close"></i>
          <p class="settings-heading">SIDEBAR SKINS</p>
          <div class="sidebar-bg-options selected" id="sidebar-light-theme"><div class="img-ss rounded-circle bg-light border mr-3"></div>Light</div>
          <div class="sidebar-bg-options" id="sidebar-dark-theme"><div class="img-ss rounded-circle bg-dark border mr-3"></div>Dark</div>
          <p class="settings-heading mt-2">HEADER SKINS</p>
          <div class="color-tiles mx-0 px-4">
            <div class="tiles success"></div>
            <div class="tiles warning"></div>
            <div class="tiles danger"></div>
            <div class="tiles info"></div>
            <div class="tiles dark"></div>
            <div class="tiles default"></div>
          </div>
        </div>
      </div>


<%-------------------------------------------------------------------------------------%>
      <jsp:include page="right.jsp"/>
<%-------------------------------------------------------------------------------------%>



      <!-- partial -->
      <c:choose>
        <c:when test="${left==null}">
          <jsp:include page ="left.jsp"/>
        </c:when>
        <c:otherwise>
          <jsp:include page = "${left}.jsp"/>
        </c:otherwise>
      </c:choose>

      <!-- partial -->

      <div class="main-panel">
        <c:choose>
          <c:when test="${center==null}">
            <jsp:include page ="center.jsp"/>
          </c:when>
          <c:otherwise>
            <jsp:include page = "${center}.jsp"/>
          </c:otherwise>
        </c:choose>

        <jsp:include page="oneonone.jsp"/>
        <jsp:include page="chatbot.jsp"/>
        <jsp:include page="toall.jsp"/>


        <!-- partial:partials/_footer.html -->
        <footer class="footer">
          <div class="d-sm-flex justify-content-center justify-content-sm-between">
            <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright © 2021.  Premium <a href="https://www.bootstrapdash.com/" target="_blank">Bootstrap admin template</a> from BootstrapDash. All rights reserved.</span>
            <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Hand-crafted & made with <i class="ti-heart text-danger ml-1"></i></span>
          </div>
          <div class="d-sm-flex justify-content-center justify-content-sm-between">
            <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Distributed by <a href="https://www.themewagon.com/" target="_blank">Themewagon</a></span> 
          </div>
        </footer> 
        <!-- partial -->
      </div>

      <!-- main-panel ends -->
    </div>   
    <!-- page-body-wrapper ends -->

  </div>
  <!-- container-scroller -->

  <!-- plugins:js -->
  <script src="/vendors/js/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page -->
  <script src="/vendors/chart.js/Chart.min.js"></script>
  <script src="/vendors/datatables.net/jquery.dataTables.js"></script>
  <script src="/vendors/datatables.net-bs4/dataTables.bootstrap4.js"></script>
  <script src="/js/dataTables.select.min.js"></script>
  <script src="/js/filename.js"></script>

  <!-- End plugin js for this page -->
  <!-- inject:js -->
  <script src="/js/off-canvas.js"></script>
  <script src="/js/hoverable-collapse.js"></script>
  <script src="/js/template.js"></script>
  <script src="/js/settings.js"></script>
  <script src="/js/todolist.js"></script>
  <!-- endinject -->
  <!-- Custom js for this page-->
  <script src="/js/dashboard.js"></script>
  <script src="/js/Chart.roundedBarCharts.js"></script>
  <script src="/js/tabs.js"></script>
  <!-- End custom js for this page-->

</body>

</html>

