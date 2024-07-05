package kr.or.woniProject.cmmn.sys.aop;


import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
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

    @Pointcut("execution(* kr.or.woniProject..*Controller.insert*(..))")
    public void ControllerInsertAop() {
    }


    @Pointcut("execution(* kr.or.kotsa.rims..*Controller.*(..))")
    public void ContollerAOP() {
    }

    @Around("ControllerSelectAop() || ControllerInsertAop()")
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
        logger.info(" {},{}({}) = (실행시간 : {}ms)", name,type, parameter, end - start);
        logger.info("Argument/Parameter:" + Arrays.toString(args));
        logger.info(" [Response]: {}",result);
        logger.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■" + RESET);

        return result;
    }

     // 로직 수행 중 에러가 발생할 경우
    @AfterThrowing(pointcut = "ContollerAOP()", throwing = "ex")
    public void afterThrowing(Throwable ex){logger.error("에러 {} ",ex);}


}