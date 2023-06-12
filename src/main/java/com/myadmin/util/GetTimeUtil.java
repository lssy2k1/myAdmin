package com.myadmin.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class GetTimeUtil {
    public static String getTime(String timeStr1, String timeStr2) {
        String result = "";
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");

            Date date1 = dateFormat.parse(timeStr1);
            Date date2 = dateFormat.parse(timeStr2);

            long timeMil1 = date1.getTime();
            long timeMil2 = date2.getTime();

            long diff = timeMil2 - timeMil1;

            long diffMin = diff / (1000 * 60);

            result = diffMin + "분";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
}
