package com.yjn.mapper;

import com.yjn.pojo.BasicData;
import com.yjn.pojo.BasicDataExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface BasicDataMapper {
    long countByExample(BasicDataExample example);

    int deleteByExample(BasicDataExample example);

    int deleteByPrimaryKey(Integer baseId);

    int insert(BasicData record);

    int insertSelective(BasicData record);

    List<BasicData> selectByExample(BasicDataExample example);

    BasicData selectByPrimaryKey(Integer baseId);

    int updateByExampleSelective(@Param("record") BasicData record, @Param("example") BasicDataExample example);

    int updateByExample(@Param("record") BasicData record, @Param("example") BasicDataExample example);

    int updateByPrimaryKeySelective(BasicData record);

    int updateByPrimaryKey(BasicData record);
    
    List<BasicData> getBasicDataByParentName(String basicCommonInterval);

	List<BasicData> getParentData();

	List<BasicData> searchData(Integer id);
}