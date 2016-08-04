package com.credit.manage.filemanager.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.credit.manage.entity.FileManager;
import com.credit.manage.filemanager.service.FileManagerWebService;
import com.gvtv.manage.base.controller.BaseController;
import com.gvtv.manage.base.util.PageData;

@Controller
@RequestMapping(value="/filemanager")
public class FileManangerController extends BaseController{
	
	@Resource
	private FileManagerWebService fileManagerWebService;
	
	@RequestMapping(value="/list")
	public ModelAndView index()throws Exception{
		ModelAndView mv = super.getModelAndView();
		PageData pd =super.getPageData();		
		
		pd.put("from",0);
		pd.put("size", 20);	
		// 法律文书
		pd.put("fileType", 1);
		List<FileManager> fileList = fileManagerWebService.fileList(pd);
		
		//合同模版
		pd.put("fileType", 2);
		List<FileManager> htfileList = fileManagerWebService.fileList(pd);
		
		//实用文档
		pd.put("fileType", 3);
		List<FileManager> wsfileList = fileManagerWebService.fileList(pd);
		
		mv.addObject("fileList",fileList);		
		mv.addObject("htfileList",htfileList);
		mv.addObject("wsfileList",wsfileList);		
		mv.setViewName("file_manager");
		
		return mv;
	}
	
	
	
	

}
