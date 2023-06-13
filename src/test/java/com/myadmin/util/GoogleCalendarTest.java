package com.myadmin.util;

import com.google.api.client.util.DateTime;
import com.google.api.services.calendar.model.Event;
import com.google.api.services.calendar.model.EventDateTime;
import com.myadmin.dto.CalEvent;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.Date;

@SpringBootTest
public class GoogleCalendarTest {

//    var resource = {
//            "summary": "Appointment",
//            "location": "Somewhere",
//            "start": {
//        "dateTime": "2011-12-16T10:00:00.000-07:00"
//    },
//            "end": {
//        "dateTime": "2011-12-16T10:25:00.000-07:00"
//    }
//};
//var request = gapi.client.calendar.events.insert({
//        'calendarId': 'primary',
//        'resource': resource
//        });
//        request.execute(function(resp) {
//        console.log(resp);
//        });

    @Test
    void GoogleCalendar() throws GeneralSecurityException, IOException {
        GoogleCalendar googleCalendar = new GoogleCalendar();
        //"2023-05-01T12:30:00"
        CalEvent calEvent = new CalEvent("title", "contents", "2023-06-03T12:30:00", "2023-06-04T12:30:00");
        Event event = googleCalendar.makeEvent(calEvent);
        GoogleCalendar.addEvent(event);
    }
}
