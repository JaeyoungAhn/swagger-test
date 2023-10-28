package com.aws.awsdemo.controller;

import io.swagger.v3.oas.annotations.Operation;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MemberService {

    @GetMapping("/members")
    @CrossOrigin(origins = "*", allowedHeaders = "*")
    @Operation(summary = "회원 조회", description = "회원을 조회합니다.")
    public void get() {
        System.out.println("ci/cd succeed");
    }

    @PostMapping("/members")
    @Operation(summary = "회원 등록", description = "회원을 등록합니다.")
    public void register() {

    }

    @DeleteMapping("/members")
    @Operation(summary = "회원 삭제", description = "회원을 삭제합니다.")
    public void delete() {

    }

}
