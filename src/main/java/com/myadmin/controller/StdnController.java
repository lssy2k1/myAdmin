package com.myadmin.controller;

import com.github.pagehelper.PageInfo;
import com.myadmin.dto.*;
import com.myadmin.service.*;
import com.myadmin.util.GetTimeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/stdn")
public class StdnController {

    @Autowired
    StdnService stdnService;
    @Autowired
    MyPageService myPageService;
    @Autowired
    AttdService attdService;
    @Autowired
    AttdTrckrService attdTrckrService;
    @Autowired
    TestTrckrService testTrckrService;
    @Autowired
    StdyTrckrService stdyTrckrService;
    @Autowired
    AttdAllService attdAllService;
    @Autowired
    CpnService cpnService;
    @Autowired
    BCryptPasswordEncoder encoder;

    String dir = "stdn/";

    @RequestMapping("/all")
    public String all(Model model, @RequestParam(required = false, defaultValue = "1") int pageNo) throws Exception{
        Date date = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd");
        String currentDate = dateFormat.format(date);
        PageInfo<Stdn> p;
        try {
            p = new PageInfo<>(stdnService.getPage(pageNo), 5);
        } catch (Exception e) {
            throw new Exception("시스템 장애: ER0001");
        }
        model.addAttribute("target","stdn");
        model.addAttribute("function", "all");
        model.addAttribute("currentDate", currentDate);
        model.addAttribute("cpage", p);
        model.addAttribute("center",dir+"all");
        return "index";
    }

    @RequestMapping("/search")
    public String search(Model model, StdnSearch search, @RequestParam(required = false, defaultValue = "1") int pageNo) throws Exception {
        PageInfo<Stdn> p = new PageInfo<>(stdnService.searchpage(pageNo, search), 5);
        model.addAttribute("value1",search.getSearch1());
        model.addAttribute("value2",search.getSearch2());
        model.addAttribute("target","stdn");
        model.addAttribute("function","search");
        model.addAttribute("cpage",p);
        model.addAttribute("center",dir+"all");
        model.addAttribute("pagination", "searchpage");
        model.addAttribute("search", search);
        return "index";
    }

    @RequestMapping("/approve")
    public String approve(@RequestParam(required = false, defaultValue = "1") int pageNo, Model model) throws Exception{
        PageInfo<Stdn> p;
        try {
            p = new PageInfo<>(stdnService.approve("0", pageNo), 5);
        } catch (Exception e) {
            throw new Exception("시스템 장애: ER0001");
        }
        model.addAttribute("target","stdn");
        model.addAttribute("function","approve");
        model.addAttribute("cpage", p);
        model.addAttribute("center",dir+"approve");
        return "index";
    }

    @RequestMapping("/approvesearch")
    public String approvesearch(Model model, StdnSearch search, @RequestParam(required = false, defaultValue = "1") int pageNo) throws Exception {
        PageInfo<Stdn> p = new PageInfo<>(stdnService.approvesearch("0", pageNo, search), 5);
        model.addAttribute("value1", search.getSearch1());
        model.addAttribute("value2", search.getSearch2());
        model.addAttribute("target","stdn");
        model.addAttribute("function","approvesearch");
        model.addAttribute("cpage",p);
        model.addAttribute("center",dir+"approve");
        model.addAttribute("pagination", "searchpage");
        model.addAttribute("search", search);
        return "index";
    }

    @RequestMapping("/approveimpl")
    public String approveimpl(Model model, String id) throws Exception {
        Stdn stdn = stdnService.get(id);
        stdnService.joinupdate(id);
        Cpn cpn = new Cpn(1020, id, "2023.12.31");
        cpnService.register(cpn);
        return "redirect:/stdn/approve";
    }

    @RequestMapping("/approveallimpl")
    public String approveallimpl(Model model) throws Exception {
        List<Stdn> totalList = stdnService.get();
        for (Stdn s:totalList) {
            if (s.getIsJoin().equals("0")) {
                stdnService.joinupdate(s.getId());
                Cpn cpn = new Cpn(1020, s.getId(), "2023.12.31");
                cpnService.register(cpn);
            }
        }
        return "redirect:/stdn/approve";
    }

    @RequestMapping("/absent")
    public String absent(@RequestParam(required = false, defaultValue = "1") int pageNo, Model model) throws Exception{
        Date date = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd");
        String currentDate = dateFormat.format(date);
        PageInfo<Stdn> p;
        try {
            p = new PageInfo<>(stdnService.absent(pageNo), 5);
        } catch (Exception e) {
            throw new Exception("시스템 장애: ER0001");
        }
        model.addAttribute("target","stdn");
        model.addAttribute("function", "absent");
        model.addAttribute("currentDate", currentDate);
        model.addAttribute("cpage", p);
        model.addAttribute("center",dir+"absent");
        return "index";
    }

    @RequestMapping("/attd")
    public String attdall(@RequestParam(required = false, defaultValue = "1") int pageNo, Model model) throws Exception{
        PageInfo<AttdAll> p;
        try {
            p = new PageInfo<>(attdAllService.attdall(pageNo), 10);
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("시스템 장애: ER0001");
        }
        model.addAttribute("target","stdn");
        model.addAttribute("function", "attd");
        model.addAttribute("cpage", p);
        model.addAttribute("center",dir+"attd");
        return "index";
    }

    @RequestMapping("/add")
    public String add(Model model, String id, HttpSession session){
        model.addAttribute("center", dir+"add");
        return "index";
    }

    @RequestMapping("/addimpl")
    public String addimpl(Model model, @Validated Stdn stdn, Errors errors) throws Exception {
        if(errors.hasErrors()){
            List<ObjectError> es = errors.getAllErrors();
            String msg = "";
            for(ObjectError e: es){
                msg += "<h4>";
                msg += e.getDefaultMessage();
                msg += "</h4>";
            }
            throw new Exception(msg);
        }
        stdn.setPwd(encoder.encode(stdn.getPwd()));
        stdnService.register(stdn);
        return "redirect:/stdn/all";
    }

    @RequestMapping("/detail")
    public String detail(Model model, String id) throws Exception {
        Date date = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd");
        String currentDate = dateFormat.format(date);
        try {
            Stdn stdn = stdnService.get(id);
            MyPage myPage = myPageService.get(id);
            Attd attd = attdService.selectall(id);
            if(!attd.getRdate().equals(currentDate)) {
                attd = null;
            }

            ArrayList<AttdTrckr> data2 = new ArrayList<>();
            ArrayList<AttdTrckr> data3 = new ArrayList<>();
            ArrayList<AttdTrckr> data4 = new ArrayList<>();
            ArrayList<AttdTrckr> data5 = new ArrayList<>();
            ArrayList<AttdTrckr> data6 = new ArrayList<>();
            ArrayList<AttdTrckr> data7 = new ArrayList<>();

            List<AttdTrckr> attdList = attdTrckrService.trckattd(id);
            for (AttdTrckr a:attdList) {
                if (a.getMonth().equals("02")) {
                    data2.add(a);
                } if (a.getMonth().equals("03")) {
                    data3.add(a);
                } if (a.getMonth().equals("04")) {
                    data4.add(a);
                } if (a.getMonth().equals("05")) {
                    data5.add(a);
                } if (a.getMonth().equals("06")) {
                    data6.add(a);
                } if (a.getMonth().equals("07")) {
                    data7.add(a);
                }
            }

            ArrayList<TestTrckr> test2 = new ArrayList<>();
            ArrayList<TestTrckr> test3 = new ArrayList<>();
            ArrayList<TestTrckr> test4 = new ArrayList<>();
            ArrayList<TestTrckr> test5 = new ArrayList<>();
            ArrayList<TestTrckr> test6 = new ArrayList<>();
            ArrayList<TestTrckr> test7 = new ArrayList<>();

            List<TestTrckr> testList = testTrckrService.trcktest(id);
            int testCnt = testList.size();
            for (TestTrckr t:testList) {
                if (t.getMonth().equals("02")) {
                    test2.add(t);
                } if (t.getMonth().equals("03")) {
                    test3.add(t);
                } if (t.getMonth().equals("04")) {
                    test4.add(t);
                } if (t.getMonth().equals("05")) {
                    test5.add(t);
                } if (t.getMonth().equals("06")) {
                    test6.add(t);
                } if (t.getMonth().equals("07")) {
                    test7.add(t);
                }
            }

            ArrayList<StdyTrckr> stdy2 = new ArrayList<>();
            ArrayList<StdyTrckr> stdy3 = new ArrayList<>();
            ArrayList<StdyTrckr> stdy4 = new ArrayList<>();
            ArrayList<StdyTrckr> stdy5 = new ArrayList<>();
            ArrayList<StdyTrckr> stdy6 = new ArrayList<>();
            ArrayList<StdyTrckr> stdy7 = new ArrayList<>();
            int totalTime = 0;
            List<Integer> timeList = new ArrayList<>();

            List<StdyTrckr> stdyList = stdyTrckrService.trckstdy(id);
            GetTimeUtil getTimeUtil = new GetTimeUtil();

            for (StdyTrckr s:stdyList) {
                String startTime = s.getStartTime();
                String endTime = s.getEndTime();
                if ((s.getStartTime() != null) && (s.getEndTime() != null)) {
                    String timeDiff = GetTimeUtil.getTime(startTime, endTime);
                    int parsedTimeDiff = Integer.parseInt(timeDiff.substring(0, timeDiff.length() - 1));
                    s.setTime(timeDiff);
                    totalTime += parsedTimeDiff;

                    if (s.getMonth().equals("02")) {
                        stdy2.add(s);
                    } if (s.getMonth().equals("03")) {
                        stdy3.add(s);
                    } if (s.getMonth().equals("04")) {
                        stdy4.add(s);
                    } if (s.getMonth().equals("05")) {
                        stdy5.add(s);
                    } if (s.getMonth().equals("06")) {
                        stdy6.add(s);
                    } if (s.getMonth().equals("07")) {
                        stdy7.add(s);
                    }
                } else {
                    continue;
                }
            }
            int totalH = totalTime / 60;
            int totalM = totalTime % 60;
            timeList.add(totalH);
            timeList.add(totalM);
            timeList.add(totalTime);

            model.addAttribute("stdn", stdn);
            model.addAttribute("mypage", myPage);
            model.addAttribute("attd", attd);
            model.addAttribute("data1",data2);
            model.addAttribute("data2",data3);
            model.addAttribute("data3",data4);
            model.addAttribute("data4",data5);
            model.addAttribute("data5",data6);
            model.addAttribute("data6",data7);
            model.addAttribute("test1", test2);
            model.addAttribute("test2", test3);
            model.addAttribute("test3", test4);
            model.addAttribute("test4", test5);
            model.addAttribute("test5", test6);
            model.addAttribute("test6", test7);
            model.addAttribute("testCnt", testCnt);
            model.addAttribute("stdy1", stdy2);
            model.addAttribute("stdy2", stdy3);
            model.addAttribute("stdy3", stdy4);
            model.addAttribute("stdy4", stdy5);
            model.addAttribute("stdy5", stdy6);
            model.addAttribute("stdy6", stdy7);
            model.addAttribute("totalTime", timeList);
            model.addAttribute("center", dir+"detail");
        } catch (Exception e) {
            throw new Exception("Student detail error");
        }
        return "index";
    }

    @RequestMapping("/update")
    public String update(Model model, String id, HttpSession session) throws Exception {
        Stdn stdn = stdnService.get(id);
        model.addAttribute("stdn", stdn);
        model.addAttribute("center", dir+"update");
        return "index";
    }
    @RequestMapping("/updateimpl")
    public String updateimpl(Model model, @Validated Stdn stdn, Errors errors) throws Exception {
        if(errors.hasErrors()){
            List<ObjectError> es = errors.getAllErrors();
            String msg = "";
            for(ObjectError e: es){
                msg += "<h4>";
                msg += e.getDefaultMessage();
                msg += "</h4>";
            }
            throw new Exception(msg);
        }
        try {
            stdn.setPwd(encoder.encode(stdn.getPwd()));
            stdnService.modify(stdn);
        } catch (Exception e) {
            throw new Exception("Student update error");
        }
        return "redirect:/stdn/detail?id="+stdn.getId();
    }
    @RequestMapping("/deleteimpl")
    public String deleteimpl(Model model, String id) throws Exception {
        try {
            stdnService.remove(id);
        } catch (Exception e) {
            throw new Exception("Student delete error");
        }
        return "redirect:/stdn/all";
    }
}
