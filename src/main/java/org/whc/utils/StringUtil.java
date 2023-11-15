package org.whc.utils;

/**
 * 字符串工具类
 */
public class StringUtil {
    /**
     * 判断字符串是否为空
     * @param str
     * @return
     */
    public static boolean isEmpty(String str){
        if (str == null ||"".equals(str.trim())){
            return true;
        }
        return false;
    }
}
