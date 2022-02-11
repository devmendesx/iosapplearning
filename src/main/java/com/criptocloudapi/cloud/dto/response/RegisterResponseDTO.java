package com.criptocloudapi.cloud.dto.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class RegisterResponseDTO {
    public String token;
    public String message;

    public RegisterResponseDTO(String token) {
        this.token = token;
        this.message =  token != null ?  "User registered successfully!" : "Error on register user!";
    }
}
