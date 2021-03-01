package com.jns.recipe.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import org.apache.commons.io.IOUtils;
import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jns.recipe.dao.RecipeDAO;
import com.jns.recipe.vo.RecipeVO;

@Service
@Transactional
public class RecipeServiceImpl implements RecipeService 
{
	private RecipeDAO recipeDAO;
	private Logger logger = Logger.getLogger(RecipeServiceImpl.class);
	
	public RecipeServiceImpl() 
	{

	}//Default Constructor
	
	@Autowired(required = false)
	public RecipeServiceImpl(RecipeDAO recipeDAO)
	{
		this.recipeDAO = recipeDAO;
	}
	
	@Override
	public List<RecipeVO> recipeSelectAll() 
	{
		logger.info("[RecipeController] recipeSelectAll() >>> : 진입");
		List<RecipeVO> result = recipeDAO.recipeSelectAll();
		System.out.println("result.size >>> : " + result.size());
	
		return result;
	}
	
	@Override
	public List<RecipeVO> recipeSelectAllPage(RecipeVO rvo) 
	{
		return recipeDAO.recipeSelectAllPage(rvo);
	}

	@Override
	public RecipeVO recipeSelect(RecipeVO rvo) 
	{
		return recipeDAO.recipeSelect(rvo);
	}
	
	@Override
	public int recipeJsonInsert() 
	{
		System.out.println("Service 진입");
		
		System.out.println("진입");
		int cnt = 0;
		FileInputStream fis = null;
		try
		{
			fis = new FileInputStream(new File("C:\\Users\\red\\git\\kosmoJns\\src\\main\\java\\com\\jns\\common\\recipe.json"));
			String jsonString = IOUtils.toString(fis);
			
			JSONObject jsonObj = new JSONObject((JSONObject)new JSONParser().parse(jsonString));
			JSONArray rows = (JSONArray)jsonObj.get("row");
			System.out.println("row.size >>> : " + rows.size());
			for(int i=0; i<rows.size(); i++)
			{
				HashMap<String, Object> currentRow = (HashMap<String, Object>)rows.get(i);
				
				RecipeVO rvo = new RecipeVO();
				rvo.setRcp_seq((String)currentRow.get("RCP_SEQ"));
				rvo.setRcp_nm((String)currentRow.get("RCP_NM"));
				rvo.setRcp_way2((String)currentRow.get("RCP_WAY2"));
				rvo.setRcp_pat2((String)currentRow.get("RCP_PAT2"));
				rvo.setInfo_wgt((String)currentRow.get("INFO_WGT"));
				rvo.setInfo_eng((String)currentRow.get("INFO_ENG"));
				rvo.setInfo_car((String)currentRow.get("INFO_CAR"));
				rvo.setInfo_pro((String)currentRow.get("INFO_PRO"));
				rvo.setInfo_fat((String)currentRow.get("INFO_FAT"));
				rvo.setInfo_na((String)currentRow.get("INFO_NA"));
				rvo.setHash_tag((String)currentRow.get("HASH_TAG"));
				rvo.setAtt_file_no_main((String)currentRow.get("ATT_FILE_NO_MAIN"));
				rvo.setAtt_file_no_mk((String)currentRow.get("ATT_FILE_NO_MK"));
				rvo.setRcp_parts_dtls((String)currentRow.get("RCP_PARTS_DTLS"));
				rvo.setManual01((String)currentRow.get("MANUAL01"));
				rvo.setManual_img01((String)currentRow.get("MANUAL_IMG01"));
				rvo.setManual02((String)currentRow.get("MANUAL02"));
				rvo.setManual_img02((String)currentRow.get("MANUAL_IMG02"));
				rvo.setManual03((String)currentRow.get("MANUAL03"));
				rvo.setManual_img03((String)currentRow.get("MANUAL_IMG03"));
				rvo.setManual04((String)currentRow.get("MANUAL04"));
				rvo.setManual_img04((String)currentRow.get("MANUAL_IMG04"));
				rvo.setManual05((String)currentRow.get("MANUAL05"));
				rvo.setManual_img05((String)currentRow.get("MANUAL_IMG05"));
				rvo.setManual06((String)currentRow.get("MANUAL06"));
				rvo.setManual_img06((String)currentRow.get("MANUAL_IMG06"));
				rvo.setManual07((String)currentRow.get("MANUAL07"));
				rvo.setManual_img07((String)currentRow.get("MANUAL_IMG07"));
				rvo.setManual08((String)currentRow.get("MANUAL08"));
				rvo.setManual_img08((String)currentRow.get("MANUAL_IMG08"));
				rvo.setManual09((String)currentRow.get("MANUAL09"));
				rvo.setManual_img09((String)currentRow.get("MANUAL_IMG09"));
				rvo.setManual10((String)currentRow.get("MANUAL10"));
				rvo.setManual_img10((String)currentRow.get("MANUAL_IMG10"));
				rvo.setManual11((String)currentRow.get("MANUAL11"));
				rvo.setManual_img11((String)currentRow.get("MANUAL_IMG11"));
				rvo.setManual12((String)currentRow.get("MANUAL12"));
				rvo.setManual_img12((String)currentRow.get("MANUAL_IMG12"));
				rvo.setManual13((String)currentRow.get("MANUAL13"));
				rvo.setManual_img13((String)currentRow.get("MANUAL_IMG13"));
				rvo.setManual14((String)currentRow.get("MANUAL14"));
				rvo.setManual_img14((String)currentRow.get("MANUAL_IMG14"));
				rvo.setManual15((String)currentRow.get("MANUAL15"));
				rvo.setManual_img15((String)currentRow.get("MANUAL_IMG15"));
				rvo.setManual16((String)currentRow.get("MANUAL16"));
				rvo.setManual_img16((String)currentRow.get("MANUAL_IMG16"));
				rvo.setManual17((String)currentRow.get("MANUAL17"));
				rvo.setManual_img17((String)currentRow.get("MANUAL_IMG17"));
				rvo.setManual18((String)currentRow.get("MANUAL18"));
				rvo.setManual_img18((String)currentRow.get("MANUAL_IMG18"));
				rvo.setManual19((String)currentRow.get("MANUAL19"));
				rvo.setManual_img19((String)currentRow.get("MANUAL_IMG19"));
				rvo.setManual20((String)currentRow.get("MANUAL20"));
				rvo.setManual_img20((String)currentRow.get("MANUAL_IMG20"));
				
				cnt += recipeDAO.recipeJsonInsert(rvo);
			}
		}
		catch(Exception e)
		{
			System.out.println("error >>> : " + e);
		}
		finally 
		{
			try {
				fis.close();
				fis = null;
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return cnt;
	}

	@Override
	public List<RecipeVO> searchRecipe(RecipeVO rvo) {
		return recipeDAO.searchRecipe(rvo);
	}

//	@Override
//	public boolean recipeInsert(RecipeVO rvo) {
//		// TODO Auto-generated method stub
//		return false;
//	}
//
//	@Override
//	public boolean recipeUpdate(RecipeVO rvo) {
//		// TODO Auto-generated method stub
//		return false;
//	}
//
//	@Override
//	public boolean recipeDelete(RecipeVO rvo) {
//		// TODO Auto-generated method stub
//		return false;
//	}
	
}
