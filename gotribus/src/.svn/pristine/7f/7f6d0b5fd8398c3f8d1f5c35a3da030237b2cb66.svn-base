package dao;

import java.util.List;

import hibernate.TribusHibernateSessionFactory;
import model.TribusClassify;

import org.hibernate.Session;
import org.hibernate.Transaction;

public class TribusListClassifyDao {

	public int save(TribusClassify z){
		Session session = TribusHibernateSessionFactory.currentSession();
		Transaction tx = session.beginTransaction( );
		try {
			session.save( z );			
			tx.commit( );			
			return 1;		
			
		} catch ( Exception e ) {
			tx.rollback( );			
		}
		return -1;		
	}
	
	public int update(TribusClassify z){
		Session session = TribusHibernateSessionFactory.currentSession();
		Transaction tx = session.beginTransaction( );
		try {
			session.update( z );			
			tx.commit( );			
			return 1;		
			
		} catch ( Exception e ) {
			tx.rollback( );			
		}
		return -1;		
	}
	
	
	@SuppressWarnings("unchecked")
	public TribusClassify getTribusListClassById(int id){
		TribusClassify z = null;
		try{
			Session session = TribusHibernateSessionFactory.currentSession();
			String hql = "from TribusClassify where id =:id";
			z = (TribusClassify) session.createQuery(hql).setInteger("id", id).uniqueResult();			
		} catch (Exception e) {
			e.printStackTrace();			
		}
		return z;
	}
	
	@SuppressWarnings("unchecked")
	public List<TribusClassify> getTribusListClassByUserId(int id){		
		try{
			Session session = TribusHibernateSessionFactory.currentSession();
			String hql = "from TribusClassify where userId =:id";
			List<TribusClassify> l  = (List) session.createQuery(hql).setInteger("id", id).list();
			return l;
		} catch (Exception e) {
			e.printStackTrace();			
		}
		return null;
	}
	
	@SuppressWarnings("unchecked")
	public List<TribusClassify> getTribusListClassByUserIdAndType(int id,String name){		
		try{
			Session session = TribusHibernateSessionFactory.currentSession();
			String hql = "from TribusClassify where userId =:id and name = :name";
			List<TribusClassify> l  = (List) session.createQuery(hql).setString("name", name).setInteger("id", id).list();
			return l;
		} catch (Exception e) {
			e.printStackTrace();			
		}
		return null;
	}			
	
	public static void main(String[] args){
		TribusListClassifyDao tcd = new TribusListClassifyDao();
		TribusClassify t= new TribusClassify();
		t.setName("nihao");
		t.setUserId(5);
		
		//tcd.save(t);
		
		List<TribusClassify> l = tcd.getTribusListClassByUserId(1);
		System.out.println(l.size());
		
		l = tcd.getTribusListClassByUserId(50);
		System.out.println(l.size());
		//tcd.getTribusListClassById(5);
		//tcd.getTribusListClassById(1);
	}
}
