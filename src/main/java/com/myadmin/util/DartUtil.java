package com.myadmin.util;

import lombok.extern.slf4j.Slf4j;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

//https://opendart.fss.or.kr/guide/main.do?apiGrpCd=DS001
@Slf4j
public class DartUtil {

    private static final String authkey = "b889b1e28c6bed501e3bf16a2c6dfa2a3d847a28";
    private static final String BASE_URL = "https://opendart.fss.or.kr/api/fnlttSinglAcnt.json";
    private final HttpClient client;

//    client를 초기화하여 API를 요청할 준비를 한다.
    public DartUtil() {
        client = HttpClient.newBuilder().build();
    }

    public String getData(String corp_code, String bsns_year, String reprt_code){
        String result = "";

//        String url = "https://opendart.fss.or.kr/api/fnlttSinglAcnt.json?crtfc_key=xxxxxx&corp_code=00126380&bsns_year=2018&reprt_code=11011";
        try {
            HttpRequest request = HttpRequest.newBuilder()
                    .uri(URI.create(
                            BASE_URL
                            + "?crtfc_key=" + authkey
                            + "&corp_code=" + corp_code
                            + "&bsns_year=" + bsns_year
                            + "&reprt_code=" + reprt_code))
                    .GET()
                    .build();
            System.out.println("못보냄");
            HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
            System.out.println("보냄");

            if (response.statusCode() == 200) {
                result = response.body();

                log.info("==============================");
                log.info(result);
                log.info("==============================");
            } else {
                System.out.println("API request failed. Response code: " + response.statusCode());
            }
        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
        }

        return result;
    }
}
