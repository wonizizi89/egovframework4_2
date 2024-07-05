package kr.or.woniProject.cmmn.sys.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.FactoryBean;

public class HtmlEscapingObjectMappingFactory implements FactoryBean<ObjectMapper> {

    private final ObjectMapper objectMapper;

    public HtmlEscapingObjectMappingFactory() {
        objectMapper = new ObjectMapper();
        objectMapper.getFactory().setCharacterEscapes(new HTMLCharacterEscapes());

    }

    // 3. ObjectMapper에 특수 문자 처리 기능 적용
    @Override
    public ObjectMapper getObject() throws Exception {
        return objectMapper;
    }

    @Override
    public Class<?> getObjectType() {
        return objectMapper.getClass();
    }

    @Override
    public boolean isSingleton() {
        return true; // FactoryBean.super.isSingleton(); = true;
    }

}
