package com.jns.common;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;

public class FileLoadUtil 
{
	private Logger logger = Logger.getLogger(FileLoadUtil.class);
	
	public String getFileSrc(HttpServletRequest request, String key)
	{
		String path = request.getServletContext().getRealPath("resources");
		File[] list = new File(path).listFiles();
		
		for(int i=0; i<list.length; i++)
		{
			if(list[i].isDirectory() && searchFile(list[i], key))
			{
				String dir_name = list[i].getName();
				
				logger.info("result >>> : " + "resources\\" + dir_name + "\\" + key);
				return "resources\\" + dir_name + "\\" + key;
			}
		}
		
		logger.info("파일이 존재하지 않습니다");
		return null;
	}// 전체 탐색으로 찾기
	
	public String getFileSrc(String dir_name, String key)
	{	
		return "resources\\" + dir_name + "\\" + key;
	}// 특정 디렉토리에서 찾기
	
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
	
	
	private boolean searchFile(File dir, String key)
	{
		String[] names = dir.list();
		
		for(int i=0; i<names.length; i++)
		{
			if(names[i].equals(key))
			{
				return true;
			}
		}
		
		return false;
	}
	

}
