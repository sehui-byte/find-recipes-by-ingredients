package com.jns.chef.dao;

import java.util.List;

import com.jns.chef.vo.ChefVO;

public interface ChefDAO {

	public List<ChefVO> chefSelectAll(ChefVO cvo);
	public List<ChefVO> chefSelect(ChefVO cvo);
	public int chefInsert(ChefVO cvo);
	public int chefDelete(ChefVO cvo);
}
