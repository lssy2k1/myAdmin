let makeKakaoMap2 = {

    init:()=>{
        var mapContainer = document.getElementById('map'),
            mapOption = {
                center: new kakao.maps.LatLng(37.5446638, 127.05649931),
                level: 5
            };
        var map = new kakao.maps.Map(mapContainer, mapOption);

        // 데이터 넣어서 포문 돌릴 위치 ==================================================================
        // 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다
        var positions = [];

        makeKakaoMap2.getdata((positions)=> {
            for (var i = 0; i < positions.length; i ++) {
                var markerPosition = new kakao.maps.LatLng( positions[i].latlng.lat, positions[i].latlng.lng);

                // 마커를 생성합니다
                var marker = new kakao.maps.Marker({
                    map: map, // 마커를 표시할 지도
                    position: markerPosition // 마커의 위치
                });
                // 마커에 표시할 인포윈도우를 생성합니다
                var infowindow = new kakao.maps.InfoWindow({
                    content: positions[i].content // 인포윈도우에 표시할 내용
                });
                // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
                // 이벤트 리스너로는 클로저를 만들어 등록합니다
                // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
                kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
                kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
            }
        });

// 인포윈도우를 표시하는 클로저를 만드는 함수입니다
        function makeOverListener(map, marker, infowindow) {
            return function() {
                infowindow.open(map, marker);
            };
        }
// 인포윈도우를 닫는 클로저를 만드는 함수입니다
        function makeOutListener(infowindow) {
            return function() {
                infowindow.close();
            };
        }
    },
    getdata:(callback)=>{
        $.ajax({
            url:'/givemrk',
            success:(result)=>{
                callback(result);
            }
        })
    }
}
