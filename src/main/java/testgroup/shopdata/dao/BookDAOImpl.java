package testgroup.shopdata.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import testgroup.shopdata.model.Book;


import java.util.*;

@Repository
public class BookDAOImpl implements BookDAO {
    private SessionFactory sessionFactory;
    /*  // before hibernate
        private static final AtomicInteger AUTO_ID = new AtomicInteger(0);
        private static Map<Integer, Book> books = new HashMap<>();
    */

    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    // warning from unknow type of List because getting in during RUNTIME, so its unsafe.
    @Override
    @SuppressWarnings("unchecked")
    public List<Book> allBooks(int page) {
        Session session = sessionFactory.getCurrentSession();
        return session.createQuery("from Book").setFirstResult(10 * (page - 1)).setMaxResults(10).list();
        //return session.createQuery("from Book").list();
    }

    @Override
    public void add(Book book) {
        Session session = sessionFactory.getCurrentSession();
        session.persist(book);
    }

    @Override
    public void delete(Book book) {
        Session session = sessionFactory.getCurrentSession();
        session.delete(book);
    }

    @Override
    public void edit(Book book) {
        Session session = sessionFactory.getCurrentSession();
        session.update(book);
    }

    @Override
    public Book getById(int id) {
        Session session = sessionFactory.getCurrentSession();
        return session.get(Book.class, id);
    }

    @Override
    public int booksCount() {
        Session session = sessionFactory.getCurrentSession();
        return session.createQuery("select count(*) from Book", Number.class).getSingleResult().intValue();
     }

    @Override
    public boolean checkTitle(String title) {
        Session session = sessionFactory.getCurrentSession();
        Query query;
        query = session.createQuery("from Book where title = :title");
        query.setParameter("title", title);
        return query.list().isEmpty();
    }

/* //BEFORE HIBERNATE
    @Override
    public List<Book> allBooks() {
        return new ArrayList<>(books.values());
    }
*/
/*  //BEFORE HIBERNATE

    @Override
    public void add(Book book) {
        book.setId(AUTO_ID.getAndIncrement());
        books.put(book.getId(), book);
    }

    @Override
    public void delete(Book book) {
        books.remove(book.getId());
    }

    @Override
    public void edit(Book book) {
        books.put(book.getId(), book);
    }

    @Override
    public Book getById(int id) {
        return books.get(id);
    }

*/
/* TEST LIST
    static {
        Book book1 = new Book();
        book1.setId(AUTO_ID.getAndIncrement());
        book1.setTitle("macaronosoft");
        book1.setAuthor("Billy boy");
        book1.setYear(1990);
        book1.setGenre("sci-fi");
        book1.setPrice(20);
        books.put(book1.getId(), book1);
    }
    books2, book3, book4 ... etc
*/
}
