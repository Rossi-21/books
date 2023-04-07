package com.rossi21.books.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rossi21.books.models.Book;
import com.rossi21.books.repositories.BookRepository;

@Service
public class BookService {
	@Autowired
	private BookRepository bookRepo;
	// Creates a book
	public Book createBook(Book b) {
		return bookRepo.save(b);
	}
	// retrieves a book
	public Book getOneById(Long id) {
		Optional<Book> book = bookRepo.findById(id);
		if (book.isEmpty()) {
			return null;
		}
		return book.get();
	}
	// returns all the book's
    public List<Book> allBooks() {
        return bookRepo.findAll();
    }
    // update the book info
    public Book  updateBook (Book b) {
		return bookRepo.save(b);
	}
    // delete a book
	public void deleteBook (Long id) {
		bookRepo.deleteById(id);
	}
}
