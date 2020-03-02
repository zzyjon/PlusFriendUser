package com.zlgoon.plusFriend.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 문자열 관련 유틸리티
 * 
 *
 */
public class StringUtil {
	
	/**
	   *  Map 의 value 값을 가져온다 (String)
	   * 
	   * @param map
	   * @param key
	   * @param defaultValue
	   * @return String
	   */
	  public static String getMapItem(Map<String, Object> map, String key, String defaultValue) {
	    Object obj = map.get(key);
	    return (obj == null) ? defaultValue : String.valueOf(obj);
	  }
	
	/**
	 * str이 null 또는 "null"일 경우 defaultStr 리턴
	 * 
	 * @param	str
	 * @param	defaultStr
	 * @return	str 또는 defaultStr
	 */
	public static final String getDefaultStrIfNull(String str, String defaultStr) {
		String returnStr = str;
		
		if(str == null || "null".equals(str)) {
			returnStr = defaultStr;
		}
		
		return returnStr;
	}
	
	/**
	 * str이 null 또는 "null"일 경우 '' 리턴
	 * 
	 * @param	str
	 * @param	defaultStr
	 * @return	str 또는 defaultStr
	 */
	public static final String getStrIfNull(String str) {
		String returnStr = str;
		
		if(str == null || "null".equals(str)) {
			returnStr = "";
		}
		
		return returnStr;
	}

	/**
	 * 모든 문자열 치환
	 * @param str
	 * @param target
	 * @param replace
	 * @return
	 */
	public static final String replaceAll(String str, String target, String replace) {
		String sTarget = str;
		String sOldStr = target;
		String sNewStr = replace;
	
		int nPos, nOffset = 0;
		if (sOldStr == null || sOldStr.length() == 0)
			return sTarget;
		if (sNewStr == null)
			sNewStr = "";
	
		while ((nPos = (sTarget.substring(nOffset, sTarget.length()))
				.indexOf(sOldStr)) > -1) {
			sTarget = sTarget.substring(0, nOffset + nPos)
					+ sNewStr
					+ sTarget.substring(nOffset + nPos + sOldStr.length(),
							sTarget.length());
			nOffset = nOffset + nPos + sNewStr.length();
		}

		return sTarget;
	}

	/**
	 * 문자열 분할
	 * 
	 * @param str
	 * @param delim
	 * @return
	 */
	public static final String[] split(String str, String delim) {
		if (str == null) return null;
	
		StringTokenizer stk = new StringTokenizer(str, delim);
	
		List<String> list = new ArrayList<String>();
	
		while (stk.hasMoreElements())
			list.add(stk.nextToken());
	
		int size = list.size();
	
		String[] arrStr = new String[size];
	
		for (int i = 0; i < size; i++)
			arrStr[i] = list.get(i);
	
		return arrStr;
	}

	/**
	 * 문자열이 빈 값인지를 검사함
	 * 
	 * @param value
	 * @return
	 */
	public static final boolean isEmpty(CharSequence value){
		if(value==null) return true;
		else if("".equals(value)) return true;
		else if("null".equals(value)) return true;
		else return false;
	}

	/**
	 * 문자열이 빈 값이 아닌지를 검사함
	 * @param value
	 * @return
	 */
	public static final boolean isNotEmpty(CharSequence value){
		return !isEmpty(value);
	}
	
	/**
	 * 이메일 주소가 유효한지 검사
	 * 
	 * @param email
	 * @return
	 */
	public static final boolean isValidEmailAddress(String email){
		if(isEmpty(email)) return false;
		
		Pattern p = Pattern.compile("^(?:\\w+\\.?)*\\w+@(?:\\w+\\.)+\\w+$");
		Matcher m = p.matcher(email);
		return m.matches();
	}
	
	/**
	 * 정책국가 외에는 ETC로 분류
	 * 
	 * @param country_code
	 * @return
	 */
	public static String isEtcLanguage(String country_code){
		String [] code = {"KR","US","CN","JP","DE","GB","FR","ES","IT"};
		boolean flag = false;
		if(!StringUtil.isEmpty(country_code)){
			for(String c : code){
				if(c.equalsIgnoreCase(country_code)){
					flag = true;
				}
			}
		}else{
			return "KR";
		}
		return (flag) ? country_code : "ETC";
		
	}
	
	/**
	 * DateTimepicker의 yyyy/MM/dd hh:mm 형식을 14자리 string 문자열 형태로 치환한다.
	 * @param date
	 * @return String
	 */
	public static String dateFormatToString(String date) {
		String year = date.substring(0, 4);
		String month = date.substring(5, 7);
		String day = date.substring(8, 10);
		String hour = date.substring(11, 13);
		String min = date.substring(14);
		
		return year.concat(month).concat(day).concat(hour).concat(min).concat("00");
	}
	
	/**
	 * yyyyMMddhhmmss 형식을 DateTimepicker의 형식으로 변환 yyyy/MM/dd hh:mm
	 * @param str
	 * @return
	 */
	public static String stringToDateFormat(String str) {
		String year = str.substring(0, 4);
		String month = str.substring(4, 6);
		String day = str.substring(6, 8);
		String hour = str.substring(8, 10);
		String min = str.substring(10, 12);
		return String.format("%s/%s/%s %s:%s", year, month, day, hour, min);
	}
	
	
	public static Map<String, Object> returnToMapOfEventAttr(String attrKey, String attrVal, String keyName) {
		Map<String, Object> map = new HashMap<>();
		map.put("attrKey", attrKey);
		map.put("attrVal", attrVal);
		map.put("keyName", keyName);
		return map;
	}
	
	//2017-10-28 14:07:18~2017-11-05 14:07:18
	
	public static String replaceDate(String data) {
		if (data.indexOf("-") > -1 || data.indexOf(".") > -1 || data.indexOf(",") > -1 || data.indexOf(" ") > -1 || data.indexOf(":") > -1 ) {
			String number1 = StringUtil.replaceAll(data, "-", "");
			String number2 = StringUtil.replaceAll(number1, ".", "");
			String number3 = StringUtil.replaceAll(number2, ",", "");
			String number4 = StringUtil.replaceAll(number3, ":", "");
			data = StringUtil.replaceAll(number4, " ", "");
		}

		return data;
	}
	
	// 특정 문자열의 존재여부 체크 및 변환
	public static String replaceMobileNum(String number) {
		if (number.indexOf("-") > -1 || number.indexOf(".") > -1 || number.indexOf(",") > -1 || number.indexOf(" ") > -1) {
			String number1 = StringUtil.replaceAll(number, "-", "");
			String number2 = StringUtil.replaceAll(number1, ".", "");
			String number3 = StringUtil.replaceAll(number2, ",", "");
			number = StringUtil.replaceAll(number3, " ", "");
		}

		return number;
	}
	
	public static String replaceMobileNumMultiplex(String number) {
		if (number.indexOf("-") > -1 || number.indexOf(".") > -1 || number.indexOf(",") > -1 || number.indexOf(" ") > -1) {
			String number1 = StringUtil.replaceAll(number, "-", "");
			String number2 = StringUtil.replaceAll(number1, ".", "");
			number = StringUtil.replaceAll(number2, " ", "");
		}

		return number;
	}

	public static String lengthLimit(String inputStr, int limit, String fixStr) {
		if (inputStr == null)
			return "";

		if (limit <= 0)
			return inputStr;

		byte[] strbyte = null;

		strbyte = inputStr.getBytes();

		if (strbyte.length <= limit) {
			return inputStr;
		}

		char[] charArray = inputStr.toCharArray();

		int checkLimit = limit;
		for (int i = 0; i < charArray.length; i++) {
			if (charArray[i] < 256) {
				checkLimit -= 1;
			} else {
				checkLimit -= 2;
			}

			if (checkLimit <= 0) {
				break;
			}
		}

		// 대상 문자열 마지막 자리가 2바이트의 중간일 경우 제거함
		byte[] newByte = new byte[limit + checkLimit];

		for (int i = 0; i < newByte.length; i++) {
			newByte[i] = strbyte[i];
		}

		if (fixStr == null) {
			return new String(newByte);
		} else {
			return new String(newByte) + fixStr;
		}
	}
	
	public static boolean isNumeric(String str) {
		  try {
		      Double.parseDouble(str);
		      return true;
		  } catch(NumberFormatException e) {
		      return false;
		  }
	}
	
	
	public static String replaceYearMonth(String str) {
		if(isNotEmpty(str)) {
			str.replaceAll("/", "");
		}
		
		return str;
	}
	
	/* 이모지 변환 함수 */
	public static String replaceEmoji(String str) {
		Pattern emoticons = Pattern.compile("[\\uD83C-\\uDBFF\\uDC00-\\uDFFF]+");
		Matcher emoticonsMatcher = emoticons.matcher(str);
		
		return emoticonsMatcher.replaceAll(""); 
	}

	
	
}
