package org.whc.mapper;

import org.whc.pojo.User;

public interface UserMapper {
    public User querUserByName(String userName);

    public void insertUser(User newUser);
}
