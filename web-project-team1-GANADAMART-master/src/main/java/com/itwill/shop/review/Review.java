package com.itwill.shop.review;

import lombok.*;

import java.util.Date;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Review {

    private int rNo;
    private String rContent;
    private Date rDate;
    private String uId;
    private int pNo;
    private int rRating;
}
