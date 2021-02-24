package com.jns.common;

public class Util {

	public static int nvl(String text) {
		
		return nvl(text, 0);
	}
	
	/***********************************************************
	* nvl() �޼���� ���ڿ��� ���ڷ� ��ȯ�ϴ� �޼���.
	* @param (���ڷ� ��ȯ�� ���ڿ�, �ʱⰪ���� ����� ��(��ü��))
	 
	���� : ���� ó���� üũ���ܿ� ��üũ���ܷ� ����.
	 
	üũ ���ܴ� ��������� / ��Ʈ��ũ ����� / �����ͺ��̽� �����.
	 
	�������� ��üũ ���ܷ� �ν�.
	* @return int 
	***********************************************************/

	public static int nvl(String text, int def){
		int ret = def;
		try{
		
			ret = Integer.parseInt(text);
		}catch(Exception e){
		
			ret = def;
		}
		return ret;
	}
	
	public static String nvl(Object text, String def){
		
		if(text==null || "".equals(text.toString().trim())){
		
			return def;
		}else{
		
			return text.toString();
		}
	}

}
