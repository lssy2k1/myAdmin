package com.myadmin.util;

import com.google.api.client.extensions.java6.auth.oauth2.AuthorizationCodeInstalledApp;
import com.google.api.client.extensions.jetty.auth.oauth2.LocalServerReceiver;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeFlow;
import com.google.api.client.googleapis.auth.oauth2.GoogleClientSecrets;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.googleapis.json.GoogleJsonResponseException;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.client.util.DateTime;
import com.google.api.client.util.store.FileDataStoreFactory;
import com.google.api.services.calendar.Calendar;
import com.google.api.services.calendar.CalendarScopes;
import com.google.api.services.calendar.model.Event;
import com.google.api.client.auth.oauth2.Credential;
import com.google.api.services.calendar.model.EventAttendee;
import com.google.api.services.calendar.model.EventDateTime;
import com.google.api.services.calendar.model.EventReminder;
import com.myadmin.dto.CalEvent;
import lombok.extern.slf4j.Slf4j;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.security.GeneralSecurityException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;


@Slf4j
public class GoogleCalendar {



    private static final String APPLICATION_NAME = "Google Calendar API Java Quickstart";

    private static final JsonFactory JSON_FACTORY = JacksonFactory.getDefaultInstance();

    private static final String CREDENTIALS_FOLDER = "credentials"; // Directory to store user credentials.

    private static final String CALENDAR_ID = "digicamjava@gmail.com";



    /**

     * Global instance of the scopes required by this quickstart.

     * If modifying these scopes, delete your previously saved credentials/ folder.

     */

    private static final List<String> SCOPES = Collections.singletonList(CalendarScopes.CALENDAR);

    private static final String CLIENT_SECRET_DIR = "/client_secret.json";




/////////////////////////////////add event

    public static Event addEvent(Event event) throws IOException, GeneralSecurityException, GoogleJsonResponseException {

        final NetHttpTransport HTTP_TRANSPORT = GoogleNetHttpTransport.newTrustedTransport();

        Calendar service = new Calendar.Builder(HTTP_TRANSPORT, JSON_FACTORY, getCredentials(HTTP_TRANSPORT))

                .setApplicationName(APPLICATION_NAME)

                .build();

        return service.events().insert(CALENDAR_ID, event).execute();

    }


/////////////////////////////////del event

    public static void delEvent(String eventKey) throws IOException, GeneralSecurityException, GoogleJsonResponseException {

        final NetHttpTransport HTTP_TRANSPORT = GoogleNetHttpTransport.newTrustedTransport();

        Calendar service = new Calendar.Builder(HTTP_TRANSPORT, JSON_FACTORY, getCredentials(HTTP_TRANSPORT))

                .setApplicationName(APPLICATION_NAME)

                .build();

        service.events().delete(CALENDAR_ID, eventKey).execute();

    }



    /**

     * Creates an authorized Credential object.

     * @param HTTP_TRANSPORT The network HTTP Transport.

     * @return An authorized Credential object.

     * @throws IOException If there is no client_secret.

     */

    private static Credential getCredentials(final NetHttpTransport HTTP_TRANSPORT) throws IOException {

        // Load client secrets.

        InputStream in = GoogleCalendar.class.getResourceAsStream(CLIENT_SECRET_DIR);

        GoogleClientSecrets clientSecrets = GoogleClientSecrets.load(JSON_FACTORY, new InputStreamReader(in));



        // Build flow and trigger user authorization request.

        GoogleAuthorizationCodeFlow flow = new GoogleAuthorizationCodeFlow.Builder(

                HTTP_TRANSPORT, JSON_FACTORY, clientSecrets, SCOPES)

                .setDataStoreFactory(new FileDataStoreFactory(new java.io.File(CREDENTIALS_FOLDER)))

                .setAccessType("offline")

                .build();

        return new AuthorizationCodeInstalledApp(flow, new LocalServerReceiver()).authorize("user");

    }

    public Event makeEvent(CalEvent calEvent) throws IOException, GeneralSecurityException {

        //요약, 내용 설정
        Event event = new Event()

                .setSummary(calEvent.getTitle())

                .setDescription(calEvent.getContents());


        //시작날짜 설정
        DateTime startDateTime = new DateTime(calEvent.getStart());

        EventDateTime start = new EventDateTime()

                .setDateTime(startDateTime)

                .setTimeZone("Asia/Seoul");

        event.setStart(start);


        //종료날짜 설정
        DateTime endDateTime = new DateTime(calEvent.getEnd());

        EventDateTime end = new EventDateTime()

                .setDateTime(endDateTime)

                .setTimeZone("Asia/Seoul");

        event.setEnd(end);


        return event;

    }


}