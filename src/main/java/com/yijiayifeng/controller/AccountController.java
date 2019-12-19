package com.yijiayifeng.controller;

import com.yijiayifeng.entity.Account;
import com.yijiayifeng.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/accountMapper")
public class AccountController {
    @Autowired
    AccountService accountService;


    @RequestMapping("/addAccount")
    public String  addAccount(Account account){
        accountService.addAccount(account);
        return "adminnumber";
    }
}
