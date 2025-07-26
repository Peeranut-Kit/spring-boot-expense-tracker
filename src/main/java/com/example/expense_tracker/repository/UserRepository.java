package com.example.expense_tracker.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.expense_tracker.model.User;

// JpaRepository<data_class, type_of_primary_key>
public interface UserRepository extends JpaRepository<User, Long> {

}
