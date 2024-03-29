package com.yjn.service;

import java.util.List;

import org.springframework.ui.Model;

import com.github.pagehelper.PageInfo;
import com.yjn.dto.UserDto;
import com.yjn.pojo.Role;
import com.yjn.pojo.User;

/**
 * 用户信息
 * @author JustinNeil
 */
public interface IUserService {

    /**
     * 根据条件查询用户信息
     * @param user
     * @return
     */
    public List<User> queryUser(User user);
    
    /**
     * 添加用户
     * @param user
     * @throws Exception
     */
    public void addUser(User user) throws Exception;
    
    /**
     * 修改用户
     * @param user
     * @throws Exception
     */
    public void updateUser(User user)throws Exception;
    
    /**
     * 删除用户
     * @param id
     * @throws Exception
     */
    public void deleteUser(int id)throws Exception;
    
    /**
     * 获取添加或者修改用户需要的数据
     * 添加
     *    获取所有的角色信息
     * 修改
     *    获取所有的角色信息及根据id查询的用户信息
     * @param id
     * @return
     */
    public void getUpdateUserInfo(Integer id,Model model);

    /**
     * 保存或修改用户数据
     * @param userDto
     */
	public void saveOrUpdate(UserDto userDto)throws Exception; 
    /**
     * 分页带条件查询用户信息
     * @param dto
     * @return
     */
    public PageInfo<User> queryPage(UserDto dto);
    
    /**
     * 根据用户编号获取对应的权限信息
     * @param userId
     * @return
     */
    public List<Role> queryRoleByUserId(int userId);
    
    /**
    * 根据角色名称查询对应的用户信息
     * @param roleName
     * @return
     */
    public List<User> queryUserByRoleName(String roleName);
}
