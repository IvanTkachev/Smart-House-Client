package com.smart_house.client.controller;

import com.smart_house.client.model.User;
import com.smart_house.client.service.ProfileService;
import com.smart_house.client.service.UserService;
import com.smart_house.client.validator.ProfileValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * Controller for profiles of {@link com.smart_house.client.model.User}'s pages
 */
@Controller
public class ProfileController {

    @Autowired
    private ProfileService profileService;

    @Autowired
    private UserService userService;

    @Autowired
    private ProfileValidator profileValidator;

    @RequestMapping(value = "/profiles", method = RequestMethod.GET)
    public String allUsers(Model model) {
        org.springframework.security.core.userdetails.User spring_user =
                (org.springframework.security.core.userdetails.User) SecurityContextHolder.
                        getContext().getAuthentication().getPrincipal();
        String username = spring_user.getUsername();
        Long id = userService.findByUsername(username).getId();
        model.addAttribute("profiles", profileService.getUserByID(id));
        return "/profiles";
    }

    @ModelAttribute("User")
    public User user() {
        org.springframework.security.core.userdetails.User spring_user =
                (org.springframework.security.core.userdetails.User) SecurityContextHolder.
                        getContext().getAuthentication().getPrincipal();
        String username = spring_user.getUsername();
        Long id = userService.findByUsername(username).getId();
        return profileService.getUserByID(id);
    }


    @RequestMapping(value = "/checkEmail")
    public @ResponseBody
    int checkEmail(@RequestParam String email) {
        Long id = profileService.getUserIdByEmail(email);
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        Long user_id = userService.findByUsername(username).getId();
        if (id != -1 && user_id != id) {
            return -1;
        }
        return 1;
    }

    @RequestMapping(value = "/checkTelephone")
    public @ResponseBody
    int checkTelephone(@RequestParam String telephone) {
        Long id = profileService.getUserIdByTelephone(telephone);
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        Long user_id = userService.findByUsername(username).getId();
        if (id != -1 && user_id != id) {
            return -1;
        }
        return 1;
    }

    @RequestMapping(value = "/profiles", method = RequestMethod.POST)
    public String upDateProfile(@ModelAttribute User user, BindingResult bindingResult, HttpServletRequest request,
                                @RequestParam("file") MultipartFile multipartFile) throws IOException {

        user = profileService.getUserByHttpServletRequestAndPhoto(request, multipartFile);
        profileValidator.validate(user, bindingResult);
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName();
        user = userService.findByUsername(name);
        profileService.fillNotMandatoryFields(request.getParameterMap(), user, multipartFile);
        if (bindingResult.hasErrors()) {
            return "redirect: /profiles";
        }
        profileService.updateUser(user);
        return "redirect: /account";
    }

    @RequestMapping(value = "/all_profiles", method = RequestMethod.GET)
    public String allProducts(Model model) {
        model.addAttribute("profiles", profileService.getAllUsers());
        return "/all_profiles";
    }

    @RequestMapping(value = "/blocked", method = RequestMethod.GET)
    public String changeStatusBlocked(@RequestParam Long profileId) {
        User user = profileService.getUserByID(profileId);
        if (user.getStatus().equals("BLOCKED")) {
            user.setStatus("UNBLOCKED");
        }
        userService.save(user);
        return "/all_profiles";
    }

    @RequestMapping(value = "/unblocked", method = RequestMethod.GET)
    public String changeStatusUnblocked(@RequestParam Long profileId) {
        User user = profileService.getUserByID(profileId);
        if (user.getStatus().equals("UNBLOCKED")) {
            user.setStatus("BLOCKED");
        }
        userService.save(user);
        return "/all_profiles";
    }

}