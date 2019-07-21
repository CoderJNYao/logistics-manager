package com.yjn.service;

import org.springframework.ui.Model;

import com.github.pagehelper.PageInfo;
import com.yjn.dto.CustomerDto;
import com.yjn.pojo.Customer;
import com.yjn.pojo.User;

public interface ICustomerService {

    /**
     * 查询更新或者添加需要的信息
     */
    public void getUpdateInfo(Integer id,Model m);
    
    public void addCustomer(Customer customer);
    /**
    * 分页查询
     * @param dto
     * @return
     */
    public PageInfo<CustomerDto> queryPage(CustomerDto dto,User user);
    
    public void updateCustomer(Customer customer);
    
    public void deleteCustomer(Integer id);
}
