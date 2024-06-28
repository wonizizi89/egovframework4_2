package egovframework.example.cmmn;


import com.google.common.base.CaseFormat;

import java.util.HashMap;

public class EgovMap extends HashMap {
    private static final long serialVersionUID = 1l;

    public  Object put(Object key, Object value){
        return super.put(CaseFormat.UPPER_UNDERSCORE.to(CaseFormat.LOWER_CAMEL, (String) key), value);
    }
}