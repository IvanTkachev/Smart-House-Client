package com.smart_house.client.controller;

import com.smart_house.client.model.Item;
import com.smart_house.client.model.User;
import com.smart_house.client.service.ItemService;
import com.smart_house.client.service.GoogleDriveAPI;
import com.smart_house.client.service.UserService;
import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.RequestContextUtils;

import javax.servlet.http.HttpServletRequest;
import java.io.*;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Controller
public class ItemController {


    @Autowired
    ItemService itemService;

    @Autowired
    UserService userService;

    @RequestMapping(value = "my_items", method = RequestMethod.GET)
    public String getHomeItemsByUser(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName();
        model.addAttribute("items", itemService.getItemsByOwnerUsername(name));
        return "/my_items";
    }

    @Transactional
    @RequestMapping(value = "/item/{id}", method = RequestMethod.GET)
    public String getItemById(@PathVariable String id, Model model) {
        Item item = itemService.getItemById(Long.parseLong(id));
        Hibernate.initialize(item.getOwners());
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName();
//        Sign sign = signService.getSignBySignerAndDocument(userService.findByUsername(name).getId().toString(),
//                item.getId().toString());
//        boolean signCheck = sign == null;
        if (item == null) {
            return "/error_page404";
        } else {
            model.addAttribute("itemId", item);
            return "/item_by_id";
        }
    }

    @RequestMapping(value = "/items/{username}", method = RequestMethod.GET)
    public String getItemsByUsername(@PathVariable String username, Model model, HttpServletRequest request) {
        List<Item> items = itemService.getItemsByOwnerUsername(username);
        String result_msg;
        if (RequestContextUtils.getLocale(request).toString().equals("ru")) {
            result_msg = "ТАКОГО ПОЛЬЗОВАТЕЛЯ НЕ СУЩЕСТВУЕТ";
        } else {
            result_msg = "USER NOT FOUND";
        }

        if (userService.findByUsername(username) != null) {
            if (RequestContextUtils.getLocale(request).toString().equals("ru")) {
                result_msg = "Документы пользователя: " + username;
            }
            if (RequestContextUtils.getLocale(request).toString().equals("en")) {
                result_msg = "Documents of user: " + username;
            }
        }
        model.addAttribute("result_message", result_msg);
        model.addAttribute("items", items);
        return "/catalog";
    }


    @RequestMapping(value = "/item/add", method = RequestMethod.POST)
    public String addItem(@RequestParam("file") MultipartFile file, HttpServletRequest request) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
//        if(file!=null){
        //                String id = GoogleDriveAPI.addFileToDrive(file);
        Item item = new Item();
        item.setLink("-1");
//                Set user = new HashSet<>();
        User owner = userService.findByUsername(username);
//                user.add(owner);
        item.setName(request.getParameter("name"));
        item.setSummary(request.getParameter("summary"));
        item.setStatus("OFF");
        itemService.save(item);
        item = itemService.getByNameAndLink(item.getName(), item.getLink());
        owner.getOwnItems().add(item);
        userService.update(owner);
//        }
        return "/my_items";
    }

    @RequestMapping(value = "/new_item", method = RequestMethod.GET)
    public String goToNewItem(Model model, HttpServletRequest request) {

        return "new_item";
    }
}
