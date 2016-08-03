package com.credit.manage.webUser.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.credit.manage.entity.WebUser;
import com.credit.manage.webUser.service.WebUserWebService;
import com.gvtv.manage.base.controller.BaseController;
import com.gvtv.manage.base.util.PageData;

@Controller
@RequestMapping(value="/webUser")
public class WebUserController extends BaseController{
	
	private static Logger logger = LoggerFactory.getLogger(WebUserController.class);
	
	@Resource
	private WebUserWebService webUserWebService;
	
	
	/**
	 * 跳转到注册用户列表
	 * @return
	 */
	@RequestMapping(value="/cr_page")
	public ModelAndView page(){
		ModelAndView mv = super.getModelAndView();
		mv.setViewName("credit/webUser/webUser_list");
		return mv;
	}
	
	/**
	 * 跳转到注册用户列表
	 * @return
	 */
	@RequestMapping(value="/ex_page")
	public ModelAndView expertPage(){
		ModelAndView mv = super.getModelAndView();
		mv.setViewName("credit/webUser/expert_list");
		return mv;
	}
	
	/**
	 * 查询注册用户列表
	 * @return
	 */
	@RequestMapping(value="/cr_list")
	@ResponseBody
	public PageData crList(){
		PageData result = null;
		try {
			PageData pd = super.getPageData();
			pd.put("userLevel", 0);//注册用户
			result = webUserWebService.findPartUserList(pd);
		} catch (Exception e) {
			logger.error("list webUser error", e);
			result = new PageData();
		}
		return result;
		
	}
	
	/**
	 * 查询专家顾问列表
	 * @return
	 */
	@RequestMapping(value="/ex_list")
	@ResponseBody
	public PageData expertList(){
		PageData result = null;
		try {
			PageData pd = super.getPageData();
			pd.put("userLevel", 99);//专家 媒体人 等
			result = webUserWebService.findPartUserList(pd);
		} catch (Exception e) {
			logger.error("list webUser error", e);
			result = new PageData();
		}
		return result;
	}
	
	/**
	 * 查看用户明细
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/userdetails")
	public ModelAndView userDetails(HttpServletRequest request) throws Exception{
		String id =request.getParameter("id");
		ModelAndView mv = this.getModelAndView();
		if(id!=null){
			WebUser user = webUserWebService.getUserById(Integer.valueOf(id));
			mv.addObject("user",user);
			mv.setViewName("/mobile/user_info");
		}
		return mv;
	}
	
	/**
	 * 专家顾问详情
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/expertDetail")
	public ModelAndView expertDetail(String id) throws Exception{
		ModelAndView mv = this.getModelAndView();
		if(null != id && !"".equals(id)){
			WebUser user = webUserWebService.getUserById(Integer.valueOf(id));
			mv.addObject("user",user);
		}
		mv.setViewName("/expert_details");
		return mv;
	}
}
