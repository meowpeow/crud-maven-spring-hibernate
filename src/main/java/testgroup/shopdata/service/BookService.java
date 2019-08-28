package testgroup.shopdata.service;

import testgroup.shopdata.model.Book;

import java.util.List;

public interface BookService {
    List<Book> allBooks(int page);
    void add(Book book);
    void delete(Book book);
    void edit(Book book);
    Book getById(int id);

    int booksCount();

    boolean checkTitle(String title);
}
