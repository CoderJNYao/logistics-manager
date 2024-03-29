package com.yjn.service;

import java.util.List;

import org.springframework.ui.Model;

import com.github.pagehelper.PageInfo;
import com.yjn.dto.BasicDataDto;
import com.yjn.pojo.BasicData;

public interface IBasicService {

    public List<BasicData> query(BasicData bd);
    
    public PageInfo<BasicData> queryPage(BasicDataDto dto);
    
    public void addBasicData(BasicData bd);
    
    public void deleteBasicData(int id);
    
    public void updateBasicData(BasicData bd);
    
    public void getUpdateInfo(Integer id, Model m);
    
    /**
    * 根据大类名称查询对应的小类
     * @param parentName
     * @return
     */
    public List<BasicData> getBasicDataByParentName(String parentName);

	public List<BasicData> getParentData();

	public List<BasicData> searchData(Integer id);
}
