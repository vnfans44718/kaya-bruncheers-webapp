package com.itwill.shop.user;

import com.itwill.shop.user.exception.ExistedUserException;
import com.itwill.shop.user.exception.PasswordMismatchException;
import com.itwill.shop.user.exception.UserNotFoundException;

public class UserService {

    private UserDao userDao;

    public UserService() throws Exception {
        userDao = new UserDaoImplMyBatis();
    }

    public int create(User user) throws Exception {
        if (!user.isValidUserId(user.getUId())) {
            throw new ExistedUserException("아이디는 영문 또는 숫자만 가능합니다.");
        }

        if (userDao.countByUserId(user.getUId()) > 0) {
            throw new ExistedUserException("이미 존재하는 아이디 입니다.");
        }

        return userDao.insert(user);
    }

    public User login(String uId, String uPass) throws Exception {
        User user = userDao.findUser(uId);

        if (user == null) {
            throw new UserNotFoundException("존재하지 않는 아이디 입니다.");
        }

        if (!user.isMatchPassword(uPass)) {
            throw new PasswordMismatchException("패스워드가 일치하지 않습니다.");
        }
        return user;
    }

    //아이디와 전화번호로 본인확인 후 비밀번호 변경 가능
    public User findUserPassword(String uId, String uPhone) throws Exception {
        User user = userDao.findUser(uId);
        if (user == null) {
            throw new Exception();
        }

        if (!user.isMatchPhone(uPhone)) {
            throw new Exception();
        }
        return user;
    }

    //이름과 비밀번호로 본인확인 후 아이디 찾기
    public User findUserId(String uName, String uPhone) throws Exception {
        User user = userDao.findUserName(uName);
        if (user == null) {
            throw new Exception("사용자를 찾을 수 없습니다.");
        }

        if (!user.isMatchPhone(uPhone)) {
            throw new Exception("비밀번호가 일치하지 않습니다.");
        }
        return user;
    }

    //비밀번호 변경
    public boolean changePassword(String uId, String uPass) throws Exception {
        return userDao.updatePassword(uId, uPass);
    }


    public User findUser(String uId) throws Exception {
        return userDao.findUser(uId);
    }

    public int update(User user) throws Exception {
        return userDao.update(user);
    }

    public int remove(String uId) throws Exception {
        return userDao.delete(uId);
    }

    public boolean checkDuplicateUserId(String uId) throws Exception {
        int count = userDao.countByUserId(uId);
        boolean isExist = false;
        if (count > 0) {
            isExist = true;
        }
        return isExist;
    }

    public User checkDuplicateUserPass(String uId, String uPass) throws Exception {
        User user = userDao.findUser(uId);
        if (user == null) {
            throw new Exception();
        }

        if (!user.isMatchPassword(uPass)) {
            throw new Exception();
        }
        return user;
    }
}
