package com.mithilesh.service;

import com.mithilesh.dto.AuthRequest;
import com.mithilesh.dto.AuthResponse;
import com.mithilesh.dto.RegisterRequest;
import com.mithilesh.dto.UserDto;
import com.mithilesh.entity.User;

public interface AuthService {

    public User register(RegisterRequest request);
    public AuthResponse authenticate(AuthRequest request);
}
