package com.jns.common;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import org.apache.log4j.Logger;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public class FileUploadUtil 
{
	private Logger logger = Logger.getLogger(FileUploadUtil.class);
	
	public String uploadFile(MultipartHttpServletRequest request, String dir_name) // single file upload
	{
		if(request != null)
		{
			//file upload location
			String basepath = request.getServletContext().getRealPath("WEB-INF\\files\\" + dir_name);
			if(dir_name != null && new File(basepath).isDirectory())
			{
				logger.info("basepath >>> : " + basepath);
				
				//=============== upload file to path ===============//
				Iterator<String> names = request.getFileNames();
				Map<String, MultipartFile> map = request.getFileMap();
				String key = null;
				
				logger.info("단일 파일 업로드 메소드 호출, 길이 >>> : " + map.size());
				
				while(names.hasNext())
				{
					String name = names.next();
					MultipartFile mpf = map.get(name);
					logger.info("name >>> : " + name);
					int pos = mpf.getOriginalFilename().lastIndexOf(".");
					String extension = mpf.getOriginalFilename().substring(pos + 1);
					logger.info("extension >>> : " + extension);
					
					key = getUUIDKey(basepath); //create key					
					File file = new File(basepath + "\\" + key + "." + extension);
					FileOutputStream fos = null;
					try 
					{
						fos = new FileOutputStream(file);
						fos.write(mpf.getBytes());
												
						fos.close();
						fos = null;
					} 
					catch (Exception e) 
					{
						e.printStackTrace();
					}
					finally 
					{
						if(fos != null)
						{
							try
							{
								fos.close();
								fos = null;
							}
							catch (Exception ignore) 
							{
								
							}
						}
					}
				}
				return key; //return key
			}
			else
			{
				logger.info("지정된 경로에 디렉토리가 존재하지 않음");
				logger.info("basepath >>> : " + basepath);
			}
		}
		else
		{
			logger.info("request is null");
		}
		return null;
	}
	
	public List<String> uploadFiles(MultipartHttpServletRequest request, String dir_name) // multi file upload
	{
		if(request != null)
		{
			//file upload location
			String basepath = request.getServletContext().getRealPath("WEB-INF\\files\\" + dir_name);
			if(dir_name != null && new File(basepath).isDirectory())
			{
				logger.info("basepath >>> : " + basepath);
				
				//=============== upload files to path ===============//
				Iterator<String> names = request.getFileNames();
				Map<String, MultipartFile> map = request.getFileMap();
				List<String> keyList = new ArrayList<String>();
				
				logger.info("단일 파일 업로드 메소드 호출, 길이 >>> : " + map.size());
				
				while(names.hasNext())
				{
					System.out.println("asdfasdf");
					String name = names.next();
					MultipartFile mpf = map.get(name);
					logger.info("name >>> : " + name);
					int pos = mpf.getOriginalFilename().lastIndexOf(".");
					String extension = mpf.getOriginalFilename().substring(pos + 1);
					logger.info("extension >>> : " + extension);

					String key = getUUIDKey(basepath); //create key
					File file = new File(basepath + "\\" + key + "." + extension);
					FileOutputStream fos = null;
					try 
					{
						fos = new FileOutputStream(file);
						fos.write(mpf.getBytes());
						
						keyList.add(key);
						
						fos.close();
						fos = null;
					} 
					catch (Exception e) 
					{
						e.printStackTrace();
					}
					finally 
					{
						if(fos != null)
						{
							try
							{
								fos.close();
								fos = null;
							}
							catch (Exception ignore) 
							{
								
							}
						}
					}
				}
				return keyList; //return key
			}
			else
			{
				logger.info("지정된 경로에 디렉토리가 존재하지 않음");
				logger.info("basepath >>> : " + basepath);
			}
		}
		else
		{
			logger.info("request is null");
		}
		return null;
	}
	
	private String getUUIDKey(String path)
	{
		String key;
		do 
		{
			key = UUID.randomUUID().toString();
		} 
		while (new File(path + "\\" + key).exists()); //이미 같은 이름의 파일이 존재하면 키 다시 생성
		 
		return key;
	}//유니크한 키 발행
}
