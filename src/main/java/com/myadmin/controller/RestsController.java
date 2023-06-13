package com.myadmin.controller;

import com.google.api.services.calendar.model.Event;
import com.myadmin.dto.*;
import com.myadmin.service.LecCategoryService;
import com.myadmin.service.MrkService;
import com.myadmin.service.SbjDetailService;
import com.myadmin.util.*;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@RestController
public class RestsController {

    @Autowired
    MrkService mrkService;

    @Autowired
    LecCategoryService lecCategoryService;

    @Autowired
    SbjDetailService sbjDetailService;

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

    @RequestMapping("/leccodemaker")
    public Integer leccodemaker(LecCategory lecCategory){
        try {
            lecCategoryService.register(lecCategory);
            Integer lecCode = lecCategory.getLecCode();
            return lecCode;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @RequestMapping("/sbjcodemaker")
    public Integer sbjcodemaker(SbjDetail sbjDetail){
        try {
            sbjDetailService.register(sbjDetail);
            Integer sbjCode3 = sbjDetail.getSbjCode();
            return sbjCode3;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @RequestMapping("/calevent")
    public Event calevent(CalEvent calEvent) throws Exception {
        GoogleCalendar googleCalendar = new GoogleCalendar();
        log.info(calEvent.toString()+"==================================================");
        Event event = googleCalendar.makeEvent(calEvent);
        Event addEvent = GoogleCalendar.addEvent(event);
        return addEvent;
    };

}
