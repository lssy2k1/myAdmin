<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    let anc_register = {
        init:()=>{
            $('#anc_register_btn').click(() =>{
                anc_register.send();
            });
            $('#anc_can_btn').click(()=>{
                location.href = '/anc/all';
            })
        },
        send:()=>{
            $('#anc_register_form').attr({
                action:'/anc/addimpl',
                method:'post',
                enctype:'multipart/form-data'
            });
            $('#anc_register_form').submit();
        }
    };
    $(function(){
        anc_register.init();
    });
</script>

<!-- partial -->

<div class="content-wrapper">
    <div class="row" style="justify-content: center">

        <div class="col-8 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Add Announcement</h4>
                    <p class="card-description">
                        Fill in the blanks below
                    </p>

                    <form id = "anc_register_form" class="forms-sample" name="anc_register_form" enctype="multipart/form-data" method="post">
                        <div class="form-group">
                            <label for="writer">Writer</label>
                            <input type="text" class="form-control" name = "writer" id="writer" value = "${loginadm.id}"} readonly>
                        </div>
                        <div class="form-group">
                            <label for="title">Title</label>
                            <input type="text" class="form-control" name = "title" id="title" placeholder="Input Title">
                        </div>
                        <div class="form-group">
                            <label for="contents">Contents</label>
                            <textarea class="form-control" id="contents" name="contents" rows="6"></textarea>
                        </div>

                        <div class="form-group">
                            <label>File upload</label>
                            <input type="file" name="filename" class="file-upload-default">
                            <div class="input-group col-xs-12" id="fileForm">
                                <input id="fileName" type="text" class="form-control file-upload-info" disabled placeholder="Upload Image">
                                <label for="chooseFile" class="input-group-prepend" style="height: 46px">
                                    <div class="file-upload-browse btn btn-outline-primary">Upload</div>
                                </label>
                                <input type="file" name="imgfile" id="chooseFile" hidden onchange="loadFile(this)">
                            </div>
                        </div>
                        <div style="float: right">
                            <button id = "anc_register_btn" type="button" class="btn btn-primary mr-2">Update</button>
                            <button id = "anc_can_btn" type="button" class="btn btn-outline-primary">Delete</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

    </div>
</div>
