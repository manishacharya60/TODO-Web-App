package com.example.demo;

import java.util.List;	

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.reactive.error.ErrorAttributes;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.DAO.Todo;
import com.example.demo.DAO.TodoRepo;

@Controller
public class MainController {
	@Autowired
	private TodoRepo repo;
	
	@RequestMapping("/")
	public ModelAndView home() {
		ModelAndView mv = new ModelAndView("home.jsp");
		mv.addObject("totalTask", repo.count());
		return mv;
	}
	
	@RequestMapping("/add")
	public String add() {
		return "addTask.jsp";
	}
	
	@RequestMapping("/addTask")
	public ModelAndView addTask(Todo todo) {
		ModelAndView mv = new ModelAndView("home.jsp");
		mv.addObject("totalTask", repo.count());
		repo.save(todo);
		return mv;
	}
	
	@RequestMapping("/all")
	public ModelAndView displayTask() {
		ModelAndView mv = new ModelAndView("all.jsp");
		List<Todo> todoList = (List<Todo>) repo.findAll();
		mv.addObject("todoList", todoList);
		mv.addObject("totalTask", repo.count());
		return mv;
	}
	
	@RequestMapping("/personal")
	public ModelAndView personalTask() {
		ModelAndView mv = new ModelAndView("personal.jsp");
		List<Todo> todoList = (List<Todo>) repo.findAll();
		mv.addObject("todoList", todoList);
		return mv;
	}
	
	@RequestMapping("/work")
	public ModelAndView workTask() {
		ModelAndView mv = new ModelAndView("work.jsp");
		List<Todo> todoList = (List<Todo>) repo.findAll();
		mv.addObject("todoList", todoList);
		return mv;
	}
	
	@RequestMapping("/groceries")
	public ModelAndView groceriesTask() {
		ModelAndView mv = new ModelAndView("groceries.jsp");
		List<Todo> todoList = (List<Todo>) repo.findAll();
		mv.addObject("todoList", todoList);
		return mv;
	}
	
	@RequestMapping("/school")
	public ModelAndView schoolTask() {
		ModelAndView mv = new ModelAndView("school.jsp");
		List<Todo> todoList = (List<Todo>) repo.findAll();
		mv.addObject("todoList", todoList);
		return mv;
	}
	
	@RequestMapping("/taskDone")
	public String taskDone(@RequestParam(value="taskId") int id) {
		repo.deleteById(id);
		return "home.jsp";
	}
}
