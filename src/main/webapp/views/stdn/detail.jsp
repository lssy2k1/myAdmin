<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    let std_detail = {
        init:()=>{
            $('#std_update_btn').click(() =>{
                std_detail.send();
            });
            $('#std_delete_btn').click(()=>{
                let d = confirm("wanna delete?");
                if(d){
                    location.href = '/stdn/deleteimpl?id=${std.id}';
                }
            });
        },
        send:()=>{
            $('#std_detail_form').attr({
                action:'/stdn/updateimpl',
                method:'post',
            });
            $('#std_detail_form').submit();
        }
    };
    $(function(){
        if("${loginadm.lev}">=3){
            $('#pwd').removeAttr('readonly');
        };
        std_detail.init();
    });
</script>

<!-- partial -->

<div class="content-wrapper">
    <div class="row justify-content-center">
        <div>
                <c:choose>
                    <c:when test="${std.img==null || (std.img).equals('')}"><img id="item_img" src="/images/adm.png" alt="profile img" style="width:90px; height:90px; border-radius:50%; overflow: hidden; margin-bottom: 10px">
                    </c:when>
                    <c:when test="${std.img!=null || !(std.img).equals('')}"><img id="item_img" src="/uimg/${std.img}" alt="${obj.img}" style="width:90px; height:90px; border: 1px solid lightsteelblue;border-radius:50%; overflow: hidden; margin-bottom: 20px"/></c:when>
                </c:choose>
        </div>
        <div class="col-sm-6">
                <div class="card" style="margin: 0 10px">
                    <div class="card-body">
                        <h4 class="card-title">수강생 상세조회</h4>

                        <div class="table-responsive pt-3">
                            <table class="table table-bordered text-center">
                                <thead>
                                <tr>
                                    <th>
                                        Image
                                    </th>
                                    <th>
                                        ID
                                    </th>
                                    <th>
                                        Name
                                    </th>
                                    <th>
                                        Attendance
                                    </th>
                                    <th>
                                        Email
                                    </th>
                                    <th>
                                        Contact
                                    </th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="obj" items="${std}">
                                    <tr>
                                        <td>
                                            <a href="#" data-toggle="modal" data-target="#target${obj.id}">
                                                <c:choose>
                                                    <c:when test="${obj.img==null || (obj.img).equals('')}"><img id="item_img" src="/images/adm.png" alt="profile img" style="width:100px; height:100px">
                                                    </c:when>
                                                    <c:when test="${obj.img!=null || !(obj.img).equals('')}"><img id="item_img" src="/uimg/${obj.img}" alt="${obj.img}" style="width:100px; height:100px"/></c:when>
                                                </c:choose>
                                            </a>
                                        </td>
                                        <td><a href="/stdn/detail?id=${obj.id}">${obj.id}</a></td>
                                        <td>${obj.name}</td>
                                        <td>
                                            <div class="progress">
                                                <div class="progress-bar bg-success" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                        </td>
                                        <td>${obj.email}</td>
                                        <td>${obj.contact}</td>
                                    </tr>


                                    <!-- Modal -->
                                    <div id="target${obj.id}" class="modal fade" role="dialog">
                                        <div class="modal-dialog">

                                            <!-- Modal content-->
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title">${obj.name}</h4>
                                                </div>
                                                <div class="modal-body">
                                                    <img src="/uimg/${obj.img}" alt="${obj.img}" style="width:445px; height:445px" style="align-items: center"/>
                                                </div>
                                                <div class="modal-footer">
                                                    <a href="detail?id=${obj.id}" class="btn btn-primary" role="button">상세조회</a>
                                                    <a href="#" class="btn btn-outline-primary" role="button" data-dismiss="modal">닫기</a>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
        </div>
    </div>
</div>
<!-- content-wrapper ends -->
