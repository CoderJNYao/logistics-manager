package com.yjn.mapper;

import com.yjn.pojo.Role;
import com.yjn.pojo.User;
import com.yjn.pojo.UserExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {
    long countByExample(UserExample example);

    int deleteByExample(UserExample example);

    int deleteByPrimaryKey(Integer userId);

    int insert(User record);

    int insertSelective(User record);

    List<User> selectByExample(UserExample example);

    User selectByPrimaryKey(Integer userId);

    int updateByExampleSelective(@Param("record") User record, @Param("example") UserExample example);

    int updateByExample(@Param("record") User record, @Param("example") UserExample example);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
    void insertUserIdAndRoleId(Integer userId, Integer roleId);
    
    List<Integer> selectRoleIdByUserId(Integer id);
    
    void deleteRoleIdByUserId(Integer userId);
    
    List<User> queryUserByRoleName(String roleName);
    

}