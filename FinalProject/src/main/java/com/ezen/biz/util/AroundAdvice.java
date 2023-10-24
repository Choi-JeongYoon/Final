package com.ezen.biz.util;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;
@Service
@Aspect
public class AroundAdvice {
	//Advice 메소드 정의
	@Pointcut("execution(* com.ezen.biz..*Impl.*(..))")
	void allPointcut() {}
	@Around("allPointcut()")
	public Object aroundLog(ProceedingJoinPoint jp) throws Throwable {
		String method=jp.getSignature().getName();
		System.out.println("[around - 사전처리] : "+method +"() 메소드 ");
		Object obj=jp.proceed();
		System.out.println("[around - 사전처리] : "+method +"() 메소드 리턴값 : "+obj);
		return obj;
	}
}
