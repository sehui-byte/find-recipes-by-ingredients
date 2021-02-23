package com.jns.common;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;

public class FileLoadUtil 
{
	private Logger logger = Logger.getLogger(FileLoadUtil.class);
	
	public String getFileSrc(String dir_name, String key)
	{
		return "resources\\" + dir_name + "\\" + key;
	}
	
	public String getFileRealPath(HttpServletRequest request, String dir_name, String key)
	{
		String path = request.getServletContext().getRealPath("resources\\" + dir_name) + "\\" + key;
		logger.info("src >>> : " + path);
		
		return path;
	}	
	
	public File getFile(HttpServletRequest request, String dir_name, String key)
	{
		String src = request.getServletContext().getRealPath("resources\\" + dir_name) + "\\" + key;
		logger.info("src >>> : " + src);
		
		File file = new File(src);
		logger.info("file.exists() >>> : " + file.exists());
		
		return file;
	}
	

}
