package com.myadmin.controller;

import com.google.api.client.json.Json;
import com.google.api.services.calendar.model.Event;
import com.myadmin.dto.*;
import com.myadmin.service.*;
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
    LecService lecService;

    @Autowired
    MrkService mrkService;

    @Autowired
    AdmService admService;

    @Autowired
    LecCategoryService lecCategoryService;

    @Autowired
    SbjDetailService sbjDetailService;

    @Autowired
    OrdService ordService;

    @Autowired
    StdnService stdnService;

    @RequestMapping("/piechartdata")
    public JSONObject piechartdata(Model model) throws Exception {
        JSONObject jo = new JSONObject();
        JSONArray sbjname = new JSONArray();
        JSONArray sbjcount = new JSONArray();
        try {
            List<Stdn> topsbj = stdnService.topsbj();
            for (Stdn obj : topsbj){
                sbjcount.add(obj.getCount());
                sbjname.add(obj.getSbj());
            }
        } catch (Exception e) {
            throw new Exception("piechartdata error");
        }
        jo.put("sbjname", sbjname);
        jo.put("sbjcount",sbjcount);
        log.info(jo.toString()+"============================================================");
        return jo;
    }

    @RequestMapping("/getrecentlec")
    public List<Lec> getrecentlec(Model model){
        List<Lec> recentlec = lecService.recentlec();
        return recentlec;
    }

    @RequestMapping("/getordchart")
    public JSONObject getordchart(Model model) throws Exception {
        JSONObject jo = new JSONObject();
        try {
            Ord mostlec = ordService.mostlec();
            Ord moststdn = ordService.moststdn();
            Ord gettoday = ordService.gettoday();
            jo.put("mostlec", mostlec);
            jo.put("moststdn", moststdn);
            jo.put("gettoday", gettoday);
        } catch (Exception e) {
            throw new Exception("getordchart Error");
        }
        return jo;
    }

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

    @RequestMapping("/checkid")
    public Object checkid(String id) throws Exception {
        int result = 0;//중복 아니면 0 보낸다고 가정
        Adm adm = null;
        adm = admService.get(id);
        if(adm != null){
            result = 1;
        }
        return result;
    }
    @RequestMapping("/getcurritable")
    public List<Lec> getcurritable() throws Exception {
        List<Lec> hotlec = lecService.hotlec();
        return hotlec;
    };

    @RequestMapping("/gethittable")
    public List<Lec> gethittable() throws Exception {
        List<Lec> hotlec = lecService.hotlechit();
        return hotlec;
    };

    @RequestMapping("/getratingtable")
    public List<Lec> getratingtable() throws Exception {
        List<Lec> hotlec = lecService.hotlecrating();
        return hotlec;
    };

}
