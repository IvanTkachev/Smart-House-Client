package com.smart_house.client.service.impl;



import com.smart_house.client.model.User;
import com.smart_house.client.repository.UserRepository;
import com.smart_house.client.service.ProfileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import static com.smart_house.client.service.GoogleDriveAPI.addFileToDrive;


/**
 * Implementation of {@link ProfileService} interface.
 */

@Transactional
@Component
public class ProfileServiceImpl implements ProfileService {

    @Autowired
    private UserRepository userRepository;



    @Override
    public User getUserByID(Long id) {
        return userRepository.getOne(id);
    }

    @Override
    public User getUserByUsername(String username) {
        Long id = userRepository.findByUsername(username).getId();
        User user = userRepository.getOne(id);
        user.setUsername(username);
//        user.setUserProductList(productService.getProductsByUsername(user.getUsername()));
        return user;
    }

    @Override
    public void addUser(User user) {
        userRepository.save(user);
    }

    @Override
    public void updateUser(User user) {
        userRepository.save(user);
    }


    @Override
    public User getUserByHttpServletRequestAndPhoto(HttpServletRequest request, MultipartFile photo) {
        User user = new User();
        fillNotMandatoryFields(request.getParameterMap(), user, photo);
        return user;
    }

    @Override
    public void fillNotMandatoryFields(Map<String, String[]> parameterMap, User user, MultipartFile photo){
        user.setFio(parameterMap.get("fio")[0]);
        user.setEmail(parameterMap.get("email")[0]);
        user.setCity(parameterMap.get("city")[0]);
        user.setTelephone(parameterMap.get("telephone")[0]);
        user.setDateOfBirth(parameterMap.get("dateOfBirth")[0]);
        if(parameterMap.get("sex") != null)
            user.setSex(parameterMap.get("sex")[0]);
        if (photo.isEmpty()){
            user.setPhoto("-1");
        }
        else
            try {
                user.setPhoto(addFileToDrive(photo));
            } catch (IOException e) {
                e.printStackTrace();
            }
    }

    @Override
    public Long getUserIdByEmail(String email) {
        User user = userRepository.findByEmail(email);
        return user == null ? null : user.getId();
    }

    @Override
    public Long getUserIdByTelephone(String telephone) {
        return null;
    }

    @Override
    public List<User> getAllUsers() {
        return userRepository.findAll();
    }
}
