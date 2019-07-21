package com.yjn.service;

import java.util.List;

import org.springframework.ui.Model;

import com.yjn.pojo.Role;

/**
 * 角色
 * @author JustinNeil
 *
 */
public interface IRoleService {
    /**
     * 根据条件查询角色
     * @param role
     * @return
     */
    public List<Role> queryRole(Role role);
    
    /**
     * 添加角色信息
     * @param role
     * @throws Exception
     */
    public void addRole(Role role) throws Exception;
    
    /**
     * 根据id更新角色信息
     * @param role
     * @throws Exception
     */
    public void updateRole(Role role) throws Exception;
    
    /**
     * 根据id删除角色信息
     * @param id
     * @throws Exception
     */
    public void deleteRole(int id) throws Exception;
    
 
}
