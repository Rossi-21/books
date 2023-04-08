package com.rossi21.books.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.rossi21.books.models.Book;
import com.rossi21.books.services.BookService;
import com.rossi21.books.services.UserService;

@Controller
public class BookController {

	@Autowired
    private BookService bookServ;
	@Autowired
    private UserService userServ;
	
	@GetMapping("/books/new")
    public String index(Model model, @ModelAttribute("book") Book book,  HttpSession session) {
		Long userId = (Long)session.getAttribute("userId");
    	model.addAttribute("user", userServ.getOneById(userId));
        return "newbook.jsp";
    }
	@PostMapping("/books/create")
	public String createBook(@Valid @ModelAttribute("book") Book book, BindingResult result) {
        if (result.hasErrors()) {
            return "newbook.jsp";
        } else {
        	bookServ.createBook(book);
            return "redirect:/books";
        }
		
	}
}
