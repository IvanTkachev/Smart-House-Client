package com.smart_house.client.service.impl;

import com.smart_house.client.model.Role;
import com.smart_house.client.model.User;
import com.smart_house.client.repository.RoleRepository;
import com.smart_house.client.repository.UserRepository;
import com.smart_house.client.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public void save(User user) {
        //Encoding password
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        Set<Role> roles = new HashSet<>();
        //Add User role
        roles.add(roleRepository.getOne(1L));
        user.setRoles(roles);

        fillNotMandatoryFields(user);
        //Save user
        userRepository.save(user);
    }

    private void fillNotMandatoryFields(User user){
        if(user.getCity() == null)
            user.setCity("");
        if(user.getTelephone() == null)
            user.setTelephone("");
        if(user.getDateOfBirth() == null)
            user.setDateOfBirth("");
        if(user.getEmail() == null)
            user.setEmail("");
        if(user.getSex() == null)
            user.setSex("");
        if(user.getFio() == null)
            user.setFio("");
        if(user.getStatus() == null)
            user.setStatus("UNBLOCKED");
        if(user.getPhoto() == null)
            user.setPhoto("-1");
        if(user.getSecret() == null)
            user.setSecret("");
        if(user.getAccountCreationDate() == null){
            Date date = new Date();
            SimpleDateFormat formatForDateNow = new SimpleDateFormat("yyyy.MM.dd");
            user.setAccountCreationDate(formatForDateNow.format(date));
        }
    }

    @Override
    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    @Override
    public User findByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    @Override
    public void update(User user) {
        userRepository.save(user);
    }
}
