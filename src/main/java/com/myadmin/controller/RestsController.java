package com.myadmin.controller;

import com.myadmin.dto.Mrk;
import com.myadmin.service.MrkService;
import com.myadmin.util.GetDateUtil;
import com.myadmin.util.GptUtil;
import com.myadmin.util.WeatherUtil;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class RestsController {

    @Autowired
    MrkService mrkService;

    @RequestMapping("/giveid")
    public String giveid(Model model){
        String result = "";
        try {
            result = GptUtil.getResult("5-10글자 영문, 숫자 아이디를 하나만 만들려고 해. 추천해줘. " +
                    "답변은 글자만 출력해줘. 특수문자는 출력하지마. " +
                    "만약 같은 질문을 보내도 답변만 해");
        } catch(Exception e){
            result = "천천히 누르세요......";
        }
        return result;
    }

    @RequestMapping("/givemrk")
    public JSONArray givemrk(Model model) throws Exception {
        JSONArray result = new JSONArray();
        try {
            List<Mrk> list = mrkService.get();
            for(Mrk obj : list){
                JSONObject mrk = new JSONObject();
                mrk.put("content", "<div>" +obj.getTitle() +"</div>");
                JSONObject latlng = new JSONObject();
                latlng.put("lat", obj.getLat());
                latlng.put("lng", obj.getLng());
                mrk.put("latlng", latlng);
                result.add(mrk);
            }
        } catch (Exception e) {
            throw new Exception("restcontroller marker error");
        }
        return result;
    }
//             [{ content: '<div>카카오</div>',
//                latlng: new kakao.maps.LatLng(33.450705, 126.570677) }];

    @RequestMapping("/giveweather")
    public Map<String, String> giveweather() throws Exception {
        Map<String, String> map = new HashMap<>();
        try {
            String weather = WeatherUtil.getWeather();
            map = WeatherUtil.getData(weather);
        } catch (Exception e) {
            throw new Exception("weather restcontroller error");
        }
        return map;
    };

    @RequestMapping("/getdate")
    public String getdate() throws Exception {
        String result = "";
        result = GetDateUtil.getDate();
        return result;
    };


}
