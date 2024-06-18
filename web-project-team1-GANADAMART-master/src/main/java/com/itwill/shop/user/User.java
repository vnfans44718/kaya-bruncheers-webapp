package com.itwill.shop.user;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class User {

    private String uId;
    private String uPass;
    private String uName;
    private String uPhone;
    private String uEmail;
    private String uAddr;
    private String uDob;

    public boolean isMatchPassword(String uPass) {
        return this.uPass.equals(uPass);
    }

    public boolean isMatchPhone(String uPhone) {
        return this.uPhone.equals(uPhone);
    }


    public boolean isValidUserId(String uId) {
        return uId.matches("[a-zA-Z0-9]+");
    }
}
