package com.jns.common;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class RecipeInsertUtil 
{
	private SqlSession sqlSession;
	
	@Autowired
	public boolean insertRecipe()
	{
		return false;
	}
}
