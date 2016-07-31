package com.credit.manage.credit.controller;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.credit.manage.credit.service.CreditManagerService;
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
}
