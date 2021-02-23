package com.jns.common;

public abstract class Validation 
{
	public static boolean strValidation(String str)
	{
		return str != null && str.length() > 0;
	}
}
