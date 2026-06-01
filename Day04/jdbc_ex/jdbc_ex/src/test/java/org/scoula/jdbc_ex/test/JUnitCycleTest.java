package org.scoula.jdbc_ex.test;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

public class JUnitCycleTest {
    @BeforeAll
     static void beforeAll(){
        System.out.println("@BeforeAll");
    }

    @BeforeAll //테스트 케이스를 실행하기 전마다 실행
    public static void beforeEach(){
        System.out.println("@BeforeEach");
    }

    @Test
    public void test1(){
        System.out.println("test1");
    }

    @Test
    public void test2(){
        System.out.println("test2");
    }

    @Test
    public void test3(){
        System.out.println("test3");
    }

    @AfterEach //테스트 케이스를 종료하기 전마다 실행
    public void afterEach(){
        System.out.println("@AfterAll");
    }

    @AfterAll //전체 테스트 마치고 종료하기 전 1회. static 선언
    static void afterAll(){
        System.out.println("@AfterAll");
    }
}
