package com.yjn.service.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yjn.dto.UserDto;
import com.yjn.mapper.RoleMapper;
import com.yjn.mapper.UserMapper;
import com.yjn.pojo.Role;
import com.yjn.pojo.RoleExample;
import com.yjn.pojo.User;
import com.yjn.pojo.UserExample;
import com.yjn.service.IUserService;

@Service
public class UserServiceImpl implements IUserService {
    
    @Resource
    private UserMapper userMapper;
    @Resource 
    private RoleMapper roleMapper;

    @Override
    public List<User> queryUser(User user) {
        UserExample example = new UserExample();
        if(user!=null){
            if(!"".equals(user.getUserName()) && user.getUserName()!= null){
                // 根据账号查询
                example.createCriteria().andUserNameEqualTo(user.getUserName());
            }
        }
        return userMapper.selectByExample(example);
    }

    @Override
    public void addUser(User user) throws Exception {
        userMapper.insertSelective(user);
    }

    @Override
    public void updateUser(User user) throws Exception {
        userMapper.updateByPrimaryKey(user);
    }

    @Override
    public void deleteUser(int id) throws Exception {
        // 1.删除用户和角色的关联关系
        userMapper.deleteRoleIdByUserId(id);
        // 2.删除用户
        userMapper.deleteByPrimaryKey(id);
    }
    
    @Override
    public void getUpdateUserInfo(Integer id,Model model) {
        RoleExample roleExample = new RoleExample();
        List<Role> roles = roleMapper.selectByExample(roleExample );
        if(id !=null && id > 0){
            // 表示更新数据，需要根据id查询用户信息
            User user = userMapper.selectByPrimaryKey(id);
            // 查询用户具有的角色信息
            List<Integer> roleIds = userMapper.selectRoleIdByUserId(id);
            model.addAttribute("user", user);
            model.addAttribute("roleIds", roleIds);
        }
        model.addAttribute("roles", roles);
    }
    
    @Override
    public void saveOrUpdate(UserDto userDto) throws Exception {
        // 获取User对象
        User user = userDto.getUser();
        // 获取关联的角色信息
        List<Integer> roles = userDto.getRoles();
        // 判断是添加还是修改数据
        if(user.getUserId()!=null && user.getUserId() > 0){
            // 表示userId存在，说明是更新
            // 修改用户
            userMapper.updateByPrimaryKeySelective(user);
            // 根据用户ID删除管理的角色信息
            userMapper.deleteRoleIdByUserId(user.getUserId());
            // 再保存用户和角色的关联关系
            if(roles!=null && roles.size() > 0){
                for (Integer roleId : roles) {
                    userMapper.insertUserIdAndRoleId(user.getUserId(),roleId);
                }
            }
        }else{
            // 不存在id说明是添加数据
            // 先添加用户数据 获取生成的userId
            userMapper.insert(user);
            // 再保存用户和角色的对应关系，在一个事务中处理
            if(roles!=null && roles.size() > 0){
                for (Integer roleId : roles) {
                    userMapper.insertUserIdAndRoleId(user.getUserId(),roleId);
                }
            }
            
        }
    }
    

    @Override
    public PageInfo<User> queryPage(UserDto dto) {
        PageHelper.startPage(dto.getPageNum(), dto.getPageSize());
        List<User> list = this.queryUser(dto.getUser());
        PageInfo<User> pageInfo = new PageInfo<User>(list);
        return pageInfo;
    }
    
    @Override
    public List<Role> queryRoleByUserId(int userId) {
        return roleMapper.queryRoleByUserId(userId);
    }
    
    @Override
    public List<User> queryUserByRoleName(String roleName) {
        return userMapper.queryUserByRoleName(roleName);
    }
}
