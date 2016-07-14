//package br.com.pegapa.conexao;
//
//import javax.ejb.Stateful;
//import javax.persistence.EntityManager;
//import javax.persistence.PersistenceContext;
//
//import org.hibernate.Session;
//import org.hibernate.SessionFactory;
//import org.hibernate.cfg.Configuration;
//import org.hibernate.internal.SessionImpl;
//
//@Stateful
//public class HibernateUtil {
//	
//	private static final SessionFactory sessionFactory;  
//	  
//	@PersistenceContext(unitName="PegaPa" )
//	static EntityManager manager;
//	
//	private static Session session;
//	
//    static {  
//        try {  
//        	
//        	sessionFactory = new Configuration().configure().buildSessionFactory();
// 
//        } catch (Throwable ex) {  
//            // Make sure you log the exception, as it might be swallowed  
//            System.err.println("Initial SessionFactory creation failed." + ex);  
//            throw new ExceptionInInitializerError(ex);  
//        }  
//    }  
//  
//    public static SessionFactory getSessionFactory() {  
//        return sessionFactory;  
//    }
//    public static Session getSession() {  
//        return sessionFactory.getCurrentSession();  
//    }
//    
//    
//    public static EntityManager getManager(){
//    	return manager;
//    }
//
//    
//  
//}
