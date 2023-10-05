package com.aws.awsdemo.controller;

import io.swagger.v3.oas.annotations.Operation;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class OrderService {

    @GetMapping("/orders")
    @Operation(summary = "주문 조회", description = "주문을 조회합니다.")
    public void get() {

    }

    @PostMapping("/orders")
    @Operation(summary = "주문 등록", description = "주문을 등록합니다.")
    public void register() {

    }

    @DeleteMapping("/orders")
    @Operation(summary = "주문 삭제", description = "주문을 삭제합니다.")
    public void delete() {

    }

}
