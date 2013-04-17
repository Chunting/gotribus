package dao;

import hibernate.TribusHibernateSessionFactory;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import model.MyTribusList;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import vo.MyTribusListVO;

public class TribusListDao {

	
	public List<MyTribusList> getTribusListByCondition(MyTribusList m){
			if(m==null){
				return null;
			}
				
		Session session = TribusHibernateSessionFactory.currentSession();		
		try {			
								
			Criteria c = session.createCriteria(MyTribusList.class);
			if(m.getCreateDate() !=null){c.add(Restrictions.eq("createDate", m.getCreateDate()));}
			if(m.getResourceId()!=0){c.add(Restrictions.eq("resourceId",m.getResourceId()));}
			if(m.getId()!=0){c.add(Restrictions.eq("id", m.getId()));}			
			if(m.getType() != null){c.add(Restrictions.eq("type", m.getType()));}				
			return c.list();
			
						
		} catch ( Exception e ) {
			System.out.println(e.getMessage());			
		}				
		return null;
	}
	

	
	
	/**
	 * 
	 * @param tribusList
	 * @return
	 */
	
	public int add( MyTribusList tribusList ) {
		Session session = TribusHibernateSessionFactory.currentSession();
		Transaction tx = session.beginTransaction( );
		try {
			
			MyTribusList id = (MyTribusList)session.createSQLQuery("select * from tribus_list " +
					"where resourceId = ?" +
					" and userId = ? and type = ?").addEntity(MyTribusList.class).
					setInteger(0, tribusList.getResourceId()).
					setInteger(1, tribusList.getUser().getUserId()).
					setString(2, tribusList.getType()).uniqueResult();
								
			System.out.println( tribusList.getResourceId());
			System.out.print(tribusList.getUser().getUserId());
			System.out.println(tribusList.getType());
			
			if(id==null){
				session.save( tribusList );	
				tx.commit( );			
				return 1;
			}else{
				session.delete(id);
				tx.commit( );			
				return -1;
			}																
		} catch ( Exception e ) {
			tx.rollback( );
			e.printStackTrace();
		}
		return -1;
	}		
	
	public int update( MyTribusList tribusList ) throws Exception {
		Session session = TribusHibernateSessionFactory.currentSession();
		Transaction tx = session.beginTransaction( );
		try {
			session.update( tribusList );
			tx.commit( );
			return 1;
		} catch ( Exception e ) {
			tx.rollback( );
			e.printStackTrace();			
		}
		return -1;
	}
	
	

	public int delete( MyTribusList message ) throws Exception {
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
	
	/**
	 * 
	 * @param type music,book,movie,city
	 * @param resourceId
	 * @return
	 */
	public boolean isAddResource(String type, int resourceId,int userId){
		String sql = "";				
		List<MyTribusList> bs = new ArrayList<MyTribusList>();		
		Session session = TribusHibernateSessionFactory.currentSession();		
		try {
			bs = session.createSQLQuery(sql).addEntity(MyTribusList.class).setInteger(0, resourceId).list();								
		} catch ( Exception e ) {			
			System.out.println(e.getMessage());
		}			
		return false;		
	}
		
	public List<MyTribusList> getHotBookTribusList(){
		
		String sql = "select * from tribus_list where type = 'book' limit 0,5 ";
		Session session = TribusHibernateSessionFactory.currentSession();
		List<MyTribusList> tagNames = session.createSQLQuery(sql).addEntity(MyTribusList.class).list();		
		return tagNames;		
	}
	
	public List<MyTribusList> getHotMusicTribusList(){
		String sql = "select * from tribus_list where type = 'music' limit 0,5 ";
		Session session = TribusHibernateSessionFactory.currentSession();
		List<MyTribusList> tagNames = session.createSQLQuery(sql).addEntity(MyTribusList.class).list();		
		return tagNames;
	}
	
	public List<MyTribusList> getHotMovieTribusList(){
		String sql = "select * from tribus_list where type = 'movie' limit 0,5 ";
		Session session = TribusHibernateSessionFactory.currentSession();
		List<MyTribusList> tagNames = session.createSQLQuery(sql).addEntity(MyTribusList.class).list();		
		return tagNames;
	}
	
	public List<MyTribusList> getTribusListByUserId(int id){
		String sql = "select t.* from tribus_list t , user_account u where t.userId = u.userId and " +				
				" u.userId = ? order by t.id desc ";				
		List<MyTribusList> bs = new ArrayList<MyTribusList>();		
		Session session = TribusHibernateSessionFactory.currentSession();		
		try {
			bs = session.createSQLQuery(sql).addEntity(MyTribusList.class).setInteger(0, id).list();								
		} catch ( Exception e ) {			
			System.out.println(e.getMessage());
		}
		return bs;		
	}
	
	
	public List<MyTribusList> getTribusListByClassId(int classId){
		String sql = "select t.* from tribus_list t , tribus_list_classified tu where t.classid = tu.id and "+ 
                     "tu.id = ? ";			
		List<MyTribusList> bs = new ArrayList<MyTribusList>();		
		Session session = TribusHibernateSessionFactory.currentSession();		
		try {
			bs = session.createSQLQuery(sql).addEntity(MyTribusList.class).setInteger(0, classId).list();								
		} catch ( Exception e ) {			
			System.out.println(e.getMessage());
		}
		return bs;		
	}
	
	
	private List<MyTribusListVO> getTribusListByResourceName(String sql,String name){
		
		Session session = TribusHibernateSessionFactory.currentSession();
		List<MyTribusListVO> bs = new ArrayList<MyTribusListVO>();		
		try {
			List l = null;
			l = session.createSQLQuery(sql).setString(0, name).list();
			if(l!=null){
				Iterator itr = l.iterator();
				while(itr.hasNext()){
					Object[] obj = (Object[])itr.next();
					MyTribusListVO mvo = new MyTribusListVO();
					mvo.setUserName(obj[0].toString());
					mvo.setResourceName(obj[1].toString());
					mvo.setResourceId(Integer.parseInt(obj[2].toString()));
					
					bs.add(mvo);
				}
			}
		} catch ( Exception e ) {			
			e.printStackTrace();
		}
		
		return bs;
	}	
	
	public List<MyTribusListVO> getTribusListMovieByResourceName(String name){				
		String sql = "select u.userAlias,t.resourceName, t.resourceId from tribus_list t,user_account u" +
				" where t.userId = u.userId and t.type = 'movie' and t.resourceName  REGEXP '/[?]/' ";
		return getTribusListByResourceName(sql,name);
	}
	
	public List<MyTribusListVO> getTribusListMusicByResourceName(String name){
		String sql = "select u.userAlias,t.resourceName, t.resourceId from tribus_list t,user_account u" +
		" where t.userId = u.userId and t.type = 'music' and t.resourceName  REGEXP '/[?]/' ";
		return getTribusListByResourceName(sql,name);
	}
	
	public List<MyTribusListVO> getTribusListBookByResourceName(String name){
		String sql = "select u.userAlias,t.resourceName, t.resourceId from tribus_list t,user_account u" +
		" where t.userId = u.userId and t.type = 'book' and t.resourceName  REGEXP '/[?]/' ";
		return getTribusListByResourceName(sql,name);
	}
	
	
	/**
	 * 
	 * @param id
	 * @param type 0:movie, 1:music, 2:book, 3:city
	 * @return
	 */
	public List<MyTribusList> getTribusListByResourceIdAndType(int id,int type){
		String sql = " from MyTribusList  where "+ 
                     " resourceId = ? and type = ? ";			
		
		Session session = TribusHibernateSessionFactory.currentSession();		
		try {
			List<MyTribusList> l = null;
			switch (type) {
			case 0:
				l = session.createQuery(sql).setInteger(0, id).setString(1, "movie").list();	
				break;
			case 1:
				l = session.createQuery(sql).setInteger(0, id).setString(1, "music").list();
				break;
			case 2:
				l = session.createQuery(sql).setInteger(0, id).setString(1, "book").list();
				break;

			default:
				break;
			}
			return l;									
		} catch ( Exception e ) {			
			System.out.println(e.getMessage());
		}
		return null;		
	}
	
	
//	public List<Music> getTribusListByUserId(int id){
//		String sql = "select m.* from music m, music_mark mm, user_account u where mm.musicLike = 1 and " +
//				"m.musicId = mm.musicId and" +
//				" u.userId = mm.userId and mm.userId = ?";				
//		List<Music> bs = new ArrayList<Music>();		
//		Session session = TribusHibernateSessionFactory.currentSession();		
//		try {
//			bs = session.createSQLQuery(sql).addEntity(Music.class).setInteger(0, id).list();									
//		} catch ( Exception e ) {			
//			System.out.println(e.getMessage());
//		}
//		return bs;		
//	}
	
	public static void main(String[] args){
		TribusListDao td = new TribusListDao();
		List<MyTribusList> l = td.getTribusListByResourceIdAndType(2522,2);
		
		for (MyTribusList myTribusList : l) {
			System.out.println(myTribusList.getUser().getUserAlias());
		}
		System.out.println(l);
//		MyTribusList mt = new MyTribusList();
//		mt.setType("music");
//		mt.setCreateDate(new Date());
//		mt.setResourceId(10);
//		mt.setResourceName("good music");
//		mt.setTitle("what's that");
		//mt.set
		
		
		//TribusListClassifyDao tcd = new TribusListClassifyDao();														
		//mt.setClassified(tcd.getTribusListClassById(6));
				
		//td.add(mt);				
		
//		List<MyTribusList> tl = td.getTribusListByUserId(1);
//		for (MyTribusList myTribusList : tl) {
//			System.out.println(myTribusList.getClassified());			
//		}
		
	}
}
