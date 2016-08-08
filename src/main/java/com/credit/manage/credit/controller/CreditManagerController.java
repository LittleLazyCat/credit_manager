package com.credit.manage.credit.controller;

import java.util.Date;
import java.util.List;

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
import com.credit.manage.filemanager.service.UploadFileService;
import com.credit.manage.util.ProvinceEnum;
import com.gvtv.manage.base.controller.BaseController;
import com.gvtv.manage.base.system.controller.UserController;
import com.gvtv.manage.base.util.DataUtil;
import com.gvtv.manage.base.util.PageData;
import com.gvtv.manage.base.util.PropertiesUtil;

@Controller
@RequestMapping(value = "/credit")
public class CreditManagerController extends BaseController{
	private static Logger logger = LoggerFactory.getLogger(CreditManagerController.class);
	@Resource
	private CreditManagerService creditManagerService;
	@Resource
	private UploadFileService uploadFileService;

	@RequestMapping
	public ModelAndView page() {
		PageData pd = super.getPageData();
		ModelAndView mv = super.getModelAndView();
		mv.addObject("pd", pd);
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
		String showImgPath = PropertiesUtil.getValue("showImgPath");
		ModelAndView mv = super.getModelAndView();
		mv.addObject("showImgPath", showImgPath);
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
		List<String> provinceList = ProvinceEnum.takeAllValues();//省份list
		ModelAndView mv = this.getModelAndView();
		PageData pd = super.getPageData();
		mv.addObject("pd", pd);
		mv.addObject("provinceList", provinceList);
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
			String images = "";
			if(null != credit.getUploadFiles()){
				for(int i=0;i< credit.getUploadFiles().length;i++){
					if(0 != credit.getUploadFiles()[i].getSize()){
						String newFileName = DataUtil.getRandomStr();
						String fileName = credit.getUploadFiles()[i].getOriginalFilename();
						fileName = "credit"+newFileName + fileName.substring(fileName.lastIndexOf("."), fileName.length());
						uploadFileService.uploadFile(PropertiesUtil.getValue("saveImgPath")+"uploadFile/credit", credit.getUploadFiles()[i], fileName);
						if(i == 0){
							images += "uploadFile/credit/"+fileName;
						}else{
							images += ";uploadFile/credit/"+fileName;
						}
					}
				}
			}
			credit.setDebtProof(images);
			credit.setCreateDate(new Date());
			credit.setCrStatus((short)1);
			credit.setIsAudit(0);
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
		List<String> provinceList = ProvinceEnum.takeAllValues();//省份list
		mv.addObject("provinceList", provinceList);
		mv.addObject("credit", credit);
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
			String images = "";
			if(null != credit.getUploadFiles()){
				for(int i=0;i< credit.getUploadFiles().length;i++){
					if(0 != credit.getUploadFiles()[i].getSize()){
						String newFileName = DataUtil.getRandomStr();
						String fileName = credit.getUploadFiles()[i].getOriginalFilename();
						fileName = "credit"+newFileName + fileName.substring(fileName.lastIndexOf("."), fileName.length());
						uploadFileService.uploadFile(PropertiesUtil.getValue("saveImgPath")+"uploadFile/credit", credit.getUploadFiles()[i], fileName);
						if(i == 0){
							images += "uploadFile/credit/"+fileName;
						}else{
							images += ";uploadFile/credit/"+fileName;
						}
					}
				}
			}
			credit.setDebtProof(images);
			int num= creditManagerService.update(credit);
			if(num>0){
				result.put("status", 1);
			}
		} catch (Exception e) {
			logger.error("edit credit error", e);
			result.put("status", 0);
			result.put("msg", "更新失败");
		}
		return result;
	}
		
	/**
	 * 跳转到更新法律文件信息页面
	 * @return
	 */
	@RequestMapping(value="/audit", method=RequestMethod.GET)
	public ModelAndView toAudit(@RequestParam Integer id){
		Credit credit = null;
		try {
			credit = creditManagerService.findById(id);
		} catch (Exception e) {
			logger.error("get fileManager error", e);
		}
		ModelAndView mv = super.getModelAndView();
		mv.addObject("credit", credit);
		mv.setViewName("credit/credit/credit_audit");
		return mv;
	}
	
	/**
	 * 更新法律文件信息
	 * @return
	 */
	@RequestMapping(value="/audit", method=RequestMethod.POST)
	@ResponseBody
	public PageData audit(Credit credit){
		PageData result = new PageData();
		try {
			int num= creditManagerService.updateAudit(credit);
			if(num>0){
				result.put("status", 1);
				result.put("msg", "审核成功");
			}
		} catch (Exception e) {
			logger.error("edit filemanager error", e);
			result.put("status", 0);
			result.put("msg", "审核失败");
		}
		return result;
	}
	
	
	/**
	 * 修改债权状态
	 * @param credit
	 * @return
	 */
	@RequestMapping(value="/updateStatus")
	@ResponseBody
	public PageData updateStatus(Credit credit){
		PageData result = new PageData();
		try {
			int num= creditManagerService.updateStatus(credit);
			if(num>0){
				result.put("status", 1);
			}
		} catch (Exception e) {
			logger.error("edit credit error", e);
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
