package com.aws.awsdemo.config;

import io.swagger.v3.oas.models.OpenAPI;
import org.springdoc.core.models.GroupedOpenApi;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class SwaggerConfig {

    @Bean
    public OpenAPI publicApi() {
        return new OpenAPI()
                .info(new io.swagger.v3.oas.models.info.Info()
                        .title("My API")
                        .version("1.0")
                        .description("My Custom API for the application"));

    }

    @Bean
    public GroupedOpenApi userOpenApi() {
        String[] paths = {"/members/**"};
        return GroupedOpenApi.builder()
                .group("user")
                .pathsToMatch(paths)
                .build();
    }

    @Bean
    public GroupedOpenApi orderOpenApi() {
        String[] paths = {"/orders/**"};
        return GroupedOpenApi.builder()
                .group("order")
                .pathsToMatch(paths)
                .build();
    }


}
