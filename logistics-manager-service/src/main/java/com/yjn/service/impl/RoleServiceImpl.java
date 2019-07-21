package com.yjn.service.impl;

import java.util.List;

import com.yjn.pojo.Role;
import com.yjn.service.IRoleService;
import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.yjn.mapper.RoleMapper;
import com.yjn.pojo.RoleExample;


@Service
public class RoleServiceImpl implements IRoleService {
    
    @Resource
    private RoleMapper mapper;

    @Override
    public List<Role> queryRole(Role role) {
        RoleExample example = new RoleExample();
        if(role !=null&& !"".equals(role.getRoleName()) && role.getRoleName()!=null){
            example.createCriteria().andRoleNameLike("%"+role.getRoleName()+"%");
        }
        
        return mapper.selectByExample(example);
    }

    @Override
    public void addRole(Role role) throws Exception {
        mapper.insertSelective(role);

    }

    @Override
    public void updateRole(Role role) throws Exception {
        mapper.updateByPrimaryKeySelective(role);

    }

    @Override
    public void deleteRole(int id) throws Exception {
        mapper.deleteByPrimaryKey(id);
    }

}
