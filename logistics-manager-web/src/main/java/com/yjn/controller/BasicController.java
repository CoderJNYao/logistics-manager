package com.yjn.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.yjn.dto.BasicDataDto;
import com.yjn.pojo.BasicData;
import com.yjn.pojo.User;
import com.yjn.service.IBasicService;

@Controller
@RequestMapping("/basic")
public class BasicController {

    @Resource
    private IBasicService basicService;
    
    @RequestMapping("/queryPage")
    public String queryPage(BasicDataDto dto,Model model){
        PageInfo<BasicData> pageInfo = basicService.queryPage(dto);
        model.addAttribute("pageModel", pageInfo);
        return "basic/basic";
    }
    
    @RequestMapping("/query")
    public String query(BasicData bd,Model model){
        List<BasicData> list = basicService.query(bd);
        model.addAttribute("list", list);
        return "basic/basic";
    }
    
    @RequestMapping("/basicUpdate")
    public String basicUpdate(Integer id,Model m){
        basicService.getUpdateInfo(id,m);
        return "basic/basicUpdate";
    }
    
    
    @RequestMapping("/saveOrUpdate")
    public String saveOrUpdate(BasicData bd){
        if(bd.getParentId()==0){
            bd.setParentId(null);
        }
        if(bd.getBaseId()!=null && bd.getBaseId() > 0){
            // 表示更新数据
            basicService.updateBasicData(bd);
        }else{
            // 表示添加数据
            basicService.addBasicData(bd);
        }
        return "redirect:/basic/query";
    }
    
    @RequestMapping("/delete")
    public String delete(Integer id){
        basicService.deleteBasicData(id);
        return "redirect:/basic/query";
    }
    
    @RequestMapping("/getParentData")
    @ResponseBody()
    public List<BasicData> getParentData(){
    	List<BasicData> list = basicService.getParentData();
        return list;
    }
    
    @RequestMapping("/searchData")
    public String searchData(Integer id,Model model){
        List<BasicData> list = basicService.searchData(id);
        model.addAttribute("list", list);
        return "basic/basic";
    }
    
}
