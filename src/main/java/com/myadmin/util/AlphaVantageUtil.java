package com.myadmin.util;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.Map;

//https://www.alphavantage.co/documentation/#daily
//csv로 오는데 다른 방법 없을까? 데이터 수신 후 String으로 대량 데이터 갖고 있기도 다루기도 어려움.
public class AlphaVantageUtil {

    public static String getData(String company){
        String result = "";
        String apiKey = "3NTG7W8HBY90H6MP";
        String csvUrl = "https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY_EXTENDED&symbol=" + company
                + "&interval=15min&slice=year1month1&apikey="+apiKey;

        try {
            // URL 생성
            URL url = new URL(csvUrl);
            // URL에서 데이터를 읽어오는 InputStream 생성
            InputStream inputStream = url.openStream();
            // UTF-8 인코딩을 사용하여 효율적으로 텍스트를 읽는 BufferedReader 생성
            BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream, StandardCharsets.UTF_8));
            // 한 줄씩 텍스트를 읽어옴
            String line;

            JSONArray jsonArray = new JSONArray(); // JSON 배열 생성

            while ((line = reader.readLine()) != null) {
                String[] row = line.split(",");

                JSONObject jsonObject = new JSONObject(); // JSON 객체 생성

                for (int i = 0; i < row.length; i++) {
                    jsonObject.put("column" + i, row[i]); // 각 열의 값을 JSON 객체에 추가
                }

                jsonArray.add(jsonObject); // JSON 객체를 JSON 배열에 추가
            }
            result = jsonArray.toString();
            reader.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    };

}
