package com.credit.manage.credit.controller;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.credit.manage.credit.service.CreditManagerService;
import com.credit.manage.entity.Credit;
import com.credit.manage.entity.FileManager;
import com.gvtv.manage.base.controller.BaseController;
import com.gvtv.manage.base.system.controller.UserController;
import com.gvtv.manage.base.util.PageData;

@Controller
@RequestMapping(value = "/credit")
public class CreditManagerController extends BaseController{
	private static Logger logger = LoggerFactory.getLogger(CreditManagerController.class);
	@Resource
	private CreditManagerService creditManagerService;

	@RequestMapping
	public ModelAndView page() {
		ModelAndView mv = super.getModelAndView();
		mv.setViewName("credit/credit/credit_list");
		return mv;
	}

	@RequestMapping(value = "/list")
	@ResponseBody
	public PageData list() {
		PageData result = null;
		try {
			PageData pd = super.getPageData();
			result = creditManagerService.list(pd);
		} catch (Exception e) {
			logger.error("list user error", e);
			result = new PageData();
		}
		return result;
	}
	
	
	
	/**
	 * 查询意见反馈详情
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/details", method=RequestMethod.GET)
	public ModelAndView toDetails(@RequestParam Integer id){
		Credit credit = null;
		try {
			credit = creditManagerService.findById(id);
		} catch (Exception e) {
			logger.error("get fileManager error", e);
		}
		ModelAndView mv = super.getModelAndView();
		mv.addObject("credit", credit);
		mv.setViewName("credit/credit/credit_details");
		return mv;
	}
	
	
    /**
     * 跳转到新增页面
     * @return
     */
	@RequestMapping(value="/add", method=RequestMethod.GET)
	public ModelAndView toAdd(){
		ModelAndView mv = super.getModelAndView();
		mv.setViewName("credit/credit/credit_add");
		return mv;
	}
	
	/**
	 * 新增下载法律文件信息
	 * @return
	 */
	@RequestMapping(value="/add", method=RequestMethod.POST)
	@ResponseBody
	public PageData add(Credit credit){
		PageData result = new PageData();
		try {
			PageData pd = super.getPageData();
			int num= creditManagerService.save(credit);
			if(num>0){
				result.put("status", 1);
			}
		} catch (Exception e) {
			logger.error("add filemanager error", e);
			result.put("status", 0);
			result.put("msg", "新增失败");
		}
		return result;
	}
	
	/**
	 * 跳转到更新法律文件信息页面
	 * @return
	 */
	@RequestMapping(value="/edit", method=RequestMethod.GET)
	public ModelAndView toEdit(@RequestParam Integer id){
		Credit credit = null;
		try {
			credit = creditManagerService.findById(id);
		} catch (Exception e) {
			logger.error("get fileManager error", e);
		}
		ModelAndView mv = super.getModelAndView();
		mv.addObject("credit", credit);
		mv.setViewName("credit/filemanager/filemanager_edit");
		mv.setViewName("credit/credit/credit_edit");
		return mv;
	}
	
	/**
	 * 更新法律文件信息
	 * @return
	 */
	@RequestMapping(value="/edit", method=RequestMethod.POST)
	@ResponseBody
	public PageData edit(Credit credit){
		PageData result = new PageData();
		try {
			int num= creditManagerService.update(credit);
			if(num>0){
				result.put("status", 1);
			}
		} catch (Exception e) {
			logger.error("edit filemanager error", e);
			result.put("status", 0);
			result.put("msg", "更新失败");
		}
		return result;
	}
	
	/**
	 *删除法律文件信息
	 * @return
	 */
	@RequestMapping(value="/delete")
	@ResponseBody
	public PageData delete(@RequestParam Integer id){
		PageData result = new PageData();
		try {
			creditManagerService.delete(id);
			result.put("status", 1);
		} catch (Exception e) {
			logger.error("delete filemanager error", e);
			result.put("status", 0);
			result.put("msg", "删除失败");
		}
		return result;
	}
	
	@RequestMapping(value="/batchDelete")
	@ResponseBody
	public PageData batchDelete(@RequestParam String ids){
		PageData result = new PageData();
		try {
			creditManagerService.batchDelete(ids);
			result.put("status", 1);
		} catch (Exception e) {
			logger.error("batch delete user error", e);
			result.put("status", 0);
			result.put("msg", "批量删除失败");
		}
		return result;
	}
}
