package testgroup.shopdata.dao;

import testgroup.shopdata.model.Book;

import java.util.List;

public interface BookDAO {
    List<Book> allBooks(int page);
    void add(Book book);
    void delete(Book book);
    void edit(Book book);
    Book getById(int id);

    int booksCount();

    boolean checkTitle(String title);
}
