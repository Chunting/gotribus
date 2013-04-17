package controller;

import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Activity;
import model.ActivityComment;
import model.Book;
import model.BookComment;
import model.BookMark;
import model.Follow;
import model.Friend_speaking;
import model.Invitation;
import model.Movie;
import model.MovieComment;
import model.MovieMark;
import model.Music;
import model.MusicComment;
import model.MusicMark;
import model.MyTribusList;
import model.TribusClassify;
import model.User;
import model.UserProfile;
import model.WishList;

import org.apache.commons.validator.GenericValidator;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import util.CompareUserLike;
import util.Mail;
import util.PageObject;
import util.Paging;
import util.TribusObjectMapping;
import vo.ActivityVO;
import vo.BookMarkVo;
import vo.MessageVO;
import vo.MovieMarkVo;
import vo.MusicMarkVo;
import dao.ActivityCommentDao;
import dao.ActivityDao;
import dao.BookCommentDao;
import dao.BookDao;
import dao.BookMarkDao;
import dao.FollowDao;
import dao.Friend_MessageDao;
import dao.InvitationDao;
import dao.MessageDao;
import dao.MovieCommentDao;
import dao.MovieDao;
import dao.MovieMarkDao;
import dao.MusicCommentDao;
import dao.MusicDao;
import dao.MusicMarkDao;
import dao.TribusListClassifyDao;
import dao.TribusListDao;
import dao.UserDao;
import dao.UserProfileDao;
import dao.WishListDao;

import config.GlobleConfig;

@Controller
@RequestMapping("user")
public class UserController {	
			
	/**
	 * 
	 */
	    private UserDao ud = new UserDao(); 
	    private ActivityDao actiDao = new ActivityDao();
		private MovieMarkDao moviemarkdao = new MovieMarkDao();
		private BookMarkDao bookmarkdao = new BookMarkDao();
		private MusicMarkDao musicmarkdao = new MusicMarkDao();
	    private TribusListDao tribDao = new TribusListDao();
	    private WishListDao wishd = new WishListDao();
	    private TribusListClassifyDao tclassdao = new TribusListClassifyDao(); 
	    private MovieDao mdo = new MovieDao();
	    private MusicDao mudo = new MusicDao();
	    private BookDao bd = new BookDao();
		private BookCommentDao bookCom = new BookCommentDao();
		private MusicCommentDao musicCom = new MusicCommentDao();
		private MovieCommentDao movieCom = new MovieCommentDao();
		private MessageDao messageDao = new MessageDao();
	    
	    public void setCookieTime(HttpServletRequest request, HttpServletResponse res){	    		    		    	
	    	
	    	String name = request.getParameter("email");
	    	String pwd = request.getParameter("userPw");
	    	String firstTime = request.getParameter("first");
	    	
	    	Cookie nameC = new Cookie("userName", name );
	    	Cookie pwdC = new Cookie("pwd", pwd );
	    	Cookie ft = new Cookie("ft", firstTime );
	    		    	
	    	nameC.setMaxAge(60*60*24*7);	    	
	    	nameC.setValue(name);	    	
	    	
	    	pwdC.setMaxAge(60*60*24*7);
	    	pwdC.setValue(pwd);	
	    	
	    	ft.setMaxAge(60*60*24*7);
	    	ft.setValue(pwd);
	    	
	    	res.addCookie(nameC);
	    	res.addCookie(pwdC);  
	    	res.addCookie(ft);
	    }
	    	    	    
	    public void setCookieTimeNULL(HttpServletRequest request, HttpServletResponse res){	    		    		    	
	    	
	    	String name = request.getParameter("email");
	    	String pwd = request.getParameter("userPw");
	    	
	    	
	    	Cookie nameC = new Cookie("userName", name );
	    	Cookie pwdC = new Cookie("pwd", pwd );	    		    	
	    	
	    	nameC.setMaxAge(0);	    	
	    	nameC.setValue(name);	    	
	    	
	    	pwdC.setMaxAge(0);
	    	pwdC.setValue(pwd);	
	    	
	    	
	    	res.addCookie(nameC);
	    	res.addCookie(pwdC); 
	    }
	    
	    
	    public String[] getCookies(HttpServletRequest request, HttpServletResponse res){
	    	String[] nameAndPwd = new String[3];	    	
	    	Cookie[] cookies = request.getCookies();	    	
	    	if(cookies!=null){
	    		for (int i = 0; i < cookies.length; i++) {
		    		try {										
						Cookie c = cookies[i];						
						if( c.getName().equals("userName")){
							nameAndPwd[0] = c.getValue();
						}						
						if( c.getName().equals("pwd")){
							nameAndPwd[1] = c.getValue();
						}
						if( c.getName().equals("ft")){
							nameAndPwd[2] = c.getValue();
						}	
					} catch (Exception e) {					
						e.printStackTrace();
					}
				}
	    		return nameAndPwd;
	    	}	    	
	    	return null;	    	
	    }
	    
	    @RequestMapping("logout")
	    public String logout(
	    		HttpServletRequest req,
	    		HttpServletResponse res
	    ){	    	
	    	
	    	HttpSession session = req.getSession(false);
	    	session.removeAttribute("user");
	    	session.invalidate();
	    	
	    	return "redirect:/user/invitationForm.action";
	    }
	    
	    @RequestMapping("about")
	    public String about(){
	    	return "user/about";
	    }
	    
	    @RequestMapping("support")
	    public String support(){
	    	return "user/about";
	    }
	    
	    @RequestMapping("career")
	    public String career(){
	    	return "user/about";
	    }
	    @RequestMapping("police")
	    public String police(){
	    	return "user/police";
	    }
	    
	    
	    @RequestMapping("loginFace")
	    public String loginFromFacebook(
	    		HttpServletRequest request 	    			    			    			    			    		    		
	    ){	  
	    	String email = request.getParameter("face_email");
	    	String uid = request.getParameter("uid");
	    	String pic = request.getParameter("pic_big");
	    	String hometown = request.getParameter("hometown");
	    	String about_me = request.getParameter("about_me");
	    	String name = request.getParameter("face_name");
	    	
	    	UserProfileDao upd = new UserProfileDao();	    	
	    	User u_face = new User();
	    	
	    	if(email != null && !"".equals(email))
	    		u_face.setUserEmail(uid+"@facebook.com");
	    	else
	    		u_face.setUserEmail(email);
	    	
	   		//System.out.println(u_face.getUserEmail());	    	
	 	    		    	   
	    	User u_tmp = ud.getUserByCondition(u_face);
	    	//System.out.println(u_tmp.getUserAlias());
	    	
	    	if(u_tmp==null){
	    	  u_face.setCreateDate(new Date());
	    	  u_face.setUserPw(uid.hashCode()+"");
	    	  u_face.setUserAlias(name);
	    	  u_face.setUserPic(pic);
		      u_face.setUserIntro(about_me);	    	
//		      if(email != null && !"".equals(email)){
//		    	  u_face.setUserEmail(email);
//		      }
		      
	  		  UserProfile upf = new UserProfile();		  	  		  
	  		  upf.setUser(u_face);
	  		  upf.setProfCity(hometown);
	  		  
		      if(ud.add(u_face) == 1){
				  upd.add(upf);				 
			  }
	    	}	
	    	if(u_tmp!=null)
	    		logon(request, u_tmp);
	    	else
	    		logon(request, u_face);
	    	
	    	return "redirect:/activity/index.action";
	    }	    	    
	    
	    @RequestMapping(value="login",method = RequestMethod.POST)
	    public ModelAndView login(HttpServletRequest request,HttpServletResponse response) {
		  
		  ModelAndView view = new ModelAndView();		  		  
		  String email = request.getParameter("email"); // email
		  String pwd = request.getParameter("userPw");
		  String remeber = request.getParameter("remember");
		  
		  if(remeber!= null && remeber.equals("1")){
			  setCookieTime(request,response);
		  }else{
			  setCookieTimeNULL(request,response);  
		  }
		  
		  //GenericValidator.isBlankOrNull(name) 	  
		  if(GenericValidator.minLength(email, 1) == false || GenericValidator.minLength(pwd, 1) == false){
			  view.addObject("message_empty", "your name or password is empty !");
			  view.setViewName("user/invitationForm_9_21/invitation-login-empty");			  
		  }else{			  
			  User u = ud.login(email, pwd);
			  //ud.getUserByCondition
			  		  		       
			  if(u == null){				  
				  view.addObject("message_name_error", "your name or password not currect ! ");
				  view.setViewName("user/invitationForm_9_21/invitation-login-empty");				  
			  }else if(u.getUserState() == 0){
				  view.addObject("message_not_acti", "you have nor activite your account!");
				  view.setViewName("user/invitationForm_9_21/invitation-login-empty");
			  }else if(u.getUserState() == 1){				  
				  logon(request,u);
				  //view.setViewName("redirect:my.action");
				  view.setViewName("redirect:/activity/index.action");
			  }			  			 		  			 
		  }		  		  		  
		  return view;  
	    }
	  		
	  	
	  @RequestMapping("friendHome/{fId}")
	  public ModelAndView friendsHomepage(
			  HttpServletRequest req,
			  HttpServletResponse res,			  
			  @PathVariable("fId")int fId
	  ){
		  
		  int page = 1;
		  
          if(GenericValidator.isInt(req.getParameter("page"))){			  			  
			  page = Integer.parseInt(req.getParameter("page"));			  
		  }
		  
		  
		  User u = getUser(req, res);
		  int myId = u.getUserId();
		  
		  ModelAndView mv = new ModelAndView();
		  
		  if(myId == fId){
			  mv.setViewName("redirect:/user/my.action");
			  return mv;
		  }
		 
		  
		  List<MessageVO> unreadInboxmails  = null;
		try {
			unreadInboxmails = messageDao.getUserInboxMessageAllUnread(myId);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  
		  
		  CompareUserLike c = new CompareUserLike();
		  List<BookMarkVo> list_book_same = c.getUserBookSimilar(myId, fId);
		  List<MovieMarkVo> list_movie_same = c.getUserMovieSimilar(myId, fId);
		  List<MusicMarkVo> list_music_same = c.getUserMusicSimilar(myId, fId);
		  
		  
		  int number_book_same = list_book_same == null ? 0 : list_book_same.size();
		  int number_movie_same = list_movie_same == null ? 0 : list_movie_same.size();
		  int number_music_same = list_music_same == null ? 0 : list_music_same.size();
		  
		  int total = number_book_same + number_movie_same + number_music_same;
		  	
		  	
		  	UserProfileDao upd = new UserProfileDao(); 
	    	UserProfile upf = upd.getUserProfileById(myId);
	    	//User u = upf.getUser();
	    	
	    	User friend = ud.getUserById(fId);
	    	UserProfile friendProf = upd.getUserProfileById(fId);
	    		    	
	    	MovieDao md = new MovieDao();
	    	List<Movie> user_wanted_movies = md.getMoviesWantedByUserId(fId);
	    	List<Movie> user_watch_movies = md.getMoviesWatchedByUserId(fId);
	    	
	    	BookDao bd = new BookDao();
	    	List<Book> user_wanted_book = bd.getBooksWantedByUserId(fId);
	    	List<Book> user_read_book = bd.getBooksReadByUserId(fId);
	    	
	    	MusicDao musicDao = new MusicDao();	    	
	    	List<Music> user_wanted_music = musicDao.getMusicsWantedByUserId(fId);
	    	List<Music> user_listened_music = musicDao.getMusicsListenedByUserId(fId);
	    		    	
	    	FollowDao fd = new FollowDao();
	    	List<User> l_f = fd.getAllFriends(fId); // your friends's all friends
		  	    		    	
	    	List<User> l_f_you_follow = fd.getAllYouFollow(fId);//all your friend followed
	    		    	
	    	//ActivityDao ad = new ActivityDao();
	    	List<Activity> l_friend_activity = ud.getActivityById(fId);
	    		    		    
	    	TribusListDao td = new TribusListDao();
	    	List<MyTribusList> tribusList = td.getTribusListByUserId(fId);
	    	
	    	WishListDao wd = new WishListDao();
	    	List<WishList> wl = wd.getWishListByUserId(fId);
	    		    		    	
	    	List<MusicComment> l_musicCom = musicCom.getMusicCommentByUserId(fId,8);	    			
			List<MovieComment> l_movieCom = movieCom.getMovieCommentByUserId(fId,8); 
			List<BookComment> l_bookCom = bookCom.getBookCommentByUserId(fId,8);
	    		    	 	    	
	    	/**
	    	 * friend speaking 
	    	 */
	    	
	    	Friend_MessageDao fmdao = new Friend_MessageDao(); 
			Friend_speaking fs = new Friend_speaking();
			fs.setFriend(friend);
			//fs.setMe(friend);
			List<Friend_speaking> l_fmessage = fmdao.getFriendSpeakingListByCondition(fs);
				    		    		    	
		 	Paging<Friend_speaking> p = new Paging<Friend_speaking>();
			p.setObj(l_fmessage);			
			p.setHaveOtherParameters(false);
			
			if(page <= 0){
				page = 1;
			}
			
			PageObject<Friend_speaking> po = p.getResult(GlobleConfig.show_local+"user/friendHome/"+fId+".action",page);			
			
	    	/**
	    	 * start
	    	 */
	    	
	    	mv.addObject("friend", friend);
	    	mv.addObject("friendProf", friendProf);
	    	mv.addObject("userPro", upf);
	    	mv.addObject("user", upf.getUser());
	    	mv.addObject("wantbooks",user_wanted_book);
	    	mv.addObject("readbooks",user_read_book);
	    	mv.addObject("wantmovies", user_wanted_movies);
	    	mv.addObject("watchmovies", user_watch_movies);
	    	mv.addObject("wantmusics", user_wanted_music);
	    	mv.addObject("listenmusics",user_listened_music);	    	
	    	
	    	mv.addObject("friends", l_f);
	    	mv.addObject("friendsNum", l_f == null ? 0 : l_f.size());
	    	mv.addObject("all_friend_follow", l_f_you_follow);
	    	mv.addObject("all_friend_follow_num", l_f_you_follow.size());
	    	if(l_f.contains(u)){
	    		mv.addObject("followed", 1);	
	    	}
	    		    	 
	    	mv.addObject("activity", l_friend_activity);	    	
	    	mv.addObject("tribusList", tribusList);
	    	mv.addObject("wishList", wl);	    
	    	//mv.addObject("speakings", l_fmessage);
	    	
	    	mv.addObject("pageStr", po.getPageCode());
	    	mv.addObject("speakings",po.getL());
	    	
	    	mv.addObject("unreadMail", unreadInboxmails !=null ? unreadInboxmails.size(): 0);	    	
	    	mv.addObject("total", total);
	    	mv.addObject("sameBook", list_book_same);
	    	mv.addObject("sameMovie", list_movie_same);
	    	mv.addObject("sameMusic", list_music_same);	    	
	    	mv.addObject("musicComments", l_musicCom);
	    	mv.addObject("movieComments",l_movieCom);
	    	mv.addObject("bookComments",l_bookCom);
	    	
	    	/**
	    	 * end
	    	 */	    			  
	    	
	    	mv.setViewName("user/new_friendHomePage");
		  return mv;
	  }
	  
	  
	  @RequestMapping("sameInterets/{id}/{fid}")
	  public ModelAndView sameInterets(HttpServletRequest req, HttpServletResponse res,
			  @PathVariable("id")int myId,@PathVariable("fid")int fId
	  ){
		  
		  User u = getUser(req,res);
		  UserProfile upf  = getUserProfile(req, res);
		  
		  ModelAndView mv = new ModelAndView("user/same");
			  
		  
		  CompareUserLike c = new CompareUserLike();
		  List<BookMarkVo> list_book_same = c.getUserBookSimilar(myId, fId);
		  List<MovieMarkVo> list_movie_same = c.getUserMovieSimilar(myId, fId);
		  List<MusicMarkVo> list_music_same = c.getUserMusicSimilar(myId, fId);
		  
		  
		  int number_book_same = list_book_same == null ? 0 : list_book_same.size();
		  int number_movie_same = list_movie_same == null ? 0 : list_movie_same.size();
		  int number_music_same = list_music_same == null ? 0 : list_music_same.size();
		  
		  int total = number_book_same + number_movie_same + number_music_same;
		  			  		  
		  List<MessageVO> unreadInboxmails  = null;
		  try {
		  	unreadInboxmails = messageDao.getUserInboxMessageAllUnread(u.getUserId());
		  } catch (ParseException e) {				
		  	e.printStackTrace();
		  }
					
	     
		  
		  
		  mv.addObject("user", u);
		  mv.addObject("userProf", upf);
		  mv.addObject("sameBook", list_book_same);
		  mv.addObject("sameMovie", list_movie_same);
		  mv.addObject("sameMusic", list_music_same);
		  mv.addObject("total", total);
		  mv.addObject("unreadMail", unreadInboxmails !=null ? unreadInboxmails.size(): 0);
		  
		  return mv;		  
	  }
	  
	  @RequestMapping("reviewMenu")
	  public ModelAndView reviewLists(HttpServletRequest req, HttpServletResponse res
	  ){
		  	User u = getUser(req, res);
		  	ModelAndView mv = new ModelAndView("user/reviewLists");
		  
	    	List<MusicComment> l_musicCom = musicCom.getMusicCommentByUserId(u.getUserId(),Integer.MAX_VALUE);	    			
			List<MovieComment> l_movieCom = movieCom.getMovieCommentByUserId(u.getUserId(),Integer.MAX_VALUE); 
			List<BookComment> l_book = bookCom.getBookCommentByUserId(u.getUserId(),Integer.MAX_VALUE);
			
			List<MessageVO> unreadInboxmails  = null;
			try {
				unreadInboxmails = messageDao.getUserInboxMessageAllUnread(u.getUserId());
			} catch (ParseException e) {				
				e.printStackTrace();
			}
		
			
			mv.addObject("user", u);
			mv.addObject("userPro", getUserProfile(req, res));
			mv.addObject("musicCom",l_musicCom == null ? 0:l_musicCom.size());
			mv.addObject("movieCom",l_movieCom == null ? 0:l_movieCom.size());
			mv.addObject("bookCom",l_book == null ? 0:l_book.size());
	    	mv.addObject("unreadMail", unreadInboxmails !=null ? unreadInboxmails.size(): 0);
	    	
		
		  return mv;  
	  }
	  
//	  @RequestMapping("reviewList/{id}")
//	  public ModelAndView reviewList(HttpServletRequest req, HttpServletResponse res,			
//			  @PathVariable("id")int id
//	  ){
//		ModelAndView mv = new ModelAndView("user/reviewList");
//		 
//    	List<MusicComment> l_musicCom = musicCom.getMusicCommentByUserId(id,8);	    			
//		List<MovieComment> l_movieCom = movieCom.getMovieCommentByUserId(id,8); 
//		List<BookComment> l_book = bookCom.getBookCommentByUserId(id,8);
//						
//		mv.addObject("musicComments", l_musicCom);
//	    mv.addObject("movieComments",l_movieCom);
//	    mv.addObject("bookComments", l_book);
//		    
//		return mv;  
//	  }
	  
	  
	  /**
	   * 1 book
	   * 2 movie
	   * 3 music
	   * 4 city
	   * @param req
	   * @param res
	   * @param type
	   * @return
	   */
	  @RequestMapping("reviewList/{type}")
	  public ModelAndView allReview(HttpServletRequest req, HttpServletResponse res,			
			  @PathVariable("type")int type){
		  		  
		  	int page = 1;
		  	if(GenericValidator.isInt(req.getParameter("page"))){			  			  
		  		page = Integer.parseInt(req.getParameter("page"));			 
		  	}
		  
		  	User u = getUser(req, res);
		  	ModelAndView mv = new ModelAndView("user/reviewList");
  	
		  	switch (type) {
			case 1:
				List<BookComment> l_book = bookCom.getBookCommentByUserId(u.getUserId(),Integer.MAX_VALUE);
				
			 	Paging<BookComment> p = new Paging<BookComment>();
				p.setObj(l_book);			
				p.setHaveOtherParameters(false);
				p.setEvery_page_item_num(15);
				if(page <= 0){
					page = 1;
				}
				
				PageObject<BookComment> po = p.getResult(GlobleConfig.show_local+"user/reviewList/"+type+".action",page);					
				mv.addObject("bookComments", po.getL());
				mv.addObject("pageStr", po.getPageCode());
				break;
			case 2:
				List<MovieComment> l_movieCom = movieCom.getMovieCommentByUserId(u.getUserId(),Integer.MAX_VALUE); 				
				
				Paging<MovieComment> p_movie = new Paging<MovieComment>();
				p_movie.setObj(l_movieCom);			
				p_movie.setHaveOtherParameters(false);
				p_movie.setEvery_page_item_num(15);
				if(page <= 0){
					page = 1;
				}
				
				PageObject<MovieComment> p_movie_o = p_movie.getResult(GlobleConfig.show_local+"user/reviewList/"+type+".action",page);					
				mv.addObject("movieComments", p_movie_o.getL());
				mv.addObject("pageStr", p_movie_o.getPageCode());
				
				break;
			case 3:
				List<MusicComment> l_musicCom = musicCom.getMusicCommentByUserId(u.getUserId(),Integer.MAX_VALUE);
				
				Paging<MusicComment> p_music = new Paging<MusicComment>();
				p_music.setObj(l_musicCom);			
				p_music.setHaveOtherParameters(false);
				p_music.setEvery_page_item_num(15);
				if(page <= 0){
					page = 1;
				}
				
				PageObject<MusicComment> p_music_o = p_music.getResult(GlobleConfig.show_local+"user/reviewList/"+type+".action",page);					
				mv.addObject("musicComments", p_music_o.getL());
				mv.addObject("pageStr", p_music_o.getPageCode());
				
				break;
			case 4:
				
				break;

			default:
				break;
			}
		  	
			List<MessageVO> unreadInboxmails  = null;
			try {
				unreadInboxmails = messageDao.getUserInboxMessageAllUnread(u.getUserId());
			} catch (ParseException e) {				
				e.printStackTrace();
			}
					
	    	mv.addObject("unreadMail", unreadInboxmails !=null ? unreadInboxmails.size(): 0);
		  		  
		  return mv;
	  }
	  
	  @RequestMapping("musicReviewList")
	  public ModelAndView musicReview(){
		  return null;
	  }
	  
	  @RequestMapping("movieReviewList")
	  public ModelAndView movieReview(){
		  return null;
	  }
	  
	  @RequestMapping("cityReviewList")
	  public ModelAndView cityReview(){
		  return null;
	  }
	  
	  @RequestMapping("register")
	  public ModelAndView registerPage(
			  HttpServletRequest req, HttpServletResponse res	  
	  ){
		  ModelAndView mv = new ModelAndView("user/register_new");		  		  
		  String email = req.getParameter("i_email");		  
		  if(email == null || "".equals(email)){
			  email = "email";
		  }
		  mv.addObject("i_email", email);		  		  
		return mv;  
	  }
	  
	  
	  /**
	   * only remember Name not password
	   * @param req
	   * @param res
	   * @return
	   */
//	  @RequestMapping("loginForm")
//	  public ModelAndView loginForm(
//			  HttpServletRequest req, HttpServletResponse res
//	  ){
//		  
//		  String inv_email = req.getParameter("inviation");
//		  
//		  ModelAndView mv = new ModelAndView();
//		  mv.addObject("i_name", inv_email); 
//		  mv.setViewName("user/login");
//		  
//		  User u = getUser(req, res);
//		  //if( u!= null ){
//			  //mv.setViewName("redirect:/activity/index.action");
//			  //return mv;
//		  //}
//		  
//		  
//		  String[] nameAndPwd = getCookies(req,res);		  		  		 		  		  
//		  if(nameAndPwd != null && nameAndPwd.length> 0 && nameAndPwd[0] != null){
//			  mv.addObject("email", nameAndPwd[0]);
//			  mv.addObject("isRem", 1);			 
//		  }else{
//			  mv.addObject("email", "username");
//			  mv.addObject("isRem", 0);
//		  }		 
//		  return mv;  
//	  }
	  
	  
	  @RequestMapping("findByName")
	  public ModelAndView findFriednsByName(HttpServletRequest req,
			  HttpServletResponse res			  
	  ){
		  String name = req.getParameter("search");
		  
		  ModelAndView mv = new ModelAndView();
		  int page = 1;
		   
		  if(!GenericValidator.isBlankOrNull(req.getParameter("page")) && 
				  GenericValidator.isInt(req.getParameter("page"))){			  			  
			  page = Integer.parseInt(req.getParameter("page"));			  
		  }
		  		  
		  User old_u = getUser(req, res);
		  UserProfile up = getUserProfile(req, res);
		  
		  User u = new User();
		  u.setUserAlias(name);
		  
		  List<User> l = null;
		  
		  if(GenericValidator.isBlankOrNull(name)){
			  l = new ArrayList<User>();
		  }else{
			  l = ud.getUserListByCondition(u);
		  }
		  
		 	Paging<User> p = new Paging<User>();
			p.setObj(l);			
			p.setHaveOtherParameters(true);
			
			
			if(page <= 0){
				page = 1;
			}
			
			PageObject<User> po = p.getResult(GlobleConfig.show_local+"user/findByName.action?search="+name,page);
			
			mv.addObject("friends", po.getL());
			  mv.addObject("followersNum",l == null ? 0 : l.size());
			  mv.addObject("userProf", up);
			  mv.addObject("user", old_u);
			  mv.addObject("pageStr", po.getPageCode());
			  mv.setViewName("user/new_followers");
			  return mv;		  		  
	  }
	  	  
	  
	  @RequestMapping("frinedsList")
	  public ModelAndView followersAndfollowees(
			  HttpServletRequest req,
			  HttpServletResponse res	 
	  ){		 
		  
		  int userId = 0;
		  int page = 0;
		  
		  if(GenericValidator.isInt(req.getParameter("id")) && GenericValidator.isInt(req.getParameter("page"))){
			  
			  userId = Integer.parseInt(req.getParameter("id"));
			  page = Integer.parseInt(req.getParameter("page"));
			  
		  }
		  	
		  ModelAndView mv = new ModelAndView();		  
		  FollowDao fd = new FollowDao();
		  UserProfileDao upd = new UserProfileDao();	
		  
		  List<User> friends = fd.getAllFriends(userId);		  
		  User u = new User();
		 	UserProfile uf = new UserProfile();
		 	
		 	HttpSession se = req.getSession();
		 	if( se != null ){
		 		u = (User)se.getAttribute("user");
		 		uf = upd.getUserProfileById(userId);
		 	}
					 	
		 	Paging<User> p = new Paging<User>();
			p.setObj(friends);			
			p.setHaveOtherParameters(true);
			
			if(page <= 0){
				page = 1;
			}
			
			PageObject<User> po = p.getResult(GlobleConfig.show_local+"user/frinedsList.action?id="+u.getUserId(),page);
			
			  mv.addObject("friends", po.getL());
			  mv.addObject("followersNum",friends.size());
			  mv.addObject("userProf", uf);
			  mv.addObject("user", u);
			  mv.addObject("pageStr", po.getPageCode());
			  mv.setViewName("user/new_followers");
			  return mv;
	  }
	  
	  
	  
	  @RequestMapping("followerList")
	  public ModelAndView followers(
			  HttpServletRequest req,
			  HttpServletResponse res	 
	  ){		 
		  
		  int userId = 0;
		  int page = 0;
		  
		  if(GenericValidator.isInt(req.getParameter("id")) && GenericValidator.isInt(req.getParameter("page"))){
			  
			  userId = Integer.parseInt(req.getParameter("id"));
			  page = Integer.parseInt(req.getParameter("page"));
			  
		  }
		  	
		  ModelAndView mv = new ModelAndView();		  
		  FollowDao fd = new FollowDao();
		  UserProfileDao upd = new UserProfileDao();	
		  
		  //List<User> friends = fd.getAllFriends(userId);		  
		  List<User> followYou = fd.getAllYouFollow(userId);
		  		  
			User u = new User();
		 	UserProfile uf = new UserProfile();
		 	
		 	HttpSession se = req.getSession();
		 	if( se != null ){
		 		u = (User)se.getAttribute("user");
		 		uf = upd.getUserProfileById(userId);
		 	}
					 	
		 	Paging<User> p = new Paging<User>();
			p.setObj(followYou);			
			p.setHaveOtherParameters(true);
			
			if(page <= 0){
				page = 1;
			}
			
			PageObject<User> po = p.getResult(GlobleConfig.show_local+"user/frinedsList.action?id="+u.getUserId(),page);
			
			  mv.addObject("friends", po.getL());
			  mv.addObject("followersNum",followYou.size());
			  mv.addObject("userProf", uf);
			  mv.addObject("user", u);
			  mv.addObject("pageStr", po.getPageCode());
			  mv.setViewName("user/new_followers");
			  return mv;
	  }
	  
	  
	  
	  
	  @RequestMapping(value="registerAction",method = RequestMethod.POST)
	  public ModelAndView register(HttpServletRequest request,HttpServletResponse response){
		  
		  ModelAndView mv = new ModelAndView();		  
		  User u = (User)TribusObjectMapping.convert("model.User", request, response);		 		  		  
		  
		  //u.setStatus(0);
		  u.setUserState(0);
		  //u.setPassword(TribusMD5.md5Encode(u.getPassword()));
		 // u.setUserPw(u.getUserPw());	
		  
		  if(!GenericValidator.isEmail(u.getUserEmail())){
			  mv.addObject("message_name_empty", "your email must validate!");
			  mv.setViewName("user/invitationForm_9_21/invitation-login-empty");  
			  return mv;
		  }
		  /**else if(!GenericValidator.minLength(u.getUserAlias(), 6)){
			  mv.addObject("message_short", "your alias must longer than 6 !");
			  mv.setViewName("user/invitationForm_9_21/invitation-login-empty");
			  return mv;
		  }**/
		  
		  //u.setStatus(0);		  		
		  //u.set
		  u.setUserPic(GlobleConfig.BASE_DOMAIN_NAME + "background1.png");
		  u.setUserVerifycode(u.hashCode());
		  u.setCreateDate(new Date());
		  
		  UserDao ud = new UserDao();
		  UserProfileDao upd = new UserProfileDao();
		  		  
		  UserProfile upf = new UserProfile();		  
		  upf.setUser(u);
		  
		  if(ud.haveRegistered(u.getUserEmail(),"") != null){
			  mv.addObject("message_used", "your email name have been used !");
			  mv.setViewName("user/register_new");
			  return mv;
		  }
		  
		  if(ud.add(u) == 1){
			  upd.add(upf);
			  
			  
			  Mail sendmail = new Mail();  
	          try {	        	  

	            sendmail.setReplyEmail(u.getUserEmail());
	            sendmail.setName(u.getUserAlias());
	            sendmail.setUrl("http://gotribus.com/user/registerConfirm.action?user="+u.getUserVerifycode());
	        	sendmail.setMail_to(u.getUserEmail());  
	             
				sendmail.send();
				
				System.out.println("---------send mail success-----------");
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}			  			  
			//  mv.setViewName("redirect:/activity/index.action");
		  }
		
//		  logon(request,u);		
		  mv.addObject("message", "Go to your email to verify !!");
		  mv.setViewName("user/register_new");  
		  return mv;
		  
	  }
	  
	  
	  
	  @RequestMapping(value="error",method = RequestMethod.GET)
	  public String invitationError(HttpServletRequest request,HttpServletResponse response){		  
		  return "user/error";
	  }
	  
	  @RequestMapping(value="error_input",method = RequestMethod.GET)
	  public String invitationErrorInput(HttpServletRequest request,HttpServletResponse response){		  
		  return "user/error_input";
	  }
	  
	  @RequestMapping(value="error_name",method = RequestMethod.GET)
	  public String invitationErrorName(HttpServletRequest request,HttpServletResponse response){		  
		  return "user/error_name";
	  }
//	  @RequestMapping("invitationForm")	  
	  @RequestMapping(value="invitationForm",method = RequestMethod.GET)
	  public ModelAndView invitationForm(HttpServletRequest request,HttpServletResponse response){		
		   		  
		  ModelAndView mv = new ModelAndView("user/invitationForm_9_21/invitation-login-empty");
		  //ModelAndView mv = new ModelAndView("user/invitation-login-empty");
		  
		  String[] nameAndPwd = getCookies(request,response);
		 
		  if(nameAndPwd != null && nameAndPwd.length> 2 && nameAndPwd[0] != null
			&& nameAndPwd[2] != null  
		  ){
			  mv.addObject("email", nameAndPwd[0]);
			  mv.addObject("isRem", 1);	
			  mv.addObject("ft", 1);
		  }else{
			  mv.addObject("email", "username");
			  mv.addObject("isRem", 0);
			  mv.addObject("ft", 0);
			  
		  }		
		  return mv;
	  }
	    
	   
	  @RequestMapping(value="invitation",method = RequestMethod.POST)
	  public ModelAndView invitation(HttpServletRequest request,HttpServletResponse response){
		  
		  InvitationDao id = new InvitationDao(); 
		  ModelAndView mv = new ModelAndView();		  
		  Invitation inv = (Invitation)TribusObjectMapping.convert("model.Invitation", request, response);
		  
		  if(!GenericValidator.isEmail(inv.getEmail()) || GenericValidator.isBlankOrNull(inv.getEmail())){
			  mv.addObject("message", "Email not illegal ! ");			 
			  mv.setViewName("user/invitation-login-empty");
		  }else{
			  id.save(inv);
			  mv.addObject("message", "ok !");
			  mv.setViewName("user/success");
		  }		  		  
		  return mv;
	  }
	  
	    @RequestMapping(value="registerConfirm",method = RequestMethod.GET)	    
	    public ModelAndView registerConfirm(HttpServletRequest request,HttpServletResponse response) {
	    	
	    	ModelAndView mv = new ModelAndView();
	    	String hashCode = request.getParameter("user");
	    	if("".equals(hashCode) || hashCode == null || !GenericValidator.isInt(hashCode)){
	    		mv.setViewName("user/notActivated");	    			    	 
	    	}else{
	    		User u = new User();
		    	u.setUserVerifycode(Integer.parseInt(hashCode));
		    	User user = ud.getUserByCondition(u);
		    	user.setUserState(1);
		    	ud.update(user);		   
		    	
		    	logon(request,user);		    			    	
		    	//mv.setViewName("/activity/index.action");
		    	mv.setViewName("redirect:/activity/index.action");
		    	
	    	}	    	
	    	return mv;
	    }
	    
	    
	    /**
	     * Using Ajax
	     * @param followerId
	     * @param followeeId
	     * @param req
	     * @param res
	     */
	    @RequestMapping("follow/{followerId}/{followeeId}")
	    public void follow(
	    		@PathVariable("followerId")int followerId,
				@PathVariable("followeeId")int followeeId,
				HttpServletRequest req,
				HttpServletResponse res
	    ) {	    	
	       
	        Follow f = new Follow();
	        f.setFolloweeId(followeeId);
	        f.setFollowerId(followerId);
	        f.setFollowStatus(1);
	        
	        FollowDao fd = new FollowDao();
	        int result = fd.add(f);
	        
	        //view.addObject("followSuccess", true);
	        //view.setViewName("user/index");
	        try {
	        	if(result == 1)
	        		res.getWriter().write("ok");
	        	else
	        		res.getWriter().write("no");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	        
	        //return view;
	    }
	    
	    
	    
	    /**
	     * Using Ajax
	     * @param followerId
	     * @param followeeId
	     * @param req
	     * @param res
	     */
	    @RequestMapping("unfollow/{followerId}/{followeeId}")
	    public void unfollow(
	    		@PathVariable("followerId")int followerId,
				@PathVariable("followeeId")int followeeId,
				HttpServletRequest req,
				HttpServletResponse res
	    
	    ) {	    	
	    	        
	        Follow f = new Follow();
	        f.setFolloweeId(followeeId);
	        f.setFollowerId(followerId);
	        
	        FollowDao fd = new FollowDao();
	        int result = fd.update(f);	        	   
	        try {
	        	if(result == 1)
	        		res.getWriter().write("ok");
	        	else
	        		res.getWriter().write("no");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	                
	    }
	    
	    
	    @RequestMapping("addWishList/reivew/{type}/{id}")
	    public void addReivewWishList(	
	    		@PathVariable("type")String type,
	    		@PathVariable("id")int id,					    		
	    		HttpServletRequest req,HttpServletResponse res
	    ){
	    	
	    	
	    	
	    	HttpSession hs = req.getSession();
	    	User obj = (User)hs.getAttribute("user");
	    	//UserProfileDao ud = new UserProfileDao();
	    	//UserProfile upf = ud.getUserProfileById(obj.getUserId());
	    	
	    	
	    	WishListDao td = new WishListDao();
    		WishList myt = new WishList();
    		
    		
	    	if( "music".equals(type) ){
	    		
	    		MusicDao md = new MusicDao();
		    	Music m = md.getMusicById(id);
		    	myt.setResourceId(id);
	    		myt.setUser(obj);	    		
	    		myt.setType("music");
	    		myt.setCreateDate(new Date());
	    		myt.setWishListName( m == null ? "": m.getMusicAlias());
	    		
		    	
		    	
	    	}else if( "book".equals(type) ){
	    		
	    		BookDao bd = new BookDao();
	    		Book b = bd.getBookById(id);
	    		myt.setResourceId(id);
	    		myt.setUser(obj);  		
	    		myt.setType("book");
	    		myt.setCreateDate(new Date());
	    		myt.setWishListName( b == null ? "": b.getBookName());
	    		
	    	}else if("movie".equals(type)){
	    		
	    		MovieDao md = new MovieDao();
	    		Movie m = md.getMovieById(id);
	    		myt.setResourceId(id);
	    		myt.setUser(obj);   		
	    		myt.setType("movie");
	    		myt.setCreateDate(new Date());
	    		myt.setWishListName( m == null ? "": m.getMovieNameOriginal());
	    			    		
	    	}	    		    
	
				int result = 0;
				try{
					result = td.add(myt);
					
		    		if(result == 1){
		    			res.getWriter().write("ok!");
		    		}else{
		    			res.getWriter().write("no");
		    		}  	
				}catch(Exception e){
					e.printStackTrace();
				}
	    		
	    	
	    }
	    
	    @RequestMapping("addTribusList/reivew/{type}/{id}")
	    public void addReviewTribusList(
	    
	    		@PathVariable("type")String type,
	    		@PathVariable("id")int id,					    		
	    		HttpServletRequest req,HttpServletResponse res
	    			
	    ){

	    	
	    	HttpSession hs = req.getSession();
	    	User obj = (User)hs.getAttribute("user");
	    	//UserProfileDao ud = new UserProfileDao();
	    	//UserProfile upf = ud.getUserProfileById(obj.getUserId());
	    	
	    	
	    	TribusListDao td = new TribusListDao();
    		MyTribusList myt = new MyTribusList();
    		
    		
	    	if( "music".equals(type) ){
	    		
	    		MusicDao md = new MusicDao();
		    	Music m = md.getMusicById(id);
		    	myt.setResourceId(id);
	    		myt.setUser(obj);	    		
	    		myt.setType("music");
	    		myt.setCreateDate(new Date());
	    		myt.setResourceName( m == null ? "": m.getMusicName());
	    		
		    	
		    	
	    	}else if( "book".equals(type) ){
	    		
	    		BookDao bd = new BookDao();
	    		Book b = bd.getBookById(id);
	    		myt.setResourceId(id);
	    		myt.setUser(obj);	    		
	    		myt.setType("book");
	    		myt.setCreateDate(new Date());
	    		myt.setResourceName( b == null ? "": b.getBookName());
	    		
	    	}else if("movie".equals(type)){
	    		
	    		MovieDao md = new MovieDao();
	    		Movie m = md.getMovieById(id);
	    		myt.setResourceId(id);
	    		myt.setUser(obj);	    			    		
	    		myt.setType("movie");
	    		myt.setCreateDate(new Date());
	    		myt.setResourceName( m == null ? "": m.getMovieNameOriginal());
	    			    		
	    	}	    		    
	
				int result = 0;
				try{
					result = td.add(myt);
					
		    		if(result == 1){
		    			res.getWriter().write("ok");
		    		}else{
		    			res.getWriter().write("no");
		    		}  	
				}catch(Exception e){
					e.printStackTrace();
				}
	    		
	    	
	    }
	    
	    
	    @RequestMapping("addWishList/music/{resourceId}")
	    public void addMusicWishList(
	    		@PathVariable("resourceId")int id,					    		
	    		HttpServletRequest req,HttpServletResponse res) throws Exception{
	    	
	    	HttpSession hs = req.getSession();
	    	User obj = (User)hs.getAttribute("user");
//	    	UserProfileDao ud = new UserProfileDao();
//	    	UserProfile upf = ud.getUserProfileById(obj.getUserId());
	    	MusicDao md = new MusicDao();
	    	Music m = md.getMusicById(id);
	    	
	    		WishListDao td = new WishListDao();
	    		WishList myt = new WishList();
	    		myt.setResourceId(id);
	    		myt.setUser(obj);   		
	    		myt.setType("music");
	    		myt.setCreateDate(new Date());
	    		myt.setWishListName( m == null ? "": m.getMusicName());
	    		
				int result = 0;
				result = td.add(myt);
				
	    		if(result == 1){
	    			res.getWriter().write("Already Added ");
	    		}else{
	    			res.getWriter().write("+ Track List ");
	    		}  	
	    }
	    
	    
	    
	    @RequestMapping("addWishList/movie/{resourceId}")
	    public void addMovieWishList(
	    		@PathVariable("resourceId")int id,					    		
	    		HttpServletRequest req,HttpServletResponse res) throws Exception{
	    	
	    	HttpSession hs = req.getSession();
	    	User obj = (User)hs.getAttribute("user");
//	    	UserProfileDao ud = new UserProfileDao();
//	    	UserProfile upf = ud.getUserProfileById(obj.getUserId());
	    	
	    	MovieDao md = new MovieDao();
	    	Movie m = md.getMovieById(id);
	    		WishListDao td = new WishListDao();
	    		WishList myt = new WishList();
	    		myt.setResourceId(id);
	    		myt.setUser(obj);
	    		myt.setCreateDate(new Date());
	    		myt.setWishListName(m == null ? "":m.getMovieNameOriginal());
	    		myt.setType("movie");
	    		
				int result = 0;
				result = td.add(myt);
				
	    		if(result == 1){
	    			res.getWriter().write("Already Added ");
	    		}else{
	    			res.getWriter().write("+ Track List ");
	    		}
	    }
	    
	    
	    
	    @RequestMapping("addWishList/city/{resourceId}")
	    public void addCityWishList(
	    		@PathVariable("resourceId")int id,					    		
	    		HttpServletRequest req,HttpServletResponse res) throws Exception{
	    	
	    	HttpSession hs = req.getSession();
	    	User obj = (User)hs.getAttribute("user");
	    	//UserProfileDao ud = new UserProfileDao();
	    	//UserProfile upf = ud.getUserProfileById(obj.getUserId());
	    	ActivityDao ad = new ActivityDao();
	    	Activity city = ad.getActivityById(id);
	    	
	    		WishListDao td = new WishListDao();
	    		WishList myt = new WishList();
	    		myt.setResourceId(id);
	    		myt.setUser(obj);  		
	    		myt.setType("city");
	    		myt.setWishListName(city == null ? "" : city.getActivityName());
	    		myt.setCreateDate(new Date());
	    		
				int result = 0;
				result = td.add(myt);
				
	    		if(result == 1){
	    			res.getWriter().write("Already Added");
	    		}else{
	    			res.getWriter().write("+ Track List");
	    		}	    		    	
	    }
	    
	    
	    
	    @RequestMapping("addWishList/book/{resourceId}")
	    public void addBookWishList(
	    		@PathVariable("resourceId")int id,					    		
	    		HttpServletRequest req,HttpServletResponse res) throws Exception{
	    	
	    	HttpSession hs = req.getSession();
	    	User obj = (User)hs.getAttribute("user");
	    	//UserProfileDao ud = new UserProfileDao();
	    	//UserProfile upf = ud.getUserProfileById(obj.getUserId());
	    	
	    	BookDao bd = new BookDao();
	    	Book b = bd.getBookById(id);
	    		WishListDao td = new WishListDao();
	    		WishList myt = new WishList();
	    		myt.setResourceId(id);
	    		myt.setUser(obj);
	    		myt.setWishListName(b == null ? "":b.getBookName());
	    		myt.setCreateDate(new Date());
	    		myt.setType("book");
	    		
				int result = 0;
				result = td.add(myt);
				
	    		if(result == 1){
	    			res.getWriter().write("Already Added ");
	    		}else{
	    			res.getWriter().write("+ Track List");
	    		}	    		    	
	    }
	    	   
	    
	    
	    @RequestMapping("addTribusList/city/{tribuslistId}/{resourceid}")
	    public void addCityTribusListClass(
	    		@PathVariable("resourceid")int id,
	    		@PathVariable("tribuslistId")int tribuslistId,
	    		HttpServletRequest req,HttpServletResponse res) throws IOException{
	    	    	

	    	HttpSession hs = req.getSession();
	    	User obj = (User)hs.getAttribute("user");
	    	//UserProfileDao ud = new UserProfileDao();
	    	//UserProfile upf = ud.getUserProfileById(obj.getUserId());
	    	
	    		Activity a = actiDao.getActivityById(id);
	    		TribusClassify tcla = tclassdao.getTribusListClassById(tribuslistId);
	    			    		
	    		MyTribusList myt = new MyTribusList();
	    		
	    		myt.setClassified(tcla);
	    		myt.setResourceId(id);
	    		myt.setUser(obj);
	    		myt.setResourceName(a == null ? "":a.getActivityName());
	    		myt.setTitle(a == null ? "":a.getActivityName());
	    		myt.setCreateDate(new Date());
	    		myt.setType("city");
	    		
				int result = 0;
				result = tribDao.add(myt);
				
	    		if(result == 1){
	    			res.getWriter().write("Already Added");
	    		}else{
	    			res.getWriter().write("+ Track List");
	    		}	    		    	
	    
	    	
	    	
	    }
	    
	    /**
	     * 
	     * @param id
	     * @param type movie 1, book 2, music 3
	     * @param req
	     * @param res
	     * @throws IOException
	     */
	    @RequestMapping("addTribusList/movie/{tribusListId}/{resourceid}")
	    public void addMovieTribusListClass(
	    		@PathVariable("resourceid")int id,
	    		@PathVariable("type")int type,
	    		HttpServletRequest req,HttpServletResponse res) throws IOException{

	    	HttpSession hs = req.getSession();
	    	User obj = (User)hs.getAttribute("user");
	    	//UserProfileDao ud = new UserProfileDao();
	    	//UserProfile upf = ud.getUserProfileById(obj.getUserId());
	    	
	    		Movie m = mdo.getMovieById(id);
	    		TribusClassify tcla = tclassdao.getTribusListClassById(type);
	    			    		
	    		MyTribusList myt = new MyTribusList();
	    		
	    		myt.setClassified(tcla);
	    		myt.setResourceId(id);
	    		myt.setUser(obj);
	    		myt.setResourceName(m == null ? "":m.getMovieNameOriginal());
	    		myt.setTitle(m == null ? "":m.getMovieNameOriginal());
	    		myt.setCreateDate(new Date());
	    		myt.setType("movie");
	    		
				int result = 0;
				result = tribDao.add(myt);
				
	    		if(result == 1){
	    			res.getWriter().write("Already Added ");
	    		}else{
	    			res.getWriter().write("+ Track List");
	    		}	    		    	
	    
	    	
    	
	    }

	    
	    @RequestMapping("addTribusList/music/{tribusListId}/{resourceid}")
	    public void addMusicTribusListClass(
	    		@PathVariable("resourceid")int id,
	    		@PathVariable("type")int type,
	    		HttpServletRequest req,HttpServletResponse res) throws IOException{

	    	HttpSession hs = req.getSession();
	    	User obj = (User)hs.getAttribute("user");
	    	//UserProfileDao ud = new UserProfileDao();
	    	//UserProfile upf = ud.getUserProfileById(obj.getUserId());
	    	
	    		Music m = mudo.getMusicById(id);
	    		TribusClassify tcla = tclassdao.getTribusListClassById(type);
	    			    		
	    		MyTribusList myt = new MyTribusList();
	    		
	    		myt.setClassified(tcla);
	    		myt.setResourceId(id);
	    		myt.setUser(obj);
	    		myt.setResourceName(m == null ? "":m.getMusicName());
	    		myt.setTitle(m == null ? "":m.getMusicName());
	    		myt.setCreateDate(new Date());
	    		myt.setType("music");
	    		
				int result = 0;
				result = tribDao.add(myt);
				
	    		if(result == 1){
	    			res.getWriter().write("Already Added ");
	    		}else{
	    			res.getWriter().write("+ Track List");
	    		}	    		    	
	    
	    	
    	
	    }

	    
	    @RequestMapping("addTribusList/book/{tribusListId}/{resourceid}")
	    public void addBookTribusListClass(
	    		@PathVariable("resourceid")int id,
	    		@PathVariable("tribusListId")int type,
	    		HttpServletRequest req,HttpServletResponse res) throws IOException{

	    	HttpSession hs = req.getSession();
	    	User obj = (User)hs.getAttribute("user");
	    	//UserProfileDao ud = new UserProfileDao();
	    	//UserProfile upf = ud.getUserProfileById(obj.getUserId());
	    	
	    		Book b = bd.getBookById(id);
	    		TribusClassify tcla = tclassdao.getTribusListClassById(type);
	    			    		
	    		MyTribusList myt = new MyTribusList();
	    		
	    		myt.setClassified(tcla);
	    		myt.setResourceId(id);
	    		myt.setUser(obj);
	    		myt.setResourceName(b == null ? "":b.getBookName());
	    		myt.setTitle(b == null ? "":b.getBookName());
	    		myt.setCreateDate(new Date());
	    		myt.setType("book");
	    		
				int result = 0;
				result = tribDao.add(myt);
				
	    		if(result == 1){
	    			res.getWriter().write("Already Added ");
	    		}else{
	    			res.getWriter().write("+ Track List");
	    		}	    		    		    
	    }
	    	    
//	    @RequestMapping("addTribusList/city/{resourceid}")
//	    public void addCityTribusList(
//	    		@PathVariable("resourceid")int id,					    		
//	    		HttpServletRequest req,HttpServletResponse res) throws IOException{
//	    	
//	    	HttpSession hs = req.getSession();
//	    	User obj = (User)hs.getAttribute("user");
//	    	UserProfileDao ud = new UserProfileDao();
//	    	UserProfile upf = ud.getUserProfileById(obj.getUserId());
//	    	
//	    		ActivityDao ad = new ActivityDao();
//	    		Activity act = ad.getActivityById(id);
//	    		
//	    		TribusListDao td = new TribusListDao();
//	    		MyTribusList myt = new MyTribusList();
//	    		myt.setResourceId(id);
//	    		myt.setUser(obj);	    			    		
//	    		myt.setType("city");
//	    		myt.setResourceName(act== null ? "":act.getActivityName());
//	    		myt.setCreateDate(new Date());
//	    		
//	    		if(td.add(myt) == 1){
//	    			res.getWriter().write("Already Added");
//	    		}else{
//	    			res.getWriter().write("+ Tribus List");
//	    		}	    		   
//	    }
	    
	    
	    /**
	     *  
	     *  resourceId: bookId,movieId,musicId,activityId
	     *  resourceType: book: 1, movie :2,musicId:3, activityId : 4,
	     *                bookcomments: 5
	     *  
	     * @param resourceType
	     * @param req
	     * @param res
	     * @return
	     * @throws IOException 
	     */
	    @RequestMapping("addTribusList/movie/{resourceid}")
	    public void addMovieTribusList(
	    		@PathVariable("resourceid")int id,					    		
	    		HttpServletRequest req,HttpServletResponse res) throws IOException{
	    		  
			
	    	HttpSession hs = req.getSession();
	    	User obj = (User)hs.getAttribute("user");

	    		MovieDao md = new MovieDao();
	    		Movie m = md.getMovieById(id);
	    		
	    		TribusListDao td = new TribusListDao();
	    		MyTribusList myt = new MyTribusList();
	    		myt.setResourceId(id);
	    		myt.setUser(obj);	    		    		
	    		myt.setType("movie");
	    		myt.setResourceName(m == null ? "":m.getMovieNameOriginal());
	    		myt.setCreateDate(new Date());	    	
	    		
	    		if(td.add(myt) == 1){
	    			res.getWriter().write("ok");
	    		}else{
	    			//td.
	    			res.getWriter().write("no");
	    		}	    		    	
	    	
	    }
	    
	    
	    @RequestMapping("addTribusList/music/{resourceid}")
	    public void addMusicTribusList(
	    		@PathVariable("resourceid")int id,					    		
	    		HttpServletRequest req,HttpServletResponse res) throws Exception{
	    	
	    	HttpSession hs = req.getSession();
	    	User obj = (User)hs.getAttribute("user");
  		    	
	    	MusicDao md = new MusicDao();
	    	Music music = md.getMusicById(id);
	    	
	    		TribusListDao td = new TribusListDao();
	    		MyTribusList myt = new MyTribusList();
	    		myt.setResourceId(id);
	    		myt.setUser(obj);	    		    		
	    		myt.setType("music");
	    		myt.setResourceName(music == null ? "":music.getMusicName());
	    		myt.setCreateDate(new Date());
	    		
	    		if(td.add(myt) == 1){
	    			res.getWriter().write("ok");
	    		}else{
	    			res.getWriter().write("no");
	    		}	    		   		
	    }
	    
	    @RequestMapping("addTribusList/book/{resourceid}")
	    public void addBookTribusList(
	    		@PathVariable("resourceid")int id,					    		
	    		HttpServletRequest req,HttpServletResponse res) throws IOException{
	    	
	    	HttpSession hs = req.getSession();
	    	User obj = (User)hs.getAttribute("user");
	    	
	    	Book b = bd.getBookById(id);
	    	
	    		TribusListDao td = new TribusListDao();
	    		MyTribusList myt = new MyTribusList();
	    		myt.setResourceId(id);
	    		myt.setUser(obj);    		
	    		myt.setType("book");
	    		myt.setCreateDate(new Date());
	    		myt.setResourceName(b!=null ? b.getBookName():"");
	    		
	    		
	    		if(td.add(myt) == 1){
	    			res.getWriter().write("ok");
	    		}else{
	    			res.getWriter().write("no");
	    		}	    		   	    		
	    }
	    

	    @RequestMapping(value="emailUsed",method = RequestMethod.POST)
	    public void isNameDuplicated(
	    		HttpServletRequest request,HttpServletResponse response
	    ) {	    	
	    	String email = request.getParameter("email");
	    	try {
	    	if("".equals(email) || email == null){	    		
				response.getWriter().write("noEmail");				
	    	}else{
	    		UserDao ud = new UserDao();
	    		if(ud.isEmailUsed(email).getUserId() >0){
	    			response.getWriter().write("used"); 
	    		}else{
	    			response.getWriter().write("ok");
	    		}
	    	}	    			    			    		
	    	} catch (IOException e) {					
				e.printStackTrace();
			}	        
	    }
	    
	    /**
	     * edit user
	     * @param user
	     * @throws ParseException 
	     */
	    
	    @RequestMapping(value="editForm",method = RequestMethod.GET)
	    public ModelAndView editFormUser(HttpServletRequest req, HttpServletResponse respon	    	
	    ) throws ParseException{
	    	ModelAndView mav =	new ModelAndView();
	    	
	    	HttpSession se = req.getSession();
	    	User user = (User)se.getAttribute("user");
	    		    		    	
	    	if( user!=null ){
		    	UserProfileDao upd = new UserProfileDao();
		    	UserProfile u = upd.getUserProfileById(user.getUserId());
		    
		    	List<?> unreadInboxmails = messageDao.getUserInboxMessageAllUnread(user.getUserId());
		    	
		    	mav.addObject("unreadMail", unreadInboxmails !=null ? unreadInboxmails.size(): 0);
		    	mav.addObject("userProf", u);
		    	mav.addObject("user", u.getUser());
		    	mav.setViewName("user/personal_setting");	    		
	    	}
	    	
	    	return mav;
	    }
	    
	    
	    /**
	     * edit user
	     * @param user
	     */
	    
	    @RequestMapping(value="editAction/{id}",method = RequestMethod.POST)
	    public String editActionUser(HttpServletRequest req, HttpServletResponse respon,
	    		@PathVariable("id")
	    		int id
	    ){
	    	UserProfile u = (UserProfile)TribusObjectMapping.convert("model.UserProfile", req, respon);
	    	User us = (User)TribusObjectMapping.convert("model.User", req, respon);
	    	
	    	UserDao udao = new UserDao();
	    	UserProfileDao ud = new UserProfileDao();
	    	
	    	UserProfile up = ud.getUserProfileById(id);	  
	    	User user = udao.getUserById(id);
	    	
	    	TribusObjectMapping.objectCopy(up, u, new String[]{"userId","profId","user"});
	    	TribusObjectMapping.objectCopy(user, us, new String[]{"userId","userEmail"});
	    	
	    	up.setUser(user);
	    	udao.update(user);
	    	int res = ud.update(up);		
	    	
	    	
	    	/**
	    	 * update the User object in session
	    	 */
	    	update(req,user);
	    	
	    	
	    	return res == 1 ? "redirect:/user/my.action" : "redirect:editForm.action";
	    }
	    
	    
	    
	    
	    
	    @RequestMapping(value="my",method = RequestMethod.GET)
	    public ModelAndView homepage(HttpServletRequest req, HttpServletResponse respon	    		
	    ){
	    	System.out.println(req.getHeader("referer"));
	    	int page = 1;
	    	if(GenericValidator.isInt(req.getParameter("page"))){				  				 
			    page = Integer.parseInt(req.getParameter("page"));				  
	     	}
	    		    	
	    	/**
	    	 * check it on filter
	    	 */
	    	User u = getUser(req,respon);
	    	int id = u.getUserId();
	    		    	
	    	ModelAndView mv = new ModelAndView();
	    	mv.setViewName("user/my");	    
	    	
	    	UserProfileDao upd = new UserProfileDao(); 
	    	UserProfile upf = upd.getUserProfileById(id);
	    	//User u = upf.getUser();	    	
	    	
	    	MovieDao md = new MovieDao();
	    	List<Movie> user_wanted_movies = md.getMoviesWantedByUserId(id);
	    	List<Movie> user_watch_movies = md.getMoviesWatchedByUserId(id);
	    	
	    	BookDao bd = new BookDao();
	    	List<Book> user_wanted_book = bd.getBooksWantedByUserId(id);
	    	List<Book> user_read_book = bd.getBooksReadByUserId(id);
	    	
	    	MusicDao musicDao = new MusicDao();	    	
	    	List<Music> user_wanted_music = musicDao.getMusicsWantedByUserId(id);
	    	List<Music> user_listened_music = musicDao.getMusicsListenedByUserId(id);
	    		    	
	    	FollowDao fd = new FollowDao();
	    	List<?> l_f = fd.getAllFriends(id);
	    	List<?> l_you_follow = fd.getAllYouFollow(id);
	    		    	  
	    	//BookCommentDao bcd = new BookCommentDao();
	    	//List<UserComment> user_comment_list = bcd.getBookCommentsByUserId(id);
	    		    	
	    	List<Activity> l_acit = ud.getActivityById(id);
	    	ActivityCommentDao acd = new ActivityCommentDao();   
	    	List<ActivityComment> user_acitivity_list = acd.getActivityCommentByCondition(0,id);
	    	List<ActivityVO> user_aci_lav = buildActivityVO(user_acitivity_list);	    	
	    		    	
	    	//bookCom.getBookCommentById(commentId)
	    	List<MusicComment> l_musicCom = musicCom.getMusicCommentByUserId(id,8);	    			
			List<MovieComment> l_movieCom = movieCom.getMovieCommentByUserId(id,8); 
			List<BookComment> l_bookCom = bookCom.getBookCommentByUserId(id,8);
	    	
	    	TribusListDao td = new TribusListDao();
	    	List<MyTribusList> tribusList = td.getTribusListByUserId(id);
	    	
	    	WishListDao wd = new WishListDao();
	    	List<WishList> wl = wd.getWishListByUserId(id);
	    	
	    	List<MessageVO> unreadInboxmails  = null;
	  		try {
	  			unreadInboxmails = messageDao.getUserInboxMessageAllUnread(id);
	  		} catch (ParseException e) {	  			
	  			e.printStackTrace();
	  		}	    	
		 	
		 	Paging<ActivityVO> p = new Paging<ActivityVO>();
			p.setObj(user_aci_lav);			
			p.setHaveOtherParameters(false);
									
			PageObject<ActivityVO> po = p.getResult(GlobleConfig.show_local+"user/my.action",page<=0 ? 1 : page);				  			  			  			  		
	    	
			
			Friend_MessageDao fmdao = new Friend_MessageDao(); 
			Friend_speaking fs = new Friend_speaking();
			fs.setFriend(u);
			//fs.setMe(friend);
			List<Friend_speaking> l_fmessage = fmdao.getFriendSpeakingListByCondition(fs);
				    		    		    	
		 	Paging<Friend_speaking> p1 = new Paging<Friend_speaking>();
			p1.setObj(l_fmessage);			
			p1.setHaveOtherParameters(false);
			
			if(page <= 0){
				page = 1;
			}
			
			PageObject<Friend_speaking> po1 = p1.getResult(GlobleConfig.show_local+"user/friendHome/"+id+".action",page);			
			
			
			
			mv.addObject("pageStr", po1.getPageCode());
	    	mv.addObject("speakings",po1.getL() == null && po1.getL().size() > 15 ? po1.getL().subList(0, 15) : po1.getL());
	    	
	    	mv.addObject("userPro", upf);
	    	mv.addObject("proGender", upf.getProfGender() == 1 ? "She":"He");
	    	mv.addObject("user", u);
	    	mv.addObject("wantbooks",user_wanted_book);
	    	mv.addObject("readbooks",user_read_book);
	    	mv.addObject("wantmovies", user_wanted_movies);
	    	mv.addObject("watchmovies", user_watch_movies);
	    	mv.addObject("wantmusics", user_wanted_music);
	    	mv.addObject("listenmusics",user_listened_music);	    	
	    	mv.addObject("friends", l_f);
	    	mv.addObject("friendsNum", l_f == null ? 0 : l_f.size());
	    	mv.addObject("youFollow",l_you_follow == null ? 0 :l_you_follow.size());
	    	mv.addObject("youFollowList",l_you_follow);
	    	mv.addObject("activity", l_acit);
	    	
	    	mv.addObject("tribusList", tribusList);
	    	mv.addObject("wishList", wl);
	    	//mv.addObject("comments", user_comment_list);
	    	
	    	mv.addObject("activityComments", po.getL());
	    	mv.addObject("activityCommentsStr", po.getPageCode());
	    	
	    	mv.addObject("unreadMail", unreadInboxmails !=null ? unreadInboxmails.size(): 0);
	    	
	    	mv.addObject("musicComments", l_musicCom);
	    	mv.addObject("movieComments",l_movieCom);
	    	mv.addObject("bookComments",l_bookCom);
	    	
	    	return mv;
	    }
	    	
	    
	    @RequestMapping("searchAll")
	    public ModelAndView searchAll(HttpServletRequest req,HttpServletResponse res){
	    	
	    	User u = getUser(req,res);
	    	UserProfile up = getUserProfile(req,res);
	    	
	    	String name = req.getParameter("search");
	    	
	    	if(GenericValidator.isBlankOrNull(name)){	    		
	    		name = req.getParameter("search_fo");
	    		if(GenericValidator.isBlankOrNull(name)){	    				    		
	    			return null;	
	    		}	    		
	    	}
	    	
	    	ModelAndView mv = new ModelAndView();
	    	mv.setViewName("user/searchAll");
	    	
	    	MovieDao md = new MovieDao();
	    	BookDao bd = new BookDao();
	    	MusicDao musicdao = new MusicDao();	    	
	    	
	    	List<Movie> movies = md.searchMovieByName(name);
	    	List<Book> books = bd.searchBookByName(name);
	    	List<Music> musics = musicdao.searchMusicByName(name);
	    		    
	    	List<MessageVO> unreadInboxmails  = null;
	  		try {
	  			unreadInboxmails = messageDao.getUserInboxMessageAllUnread(u.getUserId());
	  		} catch (ParseException e) {
	  			// TODO Auto-generated catch block
	  			e.printStackTrace();
	  		}
	    	
	  		mv.addObject("unreadMail", unreadInboxmails !=null ? unreadInboxmails.size(): 0);
	    	mv.addObject("user", u);
	    	mv.addObject("userP", up);
	    	mv.addObject("books", books);
	    	mv.addObject("movies", movies);
	    	mv.addObject("musics", musics);
	    		    	
	    	return mv;
	    }
	    
	    @RequestMapping("cityList/{userId}")
	    public void getCityList(
	    		HttpServletRequest req,HttpServletResponse res		
	    ){
	    	
	    }
	    
	    
	    
	    @RequestMapping("friendResourceList/{type}/{fid}")
	    public ModelAndView getFriendResourceList(
	    		HttpServletRequest req,HttpServletResponse res,
	    		@PathVariable("type")int type,
	    		@PathVariable("fid")int fid
	    ){
	    	User u = getUser(req, res);
	    	ModelAndView mv = new ModelAndView();
	    		    	
	    	int page = 1;
	    	if(GenericValidator.isInt(req.getParameter("page"))){				 
			  page = Integer.parseInt(req.getParameter("page"));				  
			}
	    	
	    	/**
	    	 * type : 
	    	 * 0 movie_want 
	    	 * 1 movie_done
	    	 * 2 music_want
	    	 * 3 music_done
	    	 * 4 book_want
	    	 * 5 book_done	    	 
	    	 */
	    	switch (type) {
			case 0:
				mv.setViewName("user/movieList");
				List<Movie> l = mdo.getMoviesWantedByUserId(fid);
				mv.addObject("list", l);
				break;
			case 1:
				mv.setViewName("user/movieList");
				List<Movie> l_m = mdo.getMoviesWatchedByUserId(fid);
				mv.addObject("list", l_m);
				break;

			case 2:
				mv.setViewName("user/musicList");
				List<Music> l_mu = mudo.getMusicsWantedByUserId(fid);
				mv.addObject("list", l_mu);
				break;

			case 3:
				mv.setViewName("user/musicList");
				List<Music> l_mud = mudo.getMusicsListenedByUserId(fid);
				mv.addObject("list", l_mud);
				break;
			case 4:
				mv.setViewName("user/bookList");
				List<Book> l_b = bd.getBooksWantedByUserId(fid);
				mv.addObject("list", l_b);
				break;
			case 5:
				mv.setViewName("user/bookList");
				List<Book> l_b_d = bd.getBooksReadByUserId(fid);
				mv.addObject("list", l_b_d);
				break;

			default:
				break;
			}
	    	return mv;
	    }
	    
	    
	    
	    @RequestMapping("resourceList/{type}")
	    public ModelAndView getResourceList(
	    		HttpServletRequest req,HttpServletResponse res,
	    		@PathVariable("type")int type
	    ){
	    	User u = getUser(req, res);
	    	ModelAndView mv = new ModelAndView();
	    	
	    	
	    	int page = 1;
	    	if(GenericValidator.isInt(req.getParameter("page"))){				 
			  page = Integer.parseInt(req.getParameter("page"));				  
			}
	    	
	    	/**
	    	 * type : 
	    	 * 0 movie_want 
	    	 * 1 movie_done
	    	 * 2 music_want
	    	 * 3 music_done
	    	 * 4 book_want
	    	 * 5 book_done	    	 
	    	 */
	    	switch (type) {
			case 0:
				mv.setViewName("user/movieList");
				List<Movie> l = mdo.getMoviesWantedByUserId(u.getUserId());
				mv.addObject("list", l);			
				break;
			case 1:
				mv.setViewName("user/movieList");
				List<Movie> l_m = mdo.getMoviesWatchedByUserId(u.getUserId());
				mv.addObject("list", l_m);
				break;

			case 2:
				mv.setViewName("user/musicList");
				List<Music> l_mu = mudo.getMusicsWantedByUserId(u.getUserId());
				mv.addObject("list", l_mu);
				break;

			case 3:
				mv.setViewName("user/musicList");
				List<Music> l_mud = mudo.getMusicsListenedByUserId(u.getUserId());
				mv.addObject("list", l_mud);
				break;
			case 4:
				mv.setViewName("user/bookList");
				List<Book> l_b = bd.getBooksWantedByUserId(u.getUserId());
				mv.addObject("list", l_b);
				break;
			case 5:
				mv.setViewName("user/bookList");
				List<Book> l_b_d = bd.getBooksReadByUserId(u.getUserId());
				mv.addObject("list", l_b_d);
				break;

			default:
				break;
			}
	    	
	    	mv.addObject("userProf", getUserProfile(req,res));
	    	
	    	return mv;
	    }
	    
	    @RequestMapping("commentList/{type}/{userId}")
	    public void getCommentList(
	    		HttpServletRequest req,HttpServletResponse res		
	    ){
	    	
	    }
	    

	    @RequestMapping("tribusClassList/{userId}")
	    public void getTribusClassList(
	    		HttpServletRequest req,HttpServletResponse res		
	    ){
	    	int page = 1;
			if(GenericValidator.isInt(req.getParameter("page"))){				  				 
			    page = Integer.parseInt(req.getParameter("page"));				  
			}	    		    		    	
	    	ModelAndView mv = new ModelAndView();
	    	
	    	int id = 0;
	    	List<MyTribusList> l = tribDao.getTribusListByUserId(id);
	    	
	    	
	    	Paging<MyTribusList> p = new Paging<MyTribusList>();
			p.setObj(l);			
			p.setHaveOtherParameters(false);

			PageObject<MyTribusList> po = p.getResult(GlobleConfig.show_local+"user/tribusList/"+id+".action",page);
			
			mv.setViewName("user/tribusList");	
	    	mv.addObject("lists", po.getL());
	    	mv.addObject("pageStr", po.getPageCode());
	    	mv.addObject("userProf", getUserProfile(req,res));
	    	mv.addObject("user", getUser(req,res));
	    	
	    	//return mv;
	    }
	    
	    
	    @RequestMapping("tribusList/{id}")
	    public ModelAndView getTribusList(
	    		HttpServletRequest req,HttpServletResponse res,
	    		@PathVariable("id")int id
	    ){	    			  
	    	int page = 1;
			if(GenericValidator.isInt(req.getParameter("page"))){				  				 
			    page = Integer.parseInt(req.getParameter("page"));				  
			}	    		    		    	
	    	ModelAndView mv = new ModelAndView();	    	    		    
	    	List<MyTribusList> l = tribDao.getTribusListByClassId(id);
	    	
	    	Paging<MyTribusList> p = new Paging<MyTribusList>();
			p.setObj(l);			
			p.setHaveOtherParameters(false);

			PageObject<MyTribusList> po = p.getResult(GlobleConfig.show_local+"user/tribusList/"+id+".action",page);
			
			mv.setViewName("user/tribusList");	
	    	mv.addObject("lists", po.getL());
	    	mv.addObject("pageStr", po.getPageCode());
	    	mv.addObject("userProf", getUserProfile(req,res));
	    	mv.addObject("user", getUser(req,res));
	    	
	    	return mv;
	    }
	    
	    @RequestMapping("wishList/{userId}")
	    public ModelAndView getWishList(
	    
	    		HttpServletRequest req,HttpServletResponse res,
	    		@PathVariable("userId")int id
	    		
	    ){
	    	ModelAndView mv = new ModelAndView();
	    	
	    	int page = 1;
			if(GenericValidator.isInt(req.getParameter("page"))){				  				 
			    page = Integer.parseInt(req.getParameter("page"));				  
			}	    		    		    	
	    	    	    		    
	    	List<WishList> l = wishd.getWishListByUserId(id);
	    	
	    	Paging<WishList> p = new Paging<WishList>();
			p.setObj(l);			
			p.setEvery_page_item_num(10);
			p.setHaveOtherParameters(false);

			PageObject<WishList> po = p.getResult(GlobleConfig.show_local+"user/wishList/"+id+".action",page);
			
			mv.setViewName("user/tribusList");	
	    	mv.addObject("list", po.getL());
	    	mv.addObject("pageStr", po.getPageCode());
	    	mv.addObject("userProf", getUserProfile(req,res));
	    	mv.addObject("user", getUser(req,res));
	    	
	    	return mv;
	    }
	    
	    
	    /**
	     * 
	     * @param req
	     * @param res
	     * @param type 0:movie, 1:music , 2:book
	     * @param id
	     */
	    @RequestMapping("deleteResource/{type}/{id}")
	    public void deleteResource(
	    		HttpServletRequest req,HttpServletResponse res,
	    		@PathVariable("type")int type,
	    		@PathVariable("id")int id
	    ){
	    	
	    	User u = getUser(req,res);	    	
	    	MovieMark mm = null;
	    	BookMark bm = null;
	    	MusicMark musicm = null;
	    	if(u!=null){
	    		mm = moviemarkdao.getMarkByMovieAndUserId(id, u.getUserId());
	    		musicm = musicmarkdao.getMarkByMusicAndUserId(id, u.getUserId());
	    		bm = bookmarkdao.getMarkByBookAndUserId(id, u.getUserId());
	    	}
	    	int delete_flag = 0;	    	
	    	switch (type) {
			case 0://movie
				moviemarkdao.deleteMovieMark(mm);
				delete_flag = 1;
				break;				
			case 1:
				musicmarkdao.deleteMusicMark(musicm);
				delete_flag = 1;
				break;				
			case 2:
				bookmarkdao.deleteBookMark(bm);
				delete_flag = 1;
				break;
			default:
				break;
			}	    
	    		    	
	    	try {
		    	if(delete_flag == 1){	    		 
					res.getWriter().write("ok!");				
		    	}else{
		    		res.getWriter().write("no");
		    	}	    	
	    	} catch (IOException e) {				
				e.printStackTrace();
			}
	    }
	    
	    /**
	     * should do it in DAO
	     */
	    private List<ActivityVO> buildActivityVO(List<ActivityComment> l){
	    	List<ActivityVO> lav = new ArrayList<ActivityVO>();
	    	if( l != null ){
	    		for (ActivityComment ac : l) {
	    			if(ac != null){	    				
	    				ActivityVO av = new ActivityVO(ac);
	    				Activity a_tmp = actiDao.getActivityById(ac.getActivityId());
	    				String name = a_tmp == null ? "":a_tmp.getActivityName();	    			
	    				av.setActivityName(name);
	    				lav.add(av);
	    			}
				}
	    		return lav;
	    	}
	    	return null;
	    }
	    
	    private User getUser(
	    		HttpServletRequest req,HttpServletResponse res
	    ){
	    	HttpSession session = req.getSession();
	    	User u = session.getAttribute("user") == null ? null : (User)session.getAttribute("user");	    		    	
	    	return u;
	    }
	    
	    private UserProfile getUserProfile(HttpServletRequest req,HttpServletResponse res){
	    	HttpSession session = req.getSession();
	    	UserProfile up = session.getAttribute("userProf") == null ? null : (UserProfile)session.getAttribute("userProf");	    		    	
	    	return up;
	    }
	    
	    
	    private void update(HttpServletRequest request , User u){	    	 
			  HttpSession session = request.getSession(true);			  			  			  
			  session.setAttribute("user", u);			  
			  if(u!=null){
				  UserProfileDao ud = new UserProfileDao();			  
				  UserProfile up = ud.getUserProfileByUserId(u.getUserId());
				  session.setAttribute("userProf", up);
			  }			  
	    }
	    
	    
	    private void logon(HttpServletRequest request , User u){	    	 
			  HttpSession session = request.getSession(true);			  			  			  
			  session.setAttribute("user", u);
			  
			  if(u!=null){
				  UserProfileDao ud = new UserProfileDao();			  
				  UserProfile up = ud.getUserProfileByUserId(u.getUserId());
				  session.setAttribute("userProf", up);
			  }
			  
			  session.setAttribute("isLogin","alreadylogin");			
	    }
	    	    
}