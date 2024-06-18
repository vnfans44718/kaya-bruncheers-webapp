package com.itwill.shop.user;

import com.itwill.shop.user.exception.ExistedUserException;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.booleanThat;

class UserServiceTest {

    private UserService userService;

    @BeforeEach
    public void setUp() throws Exception {
        userService = new UserService();
    }

    @Test
    void create() throws Exception {
        //given
        User user = new User("testId", "testPass", "testName", "testPhone", "testEmail", "testAddr", "testDob");

        //when
        int result = userService.create(user);

        //then
        assertEquals(1, result);
    }

    @Test
    void login() throws Exception {
        //given
        String uId = "testId";
        String uPass = "testPass";

        //when
        User user = userService.login(uId, uPass);

        //then
        assertNotNull(user);
    }

    @Test
    void findUser() throws Exception {
        //given
        String uId = "testId";

        //when
        User user = userService.findUser(uId);

        //then
        assertNotNull(user);
        assertEquals(uId, user.getUId());
    }

    @Test
    void update() throws Exception {
        //given
        User user = new User("testId", "updatePass", "updateName", "updatePhone", "updateEamil", "updateAddr", "updateDob");

        //when
        int result = userService.update(user);

        //then
        assertEquals(1, result);
    }

    @Test
    void remove() throws Exception {
        //given
        String uId = "testId";

        //when
        int result = userService.remove(uId);

        //then
        assertEquals(1, result);
    }

    @Test
    void isDuplicateId() throws Exception {
        //given
        User user = new User("testId", "testPass", "testName", "testPhone", "testEmail", "testAddr", "testDob");

        //when & then
        assertThrows(ExistedUserException.class, () -> {
            userService.create(user);
        });
    }

    /*
    @Test
    void CheckDuplicatePass() throws Exception {
    	String validUserId = "aaaa";
    	String validPass = "aaaa";
    	boolean result = userService.checkDuplicateUserPass(validUserId, validPass);
    	assertTrue(result);

    }
     */
}
