package com.mithilesh.dto;

import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Getter
@Setter
public class UserDto {
    private Integer userId;
    private String name;
    private String email;
    private String password;
}
