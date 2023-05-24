package com.myadmin.util;

import lombok.extern.slf4j.Slf4j;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

//https://www.koreaexim.go.kr/ir/HPHKIR020M01?apino=2&viewtype=C&searchselect=&searchword=
@Slf4j
public class FxUtil {

    private static final String authkey = "Yeml9AohTSAbbXlygRb8h5e5MoamqIoW";
    private static final String BASE_URL = "https://www.koreaexim.go.kr/site/program/financial/exchangeJSON";
    private final HttpClient client;

//    client를 초기화하여 API를 요청할 준비를 한다.
    public FxUtil() {
        client = HttpClient.newBuilder().build();
    }

    public String getData(String searchdate){
        String result = "";

        //String url = "https://www.koreaexim.go.kr/site/program/financial/exchangeJSON
        // ?authkey=AUTHKEY1234567890
        // &searchdate=20180102
        // &data=AP01";
        try {
            HttpRequest request = HttpRequest.newBuilder()
                    .uri(URI.create(
                            BASE_URL
                            + "?authkey=" + authkey
                            + "&searchdate=" + searchdate
                            + "&data=" + "AP01"))
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
