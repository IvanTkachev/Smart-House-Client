package com.smart_house.client.service;


import com.smart_house.client.model.User;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * Service class for profile of {@link User}
 */
public interface ProfileService {
    User getUserByID(Long id);

    User getUserByUsername(String username);

    void addUser(User user);

    void updateUser(User user);

    void fillNotMandatoryFields(Map<String, String[]> parameterMap, User user, MultipartFile photo);

    Long getUserIdByEmail(String email);

    Long getUserIdByTelephone(String telephone);

    User getUserByHttpServletRequestAndPhoto(HttpServletRequest request, MultipartFile photo);

    List<User> getAllUsers();
}
