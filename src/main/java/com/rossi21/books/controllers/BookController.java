package com.rossi21.books.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.rossi21.books.models.Book;
import com.rossi21.books.services.BookService;
import com.rossi21.books.services.UserService;

@Controller
public class BookController {

	@Autowired
    private BookService bookServ;
	@Autowired
    private UserService userServ;
	// Create a book page
	@GetMapping("/books/new")
    public String index(Model model, @ModelAttribute("book") Book book,  HttpSession session) {
		Long userId = (Long)session.getAttribute("userId");
    	model.addAttribute("user", userServ.getOneById(userId));
        return "newbook.jsp";
    }
	// Create a book method
	@PostMapping("/books/create")
	public String createBook(@Valid @ModelAttribute("book") Book book, BindingResult result) {
        if (result.hasErrors()) {
            return "newbook.jsp";
        } else {
        	bookServ.createBook(book);
            return "redirect:/books";
        }	
	}
	// Display book info page
	@GetMapping("/books/{id}")
    public String show(@PathVariable("id") Long id, Model model, HttpSession session) {
        Book book = bookServ.getOneById(id);
        model.addAttribute("book", book);
        Long userId = (Long)session.getAttribute("userId");
    	model.addAttribute("user", userServ.getOneById(userId));
        return "show.jsp";
    }
	// Edit a book page
	@GetMapping("/books/{id}/edit")
    public String edit(@PathVariable("id") Long id, Model model) {
        Book book = bookServ.getOneById(id);
        model.addAttribute("book", book);
        return "edit.jsp";
    }
	// Update a book method
	@RequestMapping(value="/books/{id}", method=RequestMethod.PUT)
    public String update(@Valid @ModelAttribute("book") Book book, BindingResult result) {
        if (result.hasErrors()) {
            return "edit.jsp";
        } else {
            bookServ.updateBook(book);
            return "redirect:/books";
        }
    }
	// Borrow a book Method
    @GetMapping("/books/{id}/borrow")
    public String borrowBook(@PathVariable("id") Long id, HttpSession session) {
    	if(session.getAttribute("userId") == null) {
    		return "redirect:/";
    	}
    	Book book = bookServ.getOneById(id);
    	book.setBorrower(userServ.getOneById((Long)session.getAttribute("userId")));
    	bookServ.updateBook(book);
    	
    	return "redirect:/books";
    }
    // Return a book Method
    @GetMapping("/books/{id}/return")
    public String returnBook(@PathVariable("id") Long id, HttpSession session) {
    	if(session.getAttribute("userId") == null) {
    		return "redirect:/";
    	}
    	Book book = bookServ.getOneById(id);
    	book.setBorrower(null);
    	bookServ.updateBook(book);
    	
    	return "redirect:/books";
    }
	// Delete a book method
	@DeleteMapping("/books/{id}/delete")
    public String destroy(@PathVariable("id") Long id) {
        bookServ.deleteBook(id);
        return "redirect:/books";
    }
    
}
