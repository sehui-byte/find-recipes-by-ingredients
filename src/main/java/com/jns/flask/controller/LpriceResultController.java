package com.jns.flask.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


public class LpriceResultController {
	
	@RequestMapping(value="lpriceflask.do", method=RequestMethod.GET)
	@ResponseBody
	public String lpriceResult(@RequestParam(defaultValue="") String flaskurl) {
		System.out.println(flaskurl);
		return flaskurl;
	}
}
