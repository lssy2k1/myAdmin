package com.myadmin.util;

import java.util.Calendar;

public class GetDateUtil {
    public static String getDate(){
        String result = "";
        Calendar calendar = Calendar.getInstance();
        int year = calendar.get(calendar.YEAR);
        int month = calendar.get(calendar.MONTH) + 1;
        int day = calendar.get(calendar.DAY_OF_MONTH);
        int dayOfWeek = calendar.get(calendar.DAY_OF_WEEK);
        String dow_formatted = "";
        switch(dayOfWeek){
            case 1:
                dow_formatted = "일";
                break;
            case 2:
                dow_formatted = "월";
                break;
            case 3:
                dow_formatted = "화";
                break;
            case 4:
                dow_formatted = "수";
                break;
            case 5:
                dow_formatted = "목";
                break;
            case 6:
                dow_formatted = "금";
                break;
            case 7:
                dow_formatted = "토";
                break;
        }
        String month_formatted = String.format("%02d", month);
        result = "" + year + "년 " + month_formatted + "월 " + day + "일 " + dow_formatted + "요일";
        return result;
    }
}
