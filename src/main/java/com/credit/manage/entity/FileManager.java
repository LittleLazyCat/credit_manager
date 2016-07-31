package com.credit.manage.entity;

public class FileManager {

	private Integer id;
	// 文件类型
	private Short fileType;
	// 文件名称
	private String fileTitle;
	// 文件下载路径
	private String downloadUrl;

	public FileManager() {

	}

	public FileManager(Integer id, Short fileType, String fileTitle,
			String downloadUrl) {
		super();
		this.id = id;
		this.fileType = fileType;
		this.fileTitle = fileTitle;
		this.downloadUrl = downloadUrl;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Short getFileType() {
		return fileType;
	}

	public void setFileType(Short fileType) {
		this.fileType = fileType;
	}

	public String getFileTitle() {
		return fileTitle;
	}

	public void setFileTitle(String fileTitle) {
		this.fileTitle = fileTitle;
	}

	public String getDownloadUrl() {
		return downloadUrl;
	}

	public void setDownloadUrl(String downloadUrl) {
		this.downloadUrl = downloadUrl;
	}



}
