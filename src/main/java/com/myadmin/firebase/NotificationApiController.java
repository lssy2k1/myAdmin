package com.myadmin.firebase;

import com.myadmin.dto.Adm;
import com.myadmin.dto.UserSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;

@Slf4j
@RestController
public class NotificationApiController {

    private final NotificationService notificationService;

    public NotificationApiController(NotificationService notificationService) {
        this.notificationService = notificationService;
    }

    //userid, token을 합쳐서 register할게
    @PostMapping("/register")
    public ResponseEntity register(@RequestBody String token, HttpSession httpSession) {
        // Check if the user is logged in
//        log.info("++++++++++++++++++++++++++++++"+ "regiter start");
        Boolean isLoggedIn = (Boolean) httpSession.getAttribute("isLoggedIn");
        if (isLoggedIn == null || !isLoggedIn) {
            // User is not logged in, skip registration
            return ResponseEntity.ok().build();
        }

        UserSession userSession = new UserSession();
        Adm adm = (Adm) httpSession.getAttribute("loginadm");
        userSession.setUserId(adm.getId());
        notificationService.register("adm_"+userSession.getUserId(), token);
//        log.info("++++++++++++++++++++++++++++++" + userSession.getUserId());
//        log.info("++++++++++++++++++++++++++++++" + token);

        return ResponseEntity.ok().build();
    }


    //아직 구현 안함. logoutimpl에 만들어야지
    @PostMapping("/logout")
    public ResponseEntity logout(UserSession userSession, HttpSession httpSession) {
        notificationService.deleteToken(userSession.getUserId());
//        httpSession.removeAttribute(USER_SESSION_KEY);
        httpSession.invalidate();
        return ResponseEntity.ok().build();
    }
}