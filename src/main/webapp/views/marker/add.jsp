<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    let marker_register = {
        init:()=>{
            $('#marker_register_btn').click(() =>{
                marker_register.send();
            });
            $('#marker_can_btn').click(()=>{
                location.href = '/marker/all';
            })
        },
        send:()=>{
            $('#marker_register_form').attr({
                action:'/marker/addimpl',
                method:'post',
                enctype:'multipart/form-data'
            });
            $('#marker_register_form').submit();
        }
    };
    $(function(){
        marker_register.init();
    });
</script>

<!-- partial -->

<div class="content-wrapper">
    <div class="row">

        <div class="col-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Add Marker</h4>
                    <p class="card-description">
                        Add Marker
                    </p>

                    <form id = "marker_register_form" class="forms-sample">
                        <div class="form-group">
                            <label for="title">Title</label>
                            <input type="text" class="form-control" name = "title" id="title" placeholder="input title">
                        </div>
                        <div class="form-group">
                            <label for="detail">Detail</label>
                            <input type="text" class="form-control" name = "detail" id="detail" placeholder="input detail">
                        </div>
                        <div class="form-group">
                            <label for="star">Star</label>
                            <select class="form-control" id="star" name = "star" >
                                <option>5</option>
                                <option>4</option>
                                <option>3</option>
                                <option>2</option>
                                <option>1</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="lat">lat</label>
                            <input type="text" class="form-control" name = "lat" id="lat" placeholder="input lat">
                        </div>
                        <div class="form-group">
                            <label for="lng">lng</label>
                            <input type="text" class="form-control" name = "lng" id="lng" placeholder="input lng">
                        </div>

                        <div class="form-group">
                            <label>IMG upload</label><br/>
                            <input type="file" id = "imgfile" name="imgfile" class="btn btn-primary">
                        </div>

                        <button id = "marker_register_btn" type="button" class="btn btn-primary mr-2">Register</button>
                        <button id = "marker_can_btn" type="button" class="btn btn-light">Cancel</button>
                    </form>
                </div>
            </div>
        </div>

    </div>
</div>
<!-- content-wrapper ends -->
