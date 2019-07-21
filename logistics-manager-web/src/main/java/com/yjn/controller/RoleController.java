package com.yjn.controller;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yjn.pojo.Role;
import com.yjn.service.IRoleService;

/**
 * 角色 控制层
 * @author JustinNeil
 *
 */
@Controller
@RequestMapping("/role")
public class RoleController {
    
    @Resource
    private IRoleService roleService;

    @RequestMapping("/query")
    public String query(Role role,Model model){
        List<Role> list = roleService.queryRole(role);
        model.addAttribute("list", list);
        return "role/role";
    }
}
