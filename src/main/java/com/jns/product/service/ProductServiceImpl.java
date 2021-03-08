package com.jns.product.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.socket.WebSocketSession;

import com.jns.chabun.dao.ChabunDAO;
import com.jns.member.vo.MemberVO;
import com.jns.product.dao.ProductDAO;
import com.jns.product.vo.ProductVO;

@Service
@Transactional
public class ProductServiceImpl implements ProductService{



	private Logger logger = Logger.getLogger(ProductServiceImpl.class);
	private ProductDAO pdao;

	@Autowired(required=false)
	public ProductServiceImpl(ProductDAO pdao) {
		this.pdao = pdao;

	}

	@Override
	public String naverSearchApi(String keyword) {
		String clientId = "4nUbUv8Xsm1NJhFkpJXO"; //애플리케이션 클라이언트 아이디값"
		String clientSecret = "puxx2OuGzl"; //애플리케이션 클라이언트 시크릿값"
		String display = "&display=100";//출력검색 결과 (최대:100)
		String text = null;

		try {
			text = URLEncoder.encode(keyword, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			throw new RuntimeException("검색어 인코딩 실패",e);
		}

		String apiURL = "https://openapi.naver.com/v1/search/shop?query=" + text + display;    // json 결과

		Map<String, String> requestHeaders = new HashMap<>();
		requestHeaders.put("X-Naver-Client-Id", clientId);
		requestHeaders.put("X-Naver-Client-Secret", clientSecret);
		String responseBody = get(apiURL,requestHeaders);
		System.out.println("responseBody" + responseBody);
		
		return responseBody;
	}

	private static String get(String apiUrl, Map<String, String> requestHeaders){
		HttpURLConnection con = connect(apiUrl);
		try {
			con.setRequestMethod("GET");
			for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
				con.setRequestProperty(header.getKey(), header.getValue());
			}

			int responseCode = con.getResponseCode();
			if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
				return readBody(con.getInputStream());
			} else { // 에러 발생
				return readBody(con.getErrorStream());
			}
		} catch (IOException e) {
			throw new RuntimeException("API 요청과 응답 실패", e);
		} finally {
			con.disconnect();
		}
	}

	private static HttpURLConnection connect(String apiUrl){
		try {
			URL url = new URL(apiUrl);
			return (HttpURLConnection)url.openConnection();
		} catch (MalformedURLException e) {
			throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
		} catch (IOException e) {
			throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
		}
	}

	private static String readBody(InputStream body){
		InputStreamReader streamReader = new InputStreamReader(body);

		try (BufferedReader lineReader = new BufferedReader(streamReader)) {
			StringBuilder responseBody = new StringBuilder();

			String line;
			while ((line = lineReader.readLine()) != null) {
				responseBody.append(line);
			}

			return responseBody.toString();
		} catch (IOException e) {
			throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
		}
	}

	/*
	 * //관심상품 전체조회
	 * 
	 * @Override public List<ProductVO> likeProductSelectAll(ProductVO pvo) {
	 * pvo.setMno(getLoginMno(pvo));
	 * 
	 * List<ProductVO> result = pdao.LikeProductSelectAll(pvo);
	 * logger.info("관심상품 개수 >> " + result.size());
	 * 
	 * return result; }
	 */

	//관심상품 등록
	@Override
	public int likeProductInsert(ProductVO pvo) {
		pvo.setMno(getLoginMno(pvo));
		
		int nCnt = pdao.likeProductInsert(pvo);
		logger.info("회원번호>>" + pvo.getMno());
		logger.info("최저가>>" + pvo.getLprice());
		logger.info("이미지>>" + pvo.getImage());
		logger.info("상품명>>" + pvo.getTitle());
		logger.info("링크>>" + pvo.getLink());
		logger.info("삽입된 컬럼 수 >> " + nCnt);
		return nCnt;
	}

	//관심상품 삭제
	@Override
	public int likeProductDelete(ProductVO pvo) {
		pvo.setMno(getLoginMno(pvo));
		logger.info("productid >> " + pvo.getProductId());
		logger.info("mno >> " + pvo.getMno());
		int nCnt = pdao.likeProductDelete(pvo);
		logger.info("삭제된 컬럼 수 >> " + nCnt);
		return nCnt;
	}


	//로그인한 사용자 mno가져오기
	private String getLoginMno(ProductVO pvo) {
		//로그인 사용자 mno 가져오기
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Object principal = auth.getPrincipal();
		String mno = ((MemberVO)principal).getMno();
		//System.out.println("mno >>" + mno);
		
		return mno;
	}

	//로그인한 유저의 관심상품 중 productid만 가져오기
	@Override
	public List<ProductVO> likpProductIdSelectAll(ProductVO pvo) {
		pvo.setMno(getLoginMno(pvo));
		List<ProductVO> result = pdao.likpProductIdSelectAll(pvo);
		return result;
	}
	
	
	//로그인한 유저의 관심상품 중 productId, title, lprice, image 가져오기
	@Override
	public List<ProductVO> getlikeProInfoSelectAll(ProductVO pvo) {
		pvo.setMno(getLoginMno(pvo));
		List<ProductVO> result = pdao.getlikeProInfoSelectAll(pvo);
		return result;
	}
	
	//관심상품 페이징 
	@Override
	public List<ProductVO> likeProductpaging(ProductVO pvo) {
		// TODO Auto-generated method stub
		
		pvo.setMno(getLoginMno(pvo));

		List<ProductVO> result = pdao.likeProductpaging(pvo);
		
		logger.info("관심상품 개수 >> " + result.size());
		
		return result;
	}

}
