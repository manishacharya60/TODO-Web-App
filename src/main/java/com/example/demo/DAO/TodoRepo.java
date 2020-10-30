package com.example.demo.DAO;

import org.springframework.data.repository.CrudRepository;

public interface TodoRepo extends CrudRepository<Todo, Integer> {

}
