package com.yjn.controller;

import java.util.List;

import javax.annotation.Resource;

import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.PageInfo;
import com.yjn.dto.UserDto;
import com.yjn.pojo.User;
import com.yjn.service.IUserService;

/**
 * 用户控制层
 * @author JustinNeil
 */
@Controller
@RequestMapping("/user")
public class UserController {
    
    @Resource
    private IUserService userService;

    @RequestMapping("/query")
    public String query(User user,Model model){
        List<User> list = userService.queryUser(user);
        model.addAttribute("list", list);
        return "user/user";
    }
    
    /**
     * 进入添加或者修改页面
     * @param id
     * @return
     */
    @RequestMapping("/userUpdate")
    public String userUpdatePage(Integer id,Model model){
        // 查询添加或者更新需要的数据
        userService.getUpdateUserInfo(id,model); 
        return "/user/userUpdate";
    }
    
    /**
     * 完成添加或修改操作
     * @param id
     * @return
     * @throws Exception 
     */
    @RequestMapping("/saveOrUpdate")
    public String saveOrUpdate(UserDto userDto) throws Exception{
        userService.saveOrUpdate(userDto);
        return "redirect:/user/queryPage";
    }
    
    /**
     * 处理用户删除请求
     * @param id
     * @return
     * @throws Exception
     */
    @RequestMapping("/delete")
    public String deleteUser(Integer id) throws Exception{
        userService.deleteUser(id);
        return "redirect:/user/queryPage";
    }
    /**
     * 分页查询
     * @param dto
     * @param model
     * @return
     */
    @RequiresRoles("管理员")
    @RequestMapping("/queryPage")
    public String queryPage(UserDto dto,Model model){
        PageInfo<User> pageModel = userService.queryPage(dto);
        model.addAttribute("pageModel", pageModel);
        return "user/user";
    }
}
