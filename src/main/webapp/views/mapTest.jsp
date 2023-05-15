<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f15191dfbc91ce9a8cbdd265aeabcf7e"></script>
<script src="/js/makeKakaoMap.js"></script>
<script>
    $(()=>{
        makeKakaoMap.init();
    })
</script>
<style>
    #map{
        width: 500px;
        height: 500px;
        border: red 1px solid;
    }
</style>

<div class="content-wrapper">
    <div class="row">
        <div class="col-12 grid-margin stretch-card">
            <div id="map"></div>
            <p><em>지도를 클릭해주세요...</em></p>
            <p id="result"></p>
        </div>

    </div>
</div>
