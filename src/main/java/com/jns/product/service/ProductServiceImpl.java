package com.jns.product.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

	//관심상품 전체조회
	@Override
	public List<ProductVO> likeProductSelectAll() {
		List<ProductVO> result = pdao.LikeProductSelectAll();
		return result;
	}

	//관심상품 등록
	@Override
	public int likeProductInsert(ProductVO pvo) {
		int nCnt = pdao.likeProductInsert(pvo);
		System.out.println("삽입된 컬럼 수 >> " + nCnt);
		return nCnt;
	}

	//관심상품 삭제
	@Override
	public int likeProductDelete(ProductVO pvo) {
		int nCnt = pdao.likeProductDelete(pvo);
		System.out.println("삭제된 컬럼 수 >> " + nCnt);
		return nCnt;
	}
}
