package kr.or.woniProject.cmmn.aop;


import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import java.util.Arrays;

@Aspect
@Component
public class LoggerAspect {
    public static final String FONT_GREEN = "\u001B[32m";
    public static final String RESET = "\u001B[0m";
    public static final String FONT_BLUE = "\u001B[34m";
    public static final Logger logger = LoggerFactory.getLogger(LoggerAspect.class);// SLF4j 경우 : LoggerFactory.getLogger()


    @Pointcut("execution(* kr.or.woniProject..*Controller.select*(..))")
        public void ControllerSelectAop() {
    }


    @Around("ControllerSelectAop()")
    public Object logPrint(ProceedingJoinPoint joinPoint) throws Throwable {
        long start = System.currentTimeMillis();
        Object result = joinPoint.proceed();
        Object[] args = joinPoint.getArgs();
        String type = joinPoint.getSignature().getDeclaringTypeName();
        String parameter = joinPoint.getSignature().getName();
        String name = "";

        if (type.contains("Controller")) {
            name = "[Request]Controller:";
        } else if (type.contains("Service")) {
            name = "Service:";
        } else if (type.contains("VO")) {
            name = "Persistence";
        }
        long end = System.currentTimeMillis();
        logger.info(FONT_GREEN + "■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
        logger.info("Argument/Parameter:" + Arrays.toString(args));
        logger.info(FONT_BLUE+ "[Response] {}: {}({}) = {} (실행시간 : {}ms)", name,type,
                parameter, result, end - start);
        logger.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■" + RESET);

        return result;
    }
}