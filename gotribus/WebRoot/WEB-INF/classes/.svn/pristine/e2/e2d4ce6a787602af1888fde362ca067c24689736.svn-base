package dao;

import hibernate.TribusHibernateSessionFactory;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import model.Activity;
import model.Book;
import model.Message;
import model.Movie;
import model.Music;
import model.User;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import config.GlobleConfig;

import util.IntArrayToString;
import vo.MessageVO;

public class MessageDao {
	
	
	
	/**
	 * 
	 * @return
	 */
	public int[] getInboxNumberReadAndUnRead(int id){
		
		int[] readAndUnread = new int[2];
		
		
		String sql = "select count(*) as num  from message where messageToUserId = ? and isRead = 0 union "
		+"select count(*) as num  from message where messageToUserId = ?"; 
		
		List l = TribusHibernateSessionFactory.currentSession().createSQLQuery(sql).setInteger(1,id).setInteger(2, id).list();
		if( l!=null ){
			Iterator i = l.iterator();
			if(i.hasNext()){
				Object[] obj = (Object[])i.next();
				readAndUnread[0] = (Integer)obj[0];
				readAndUnread[1] = (Integer)obj[1];
			}			
		}
		
		return readAndUnread;
	}
	
	/**
	 * 
	 * @param type
	 * @param resourId
	 */
	public void remind(int type,int resourId,int fromUserId){
		Session session = TribusHibernateSessionFactory.currentSession();
		String com = "";	
		MessageDao md = new MessageDao();
		
		switch (type) {
		case 0:
			com = "select * from user_account where userId in(select userId from activity_comment where activityId = ?)";
			break;
		case 1:
			com = "select * from user_account where userId in(select userId from movie_comment where movieId = ?)";
			break;
		case 2:
			com = "select * from user_account where userId in(select userId from music_comment where musicId = ?)"; 
			break;
		case 3:
			com = " select * from user_account where userId in(select userId from book_comment where bookId = ?)"; 
			break;

		default:
			break;
		}
		
		List<User> l = session.createSQLQuery(com).addEntity(User.class).setInteger(0, resourId).list();
		if(l!=null){
			Iterator itr = l.iterator();
			while(itr.hasNext()){
				User user = (User)itr.next();
				Message m = new Message();
				
			
				
				switch (type) {
				case 0:
					
					ActivityDao ad = new ActivityDao();
					Activity a = ad.getActivityById(resourId);
					
					m.setMessageContent(""+
							"see your new comment ! "+		
							" on this event "+ a == null ? "" : a.getActivityName()  );
					break;
				case 1:
					MovieDao mod = new MovieDao();
					Movie mov = mod.getMovieById(resourId);
					m.setMessageContent(""+
							"see your new comment ! "+		
							" on this movie "+ mov == null ? "" : mov.getMovieNameOriginal());
					break;
				case 2:
					
					MusicDao muiscd = new MusicDao();
					Music mus = muiscd.getMusicById(resourId);					
					m.setMessageContent(""+
							"see your new comment ! "+		
							" on this music "+ mus == null ? "" : mus.getMusicName()); 
					break;
				case 3:
					BookDao bd = new BookDao();
					Book boo = bd.getBookById(resourId);
					
					m.setMessageContent(""+
							"see your new comment ! "+		
							" on this book "+ boo == null ? "":boo.getBookName()); 
					break;

				default:
					break;
				}
						
				m.setMessageTitle(""+user.getUserAlias() +"  new comment !" );
				m.setMessageDate(new Date());
				m.setMessageRead("false");
				m.setMessageFromUserId(fromUserId);
				m.setMessageToUserId(user.getUserId());
				if(fromUserId != user.getUserId()){
					md.add(m);
				}				
			}
		}							
	}
	
	
	public List<MessageVO> searchAllMail(String nameOrContent,int userId) throws ParseException{
		
		Session session = TribusHibernateSessionFactory.currentSession();
		String hql = "select u.userAlias , m.messageRead, m.messageTitle,m.messageToUserId ," +
				" m.messageFromUserId ," +
				" m.messageContent,m.messageDate ,m.messageId " +
				" from message m, user_account u " +
				" where m.messageToUserId = ? " +
				"  and u.userId = m.messageFromUserId  and " +
				" (m.messageContent like '%"+nameOrContent+"%' " +
                " or m.messageTitle like '%"+nameOrContent+"%' or u.userAlias like '%"+nameOrContent+"%') ";
		 
		List l = session.createSQLQuery(hql).setInteger(0, userId).list();
		List<MessageVO> res = new ArrayList<MessageVO>(); 
		if(l!=null){
			Iterator itr = l.iterator();
			while(itr.hasNext()){
				MessageVO mv = new MessageVO();
				Object[] obj = (Object[])itr.next();
				
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-M-d");
				Date d = sdf.parse(obj[6].toString());				
				mv.setMessageFromUserAlias(obj[0].toString());
				mv.setMessageContent(obj[5].toString());
				mv.setMessageDate(d);
				mv.setMessageTitle(obj[2].toString());
				mv.setMessageRead("true".equals(obj[1].toString()) ? true:false);
				mv.setMessageId(Integer.parseInt(obj[7].toString()));
				/**
				 * useless
				 */
				mv.setMessageToUserAlias(obj[0].toString());
				res.add(mv);
			}
		}
		
		return res;
	}
	
	public Map<Integer,String> getUserNameById(){
		
		Map<Integer,String> m = new HashMap<Integer,String>();	
		String sql = "select u.userAlias , m.messageToUserId from user_account u, message m where" +
				" u.userId = m.messageToUserId ";
		
		List res_from_DB = new ArrayList();
		Iterator i = null;		
		res_from_DB = TribusHibernateSessionFactory.currentSession().createSQLQuery(sql).list();
		
		if( res_from_DB != null ){
			i = res_from_DB.iterator();
		}
		
		while (i.hasNext()) {	
			Object[] objs = (Object[]) i.next();
			m.put((Integer)objs[0], objs[1].toString());			
		}				
		
		return m;
	}
	
	public List<Message> getMessageListByCondition(Message m){
		if(m==null){
			return null;
		}
		Session session = TribusHibernateSessionFactory.currentSession();		
		try {			
								
			Criteria c = session.createCriteria(Message.class);
			if(m.getMessageDate() !=null){c.add(Restrictions.eq("messageDate", m.getMessageDate()));}
			if(m.getMessageFromUserId() > 0){c.add(Restrictions.eq("messageFromUserId",m.getMessageFromUserId()));}
			if(m.getMessageContent()!=null){c.add(Restrictions.eq("messageContent", m.getMessageContent()));}
			if(m.getMessageToUserId() > 0){c.add(Restrictions.eq("messageToUserId", m.getMessageToUserId()));}
						
			if(m.getMessageType() != null){c.add(Restrictions.eq("type", m.getMessageType()));}	
			if(m.getMessageRead()!=null){c.add(Restrictions.eq("messageRead", m.getMessageRead()));}
									
			return c.list();  														
						
		} catch ( Exception e ) {
			System.out.println(e.getMessage());			
		}				
		return null;
	}
	
	public Message getMessageByCondition(Message m){
		if(m==null){
			return null;
		}
		Session session = TribusHibernateSessionFactory.currentSession();		
		try {			
								
			Criteria c = session.createCriteria(Message.class);
			if(m.getMessageDate() !=null){c.add(Restrictions.eq("messageDate", m.getMessageDate()));}
			if(m.getMessageFromUserId() > 0){c.add(Restrictions.eq("messageFromUserId",m.getMessageFromUserId()));}
			if(m.getMessageContent()!=null){c.add(Restrictions.eq("messageContent", m.getMessageContent()));}
			if(m.getMessageToUserId() > 0){c.add(Restrictions.eq("messageToUserId", m.getMessageToUserId()));}
			if(m.getMessageId() != 0){c.add(Restrictions.eq("messageId", m.getMessageId()));}
			if(m.getMessageType() != null){c.add(Restrictions.eq("type", m.getMessageType()));}	
			if(m.getMessageRead()!=null){c.add(Restrictions.eq("messageRead", m.getMessageRead()));}
			
			Message m1 = (Message)c.uniqueResult();  														
			return m1;
			
		} catch ( Exception e ) {
			System.out.println(e.getMessage());			
		}				
		return null;
	}
	
	
	public long add( Message message ){
		Session session = TribusHibernateSessionFactory.currentSession();
		Transaction tx = session.beginTransaction( );
		try {
			session.save( message );
			//session.flush();					
			tx.commit( );			
			return 1;						
		} catch ( Exception e ) {
			tx.rollback( );		
			e.printStackTrace();
		}
		return -1;
	}
	
	

	
	public int update( Message message ) throws Exception {
		Session session = TribusHibernateSessionFactory.currentSession();
		Transaction tx = session.beginTransaction( );
		try {
			session.update( message );
			tx.commit( );
			return 1;
		} catch ( Exception e ) {
			tx.rollback( );
			e.printStackTrace();			
		}
		return -1;
	}
	
//	
//	public int deleteList(){
//		String hql = "delete Message where messageId = :id";
//		
//		return 0;
//	}
	
	
	public List<Message> getMessagesByIds(int[] ids){
		
		String sql = "from Message where messageId in ("+IntArrayToString.arrayTostring(ids)+")";
		List<Message> l = TribusHibernateSessionFactory.currentSession().createQuery(sql).list();
		return l;
	}
	
	public int deleteMessageByIds(int[] ids){
		List<Message> l = getMessagesByIds(ids);
		return deleteMessageList(l);		
	}
	
	public int deleteMessageList(List<Message> list){
		if(list == null || list.size() == 0){
			return 0;
		}
		
		int i = 0;		
		Session session = TribusHibernateSessionFactory.currentSession();
		Transaction tx = session.beginTransaction( );
		try {						
			for (Message message : list) {				
				session.delete( message );	
				i++;
			}			
			session.flush();			
			tx.commit( );					
			return i;
		} catch ( Exception e ) {
			tx.rollback( );
			e.printStackTrace();
		}
		    return i;			
	}
	
	public int delete( Message message ) throws Exception {
		Session session = TribusHibernateSessionFactory.currentSession();
		Transaction tx = session.beginTransaction( );
		try {			
			session.delete( message );
			tx.commit( );
			return 1;
		} catch ( Exception e ) {
			tx.rollback( );
			e.printStackTrace();
		}
		    return -1;
	}
	
	
	public List<MessageVO> getUserInboxMessageAll(int id) throws ParseException{
		Session session = TribusHibernateSessionFactory.currentSession();
		String hql = "select u.userAlias , m.messageRead, m.messageTitle,m.messageToUserId ," +
				" m.messageFromUserId ," +
				" m.messageContent,m.messageDate ,m.messageId " +
				" from message m, user_account u " +
				" where m.messageToUserId = ? " +
				"  and u.userId = m.messageFromUserId    ";
		List l = session.createSQLQuery(hql).setInteger(0, id).list();
		List<MessageVO> res = new ArrayList<MessageVO>(); 
		if(l!=null){
			Iterator itr = l.iterator();
			while(itr.hasNext()){
				MessageVO mv = new MessageVO();
				Object[] obj = (Object[])itr.next();
				
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-M-d");
				Date d = sdf.parse(obj[6].toString());				
				mv.setMessageFromUserAlias(obj[0].toString());
				mv.setMessageContent(obj[5].toString());
				mv.setMessageDate(d);
				mv.setMessageTitle(obj[2].toString());
				mv.setMessageRead("true".equals(obj[1].toString()) ? true:false);
				mv.setMessageId(Integer.parseInt(obj[7].toString()));
				mv.setMessageFromUserId(Integer.parseInt(obj[4].toString()));
				mv.setMessageToUserId(Integer.parseInt(obj[3].toString()));
				/**
				 * useless
				 */
				mv.setMessageToUserAlias(obj[0].toString());
				res.add(mv);
			}
		}
		
		return res;
	}
	
	
	public List<MessageVO> getUserInboxMessageAllUnread(int id) throws ParseException{
		Session session = TribusHibernateSessionFactory.currentSession();
		String hql = "select u.userAlias ,m.messageTitle,m.messageToUserId , m.messageFromUserId ," +
				"       m.messageContent,m.messageDate,m.messageRead, m.messageId " +
				"				 from message m, user_account u " +
				"                where m.messageToUserId = ? and m.messageRead = ? " +
				"                and u.userId = m.messageFromUserId                ";
		List l = session.createSQLQuery(hql).setInteger(0, id).setString(1, "false").list();
		List<MessageVO> res = new ArrayList<MessageVO>(); 
		
		if(l != null){
			Iterator itr = l.iterator();
			while(itr.hasNext()){
				Object[] obj = (Object[])itr.next();
				
				MessageVO mv = new MessageVO();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-M-d");
				Date d = sdf.parse(obj[5].toString());				
				mv.setMessageFromUserAlias(obj[0].toString());
				mv.setMessageContent(obj[4].toString());
				mv.setMessageDate(d);
				mv.setMessageTitle(obj[1].toString());
				mv.setMessageRead(false);
				mv.setMessageId(Integer.parseInt(obj[7].toString()));
				mv.setMessageFromUserId(Integer.parseInt(obj[3].toString()));
				mv.setMessageToUserId(Integer.parseInt(obj[2].toString()));
				/**
				 * useless
				 */
				mv.setMessageToUserAlias(obj[0].toString());
				res.add(mv);
			}
		}
		
		
		return res;
	}
	
	
	

	
	public List<MessageVO> getUserOutboxMessageAll(int id) throws ParseException{
		
		String sql = "select u.userAlias , m.messageTitle,m.messageToUserId , m.messageFromUserId ," +
				" m.messageContent,m.messageDate,m.messageId  " +
				" from message m, user_account u " +
				"  where m.messageFromUserId = ? " +
				" and u.userId = m.messageToUserId   ";
		
		Session session = TribusHibernateSessionFactory.currentSession();		
		List l = session.createSQLQuery(sql).setInteger(0, id).list();
		List<MessageVO> res = new ArrayList<MessageVO>();
		
		if(l != null && l.size() > 0){
			Iterator itr = l.iterator();
			while(itr.hasNext()){
				Object[] obj = (Object[])itr.next();
				
				MessageVO mv = new MessageVO();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-M-d");
				Date d = sdf.parse(obj[5].toString());				
				mv.setMessageFromUserAlias(obj[0].toString());
				mv.setMessageContent(obj[4].toString());
				mv.setMessageDate(d);
				mv.setMessageTitle(obj[1].toString());
				mv.setMessageRead(true);
				mv.setMessageId(Integer.parseInt(obj[6].toString()));
				mv.setMessageToUserId(Integer.parseInt(obj[2].toString()));
				mv.setMessageFromUserId(Integer.parseInt(obj[3].toString()));
				/**
				 * useless
				 */
				mv.setMessageToUserAlias(obj[0].toString());
				res.add(mv);
			}			
		}
		
		return res;
	}
	
	private List<Message> getUserOutboxMessageRead(){
		return null;
	}
	
	private List<Message> getUserOutboxMessageUnRead(){
		return null;
	}
	
	public static void main(String args[]){
		MessageDao md = new MessageDao();
		try {
			Message m = new Message();
			m.setMessageRead("false");
			Message mm = md.getMessageByCondition(m);
			System.out.println(mm.getMessageId());
			
			List<MessageVO> l = md.getUserInboxMessageAllUnread(1);
			for (MessageVO messageVO : l) {
				System.out.println(messageVO.getMessageFromUserAlias());
			}
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
