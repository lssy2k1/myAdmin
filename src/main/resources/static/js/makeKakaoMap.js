let makeKakaoMap = {

    createArea: null,
    map:null,//전역변수로 선언하고 함수 안에서 호출 시 makeKakaoMap.map으로 호출한다.
    position: null,
    markers:[],

    init:()=>{
        makeKakaoMap.drawMap();
        makeKakaoMap.getLatLng();
        makeKakaoMap.makeMarkers();
    },
    drawMap:()=>{
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div
            mapOption = {
                center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                level: 6 // 지도의 확대 레벨
            };
        makeKakaoMap.map = new kakao.maps.Map(mapContainer, mapOption);

        var mapTypeControl = new kakao.maps.MapTypeControl();
        makeKakaoMap.map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
        var zoomControl = new kakao.maps.ZoomControl();
        makeKakaoMap.map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

        var marker = new kakao.maps.Marker({
            // 지도 중심좌표에 마커를 생성합니다
            position: makeKakaoMap.map.getCenter()
        });
        // 지도에 마커를 표시합니다
        marker.setMap(makeKakaoMap.map);
        makeKakaoMap.markers.push(marker);
    },
    getLatLng:()=>{
        kakao.maps.event.addListener(makeKakaoMap.map, 'click', function(mouseEvent) {
            // 클릭한 위도, 경도 정보를 가져옵니다
            var latlng = mouseEvent.latLng;

            var message = 'lat : ' + latlng.getLat();
            message += ', lng : ' + latlng.getLng();

            var resultDiv = document.getElementById('result');
            resultDiv.innerHTML = message;
            makeKakaoMap.position = latlng;
            // makeKakaoMap.makeMarker();
            addMarker(new kakao.maps.LatLng(makeKakaoMap.position));

        });
    },
    makeMarker:()=>{
        // 마커가 표시될 위치는 클릭으로 생성
        var marker = new kakao.maps.Marker({
            position: makeKakaoMap.position
        });
        // 마커가 지도 위에 표시되도록 설정합니다
        marker.setMap(null);
        marker.setMap(makeKakaoMap.map);
        makeKakaoMap.markers.push(marker);

        // 아래 코드는 지도 위의 마커를 제거하는 코드입니다
        // marker.setMap(null);
    },
    makeMarkers:()=>{
        function addMarker(position) {
            // 마커를 생성합니다
            var marker = new kakao.maps.Marker({
                position: position
            });
            // 마커가 지도 위에 표시되도록 설정합니다
            marker.setMap(makeKakaoMap.map);
            // 생성된 마커를 배열에 추가합니다
            markers.push(marker);
        }
        // 배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
        function setMarkers(map) {
            for (var i = 0; i < markers.length; i++) {
                markers[i].setMap(makeKakaoMap.map);
            }
        }
    }

}