package com.yjn.controller;

import java.io.IOException;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.PageInfo;
import com.yjn.dto.CustomerDto;
import com.yjn.pojo.Customer;
import com.yjn.pojo.User;
import com.yjn.service.ICustomerService;
import com.yjn.utils.Constant;

@Controller
@RequestMapping("/customer")
public class CustomerController {
    @Resource
    private ICustomerService customerService;

    @RequestMapping("/customerUpdate")
    public String customerUpdate(Integer id,Model model){
        customerService.getUpdateInfo(id, model);
        return "customer/customerUpdate";
    }
    
    @RequestMapping("/saveOrUpdate")
    public String saveOrUpdate(Customer customer) throws IOException{
        if(customer.getCustomerId()!=null && !"".equals(customer.getCustomerId())){
            // 更新
            customerService.updateCustomer(customer);
        }else{
            // 添加
            customerService.addCustomer(customer);
        }
        return "success";
    }
    
    @RequestMapping("/query")
    public String query(CustomerDto dto,Model model){
        // 获取登录用户信息
        User user = (User) SecurityUtils.getSubject().getPrincipal();
        System.out.println("--->"+user.getUserId());
        PageInfo<CustomerDto> list = customerService.queryPage(dto,user);
        model.addAttribute(Constant.PAGE_MODEL, list);
        return "customer/customer";
    }
    
    @RequestMapping("/delete")
    public String delete(Integer id) throws IOException{
        customerService.deleteCustomer(id);
        return "customer/customer";
    }
}
