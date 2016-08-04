/** 
  * Project Name:credit_web 
  * File Name:FileManager.java 
  * Package Name:com.credit.web.filemanager.service 
  * Date:2016年7月13日下午8:15:32 
  * Copyright (c) 2016, JuanPi.com All Rights Reserved
  */  
  
package com.credit.manage.filemanager.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.credit.manage.entity.FileManager;
import com.gvtv.manage.base.dao.BaseDao;
import com.gvtv.manage.base.util.PageData;

/** 
  * @author huixiong 
  * @date: 2016年7月13日 下午8:15:32 
  * @since:1.0.0
  */
@Transactional(readOnly=true)
@Service("fileManagerWebService")
public class FileManagerWebService {
	@Resource(name = "BaseDao")
	private BaseDao dao;
	
	/**
	 * 查询债权列表信息
	 * @author huixiong 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<FileManager> fileList(PageData pd) throws Exception {
		List<FileManager> fileList = dao.findForList("FileManagerMapper.list", pd);
		return fileList;
	}
	
}
  