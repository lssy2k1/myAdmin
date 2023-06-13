package com.myadmin.dto;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class CalEvent {
    private String title;
    private String contents;
    private String start;
    private String end;
}
