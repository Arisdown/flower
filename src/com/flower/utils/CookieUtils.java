package com.flower.utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

public class CookieUtils {
        public static Cookie getCookieByName(String name,Cookie[] cookies){
	        if(cookies!=null){
		        for(Cookie cookie:cookies){
			        if(cookie.getName().equals(name)){
				        return cookie;
			        }
		        }
	        }
	        return null;
        }
        public static void addCookie(HttpServletResponse response, String name,String list, int maxAge) {        
	        Cookie cookie = new Cookie(name, list);
	        cookie.setPath("/");
	        if (maxAge>0) cookie.setMaxAge(maxAge);
	        response.addCookie(cookie);
       }
}
