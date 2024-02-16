package com.mithilesh.repository;

import com.mithilesh.dto.UserDto;
import com.mithilesh.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface UserRepository extends JpaRepository<User,Integer> {
    Optional<User> findByEmail(String email);
}
