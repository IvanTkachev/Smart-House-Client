package com.smart_house.client.service;

import com.smart_house.client.model.User;

public interface UserService {

    void save(User user);

    User findByUsername(String username);

    User findByEmail(String email);

    void update(User user);
}
