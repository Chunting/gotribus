package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MyTribusList;
import model.TribusClassify;
import model.User;
import model.UserProfile;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import util.TribusObjectMapping;

import dao.TribusListClassifyDao;
import dao.TribusListDao;


@Controller
@RequestMapping("tribuslist")
public class TribusListController {

	private TribusListClassifyDao tcDao = new TribusListClassifyDao();
	
	@RequestMapping("add")
	public ModelAndView addTribusList(
			HttpServletRequest req,
			HttpServletResponse res		
	){
		ModelAndView mv = new ModelAndView("user/create_tribusClassList");
		User u = getUser(req,res);
		UserProfile up = getUserProfile(req,res);
		TribusClassify tc = (TribusClassify)TribusObjectMapping.convert("model.TribusClassify", req, res);		
		List<TribusClassify> l = tcDao.getTribusListClassByUserId(u.getUserId());
						
		if(tcDao.save(tc) == 1){
			mv.addObject("message", "ok");
		}else{
			mv.addObject("message", "fail");
		}
		
		mv.addObject("userPro", up);    	
    	mv.addObject("user", u);
		mv.addObject("list", l);
		return mv;		
	}
	
	
	@RequestMapping("delete")
	public String deleteTribusList(){
		
		
		String[] ids = null;
		/**
		 *  
		 *  
		 *  dao.deleteByIds(ids);
		 *  
		 *  
		 */
		
		return null;
	}
	
	
	
	/**
	@RequestMapping("list")
	public String selectTribusList(){
							
		
		TribusListClassifyDao td = new TribusListClassifyDao();
		
		List l_book = null;// book
		
		List l_movie = null;// movie
		
		List l_music = null; // music
								
		return null;
	}
	**/
	
	@RequestMapping("list/{id}")
	public ModelAndView tribusList(
			@PathVariable("id")
			int id,
			HttpServletRequest req,
			HttpServletResponse res
	){
		
		//0:movie, 1:music, 2:book, 3:city
		
		TribusListDao td = new TribusListDao();
		List<MyTribusList> l_1 = td.getTribusListByResourceIdAndType(id,0);
		List<MyTribusList> l_2 = td.getTribusListByResourceIdAndType(id,1);
		List<MyTribusList> l_3 = td.getTribusListByResourceIdAndType(id,2);
		//List<MyTribusList> l_4 = td.getTribusListByResourceIdAndType(id,3);
		
		ModelAndView mv = new ModelAndView();
		
		MyTribusList ml = new MyTribusList();
		ml.setType("muisc");		
		List<MyTribusList> l_music = td.getTribusListByCondition(ml);
		
		ml.setTitle("movie");
		List<MyTribusList> l_movie = td.getTribusListByCondition(ml);
		
		ml.setTitle("book");
		List<MyTribusList> l_book = td.getTribusListByCondition(ml);
							
		mv.addObject("movies", l_1);
		mv.addObject("musics", l_2);
		mv.addObject("books", l_3);
		
		
		mv.addObject("booklist", l_book);
		mv.addObject("movielist", l_movie);
		mv.addObject("musiclist", l_music);
		mv.setViewName("user/tribusList");
		return mv;
	}
	
	@RequestMapping("classlist/{id}")
	public ModelAndView selectTribusListClass(
			HttpServletRequest req, HttpServletResponse res,			
			@PathVariable("id")		
			int id
	){
		ModelAndView mv = new ModelAndView();
		TribusListClassifyDao td = new TribusListClassifyDao();
		List<TribusClassify> l = td.getTribusListClassByUserId(id);
		mv.addObject("list", l);
		mv.setViewName("user/addTribusList");
		return mv;
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
	
}

