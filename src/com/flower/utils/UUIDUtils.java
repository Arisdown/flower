package com.flower.utils;

import java.util.UUID;

public class UUIDUtils {
	/**����Id
	 * @return
	 */
	public static String getId(){
		return UUID.randomUUID().toString().replace("-","").toUpperCase();
	}
	public static String getCode(){
		return getId();
	}

}
