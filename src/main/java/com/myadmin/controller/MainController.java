package com.myadmin.controller;

import com.myadmin.dto.Adm;
import com.myadmin.dto.Lec;
import com.myadmin.dto.Stdn;
import com.myadmin.service.AdmService;
import com.myadmin.service.LecService;
import com.myadmin.service.MrkService;
import com.myadmin.service.StdnService;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

@Controller
public class MainController {

    @Autowired
    LecService lecService;
    @Autowired
    MrkService mrkService;
    @Autowired
    AdmService admService;
    @Autowired
    StdnService stdnService;
    @Autowired
    BCryptPasswordEncoder encoder;

    @Value("${adminserver}")
    String adminserver;

    @RequestMapping("/")
    public String main(Model model) throws Exception {
        List<Stdn> stdnList = new ArrayList<>();
        List<Stdn> totalList = stdnService.get();
        List<Lec> hotlec = lecService.hotlec();
        for (Stdn s:totalList) {
            if (s.getIsJoin().equals("0")) {
                stdnList.add(s);
            }
        }
        int cnt = stdnList.size();
        int total = totalList.size();
        double percent = (double)cnt/total*100;
        DecimalFormat decimalFormat = new DecimalFormat("#0.00");
        String formattedPercentage = decimalFormat.format(percent);
        model.addAttribute("stdnCnt", cnt);
        model.addAttribute("percent", formattedPercentage);
        model.addAttribute("hotlec", hotlec);
        return "index";
    }
    @RequestMapping("/logins")
    public String logins(Model model){
        model.addAttribute("center", "login");
        return "index";
    }

    @RequestMapping("/loginimpl")
    public String loginimpl(Model model, String id, String pwd, HttpSession session) throws Exception {
        Adm adm = null;
        String nextPage = "loginFail";
        List<Stdn> stdnList = new ArrayList<>();
        List<Stdn> totalList = stdnService.get();
        for (Stdn s:totalList) {
            if (s.getIsJoin().equals("0")) {
                stdnList.add(s);
            }
        }
        int cnt = stdnList.size();
        int total = totalList.size();
        double percent = (double)cnt/total*100;
        DecimalFormat decimalFormat = new DecimalFormat("#0.00");
        String formattedPercentage = decimalFormat.format(percent);
        try {
            adm = admService.get(id);
            if(adm != null && encoder.matches(pwd, adm.getPwd())){
                nextPage = "center";
            }
            session.setMaxInactiveInterval(60000);
            session.setAttribute("loginadm", adm);


        } catch (Exception e) {
            throw new Exception("adm login error");
        }
        model.addAttribute("center", nextPage);
        model.addAttribute("stdnCnt", cnt);
        model.addAttribute("percent", formattedPercentage);
        return "index";
    }

    @RequestMapping("logouts")
    public String logouts(Model model, HttpSession session){
        if (session != null){
            session.invalidate();
        }
        return "redirect:/";
    }
    @RequestMapping("/register")
    public String register(Model model){
        model.addAttribute("center", "register");
        return "index";
    }

    @RequestMapping("/toall")
    public String websocket(Model model){
        model.addAttribute("adminserver", adminserver);
        model.addAttribute("center", "toall");
        return "index";
    }
    @RequestMapping("/oneonone")
    public String oneonone(Model model){
        model.addAttribute("adminserver", adminserver);
        model.addAttribute("center", "oneonone");
        return "index";
    }
    @RequestMapping("/chatbot")
            public String chatbot(Model model){
        model.addAttribute("adminserver", adminserver);
        model.addAttribute("center", "chatbot");
        return "index";
    }
    @RequestMapping("/trypage")
    public String trypage(Model model) throws ParseException {
        model.addAttribute("center", "trypage");
        return "index";
    }

}
