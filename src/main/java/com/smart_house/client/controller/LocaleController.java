package com.smart_house.client.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.i18n.CookieLocaleResolver;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;
import org.springframework.web.util.WebUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Locale;

/**
 * Rest Controller for i18n
 */
@RestController
public class LocaleController {

    @Autowired
    private CookieLocaleResolver cookieLocaleResolver;

    @RequestMapping(value = "/changeLocale")
    public void changeLocale(@RequestBody String localeName, HttpServletRequest httpRequest, HttpServletResponse httpResponse) {
        Locale locale = new Locale(localeName);
        cookieLocaleResolver.setLocale(httpRequest, httpResponse, locale);

    }


}
