package dao;

import hibernate.TribusHibernateSessionFactory;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import model.Activity;
import model.Book;
import model.Follow;
import model.Friend_speaking;
import model.Movie;
import model.User;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

public class Friend_MessageDao {

	
	public int add( Friend_speaking user ) {
		Session session = TribusHibernateSessionFactory.currentSession();
		Transaction tx = session.beginTransaction( );
		try {
			session.save( user );
	//		session.flush();
			tx.commit( );			
			return 1;		
			
		} catch ( Exception e ) {
			e.printStackTrace();
			tx.rollback( );			
		}
		return -1;
	}
	
	public Friend_speaking getFriendSpeakingByCondition(Friend_speaking u){
		if(u==null){
			return null;
		}
		Session session = TribusHibernateSessionFactory.currentSession();		
		try {			
								
			Criteria c = session.createCriteria(Friend_speaking.class);
			if(u.getMe()!=null){c.add(Restrictions.eq("me", u.getMe()));}
			if(u.getFriend() !=null){c.add(Restrictions.eq("friend", u.getFriend()));}
			if(u.getTitle()!=null){c.add(Restrictions.eq("title", u.getTitle()));}			
									
			Friend_speaking user = (Friend_speaking)c.uniqueResult();  														
			return user;
			
		} catch ( Exception e ) {
			e.printStackTrace();	
		}				
		return null;
	}
	
	
	public List<Friend_speaking> getFriendSpeakingListByCondition(Friend_speaking u){
		if(u==null){
			return null;
		}
		Session session = TribusHibernateSessionFactory.currentSession();		
		try {			
								
			Criteria c = session.createCriteria(Friend_speaking.class);
			
			if(u.getMe()!=null){c.add(Restrictions.eq("me", u.getMe()));}
			if(u.getFriend() !=null){c.add(Restrictions.eq("friend", u.getFriend()));}
			if(u.getTitle()!=null){c.add(Restrictions.eq("title", u.getTitle()));}		
			c.addOrder(Order.desc("id"));
			
			return c.list();
			
		} catch ( Exception e ) {
			e.printStackTrace();	
		}				
		return null;
	}
	
	
	
	public void update( Friend_speaking user ) {
		Session session = TribusHibernateSessionFactory.currentSession();
		Transaction tx = session.beginTransaction( );
		try {
			session.update( user );
			tx.commit( );
		} catch ( Exception e ) {
			tx.rollback( );
			e.printStackTrace();
		}
	}
	
	public int delete( Friend_speaking user )  {
		Session session = TribusHibernateSessionFactory.currentSession();
		Transaction tx = session.beginTransaction( );
		try {
			session.delete( user );
			tx.commit( );
			return 1;
		} catch ( Exception e ) {
			e.printStackTrace();
			tx.rollback( );
			return -1;
		}
	}

	public static void main(String[] args){ 
		UserDao ud = new UserDao();
		User u1 = ud.getUserById(21);
		User u2 = ud.getUserById(2);
		
		Friend_speaking fs = new Friend_speaking();
		//fs.setId(1);
//		fs.setMe(u1);
//		fs.setFriend(u2);
//		fs.setMessageDate(new Date());
//		fs.setMessageContent("hello");
//		fs.setTitle("no tit");
		fs.setFriend(u1);
		//fs.setMe(u2);
		Friend_MessageDao fo = new Friend_MessageDao();
		//fo.add(fs);
		//Friend_speaking nn = fo.getFriendSpeakingByCondition(fs);
		List<Friend_speaking> l = fo.getFriendSpeakingListByCondition(fs);
		//System.out.println(nn.getMe().getUserAlias());
		for (Friend_speaking ob : l) {
			System.out.println(ob.getMe().getUserAlias());
			System.out.println(ob.getFriend().getUserAlias());
		}
		
	}
	
}
