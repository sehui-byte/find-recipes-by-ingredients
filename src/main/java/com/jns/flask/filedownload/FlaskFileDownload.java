package com.jns.flask.filedownload;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jns.recipe.controller.RecipeController;

@Controller
public class FlaskFileDownload {

//=======================test=========================

	@RequestMapping(value = "testDownload", method = RequestMethod.GET)
	public String Test(Model model, HttpServletRequest request ) {
		
		ModelAndView mav = new ModelAndView();
		/*
		 * ================================================flask 웹 페이지 내부 string을 읽어온다.
		 * String sb = ""; try { HttpURLConnection conn = (HttpURLConnection) new
		 * URL(url).openConnection();
		 * 
		 * BufferedReader br = new BufferedReader(new
		 * InputStreamReader(conn.getInputStream(), "utf-8"));
		 * 
		 * String line = null;
		 * 
		 * while ((line = br.readLine()) != null) { sb = sb + line + "\n"; }
		 * System.out.println("========br======" + sb.toString()); if
		 * (sb.toString().contains("ok")) { System.out.println("test");
		 * 
		 * } br.close();
		 * 
		 * System.out.println("" + sb.toString()); } catch (MalformedURLException e) {
		 * e.printStackTrace(); } catch (IOException e) { // TODO Auto-generated catch
		 * block e.printStackTrace(); } mav.addObject("test1", sb.toString()); //
		 * "test1"는 jsp파일에서 받을때 이름, // sb.toString은 value값(여기에선 test)
		 * mav.addObject("fail", false); mav.setViewName("test"); // jsp파일 이름 return
		 * mav;
		 */
		// =============================================웹 페이지를 그대로 가져옴 사진도
		/*
		 * URL url = null; HttpURLConnection conn = null; String jsonData = "";
		 * BufferedReader br = null; StringBuffer sb = null; String returnText = "";
		 * 
		 * try { url = new URL("http://localhost:5000/tospring");
		 * 
		 * conn = (HttpURLConnection) url.openConnection();
		 * conn.setRequestProperty("Accept", "application/json");
		 * conn.setRequestMethod("GET"); conn.connect();
		 * 
		 * br = new BufferedReader(new InputStreamReader(conn.getInputStream(),
		 * "UTF-8"));
		 * 
		 * sb = new StringBuffer();
		 * 
		 * while ((jsonData = br.readLine()) != null) { sb.append(jsonData); }
		 * 
		 * returnText = sb.toString();
		 * 
		 * } catch (IOException e) { e.printStackTrace(); } finally { try { if (br !=
		 * null) br.close(); } catch (IOException e) { e.printStackTrace(); } }
		 * model.addAttribute("returnText", returnText);
		 */
		String spec = "http://localhost:5000/static/image/test.png";

		String outputDir = request.getServletContext().getRealPath("resources/graph");
		System.out.println(outputDir);
//		String outputDir = "D:/sample/output/download";
		InputStream is = null;
		FileOutputStream os = null;
		try {
			URL url = new URL(spec);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			int responseCode = conn.getResponseCode();

			System.out.println("responseCode " + responseCode);

			// Status 가 200 일 때
			if (responseCode == HttpURLConnection.HTTP_OK) {
				String fileName = "";
				String disposition = conn.getHeaderField("Content-Disposition");
				String contentType = conn.getContentType();

				// 일반적으로 Content-Disposition 헤더에 있지만
				// 없을 경우 url 에서 추출해 내면 된다.
				if (disposition != null) {
					String target = "filename=";
					int index = disposition.indexOf(target);
					if (index != -1) {
						fileName = disposition.substring(index + target.length() + 1);
					}
				} else {
					fileName = spec.substring(spec.lastIndexOf("/") + 1);
				}

				System.out.println("Content-Type = " + contentType);
				System.out.println("Content-Disposition = " + disposition);
				System.out.println("fileName = " + fileName);

				is = conn.getInputStream();
				os = new FileOutputStream(new File(outputDir, fileName));

				final int BUFFER_SIZE = 4096;
				int bytesRead;
				byte[] buffer = new byte[BUFFER_SIZE];
				while ((bytesRead = is.read(buffer)) != -1) {
					os.write(buffer, 0, bytesRead);
				}
				os.close();
				is.close();
				System.out.println("File downloaded");
			} else {
				System.out.println("No file to download. Server replied HTTP code: " + responseCode);
			}
			conn.disconnect();
		} catch (Exception e) {
			System.out.println("An error occurred while trying to download a file.");
			e.printStackTrace();
			try {
				if (is != null) {
					is.close();
				}
				if (os != null) {
					os.close();
				}
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}

		return "recipe/recipedetail";
	}
}
