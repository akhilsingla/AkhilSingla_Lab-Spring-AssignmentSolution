package com.greatlearning.dao;

import com.greatlearning.entity.User;

public interface UserDao {

    User findByUserName(String userName);

}
