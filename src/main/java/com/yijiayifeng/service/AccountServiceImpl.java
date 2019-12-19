package com.yijiayifeng.service;


import com.yijiayifeng.entity.Account;
import com.yijiayifeng.mapper.AccountMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class AccountServiceImpl implements AccountService{
    @Autowired
    AccountMapper accountMapper;

    //添加账号
    public void addAccount(Account account){
        accountMapper.addAccount(account);
    }
}
