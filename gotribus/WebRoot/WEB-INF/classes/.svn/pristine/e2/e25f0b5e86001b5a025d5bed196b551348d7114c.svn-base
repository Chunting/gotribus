package controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Friend_speaking;
import model.User;
import model.UserProfile;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import util.TribusObjectMapping;

import dao.Friend_MessageDao;
import dao.UserDao;



@Controller
@RequestMapping("friendMessage")
public class FriendSpeakingController {

	private Friend_MessageDao fd = new Friend_MessageDao();
	private UserDao ud = new UserDao();
	
	
	@RequestMapping("addSpeak/{meId}/{fId}")
	public void addSpeaking(
			HttpServletRequest req,
    		HttpServletResponse res,
    		@PathVariable("meId")int meId,
    		@PathVariable("fId")int fId
	){
		Friend_speaking u = (Friend_speaking)TribusObjectMapping.convert("model.Friend_speaking", req, res);
		User me = ud.getUserById(meId);
		User friend = ud.getUserById(fId);
		u.setMessageDate(new Date());
		u.setMe(me);
		u.setFriend(friend);	
		
		int result = fd.add(u);
		try {
			if(result == 1)
				res.getWriter().write("ok!");
			else
				res.getWriter().write("no!");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	@RequestMapping("allSpeak/{id}")
	public ModelAndView getAllSpeaking(
			HttpServletRequest req,
    		HttpServletResponse res,
    		@PathVariable("id")int id
	){
		ModelAndView mv = new ModelAndView("user/friednSpeakingList");
		User u = getUser(req,res);
		UserProfile up = getUserProfile(req,res);
		
		Friend_speaking fs = new Friend_speaking();
		fs.setMe(u);
		List<Friend_speaking> l = fd.getFriendSpeakingListByCondition(fs);
		
		mv.addObject("user", u);
		mv.addObject("userProf", up);
		mv.addObject("list", l);
		
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
    	UserProfile up = session.getAttribute("userProf") == null ? null : (UserProfile)session.getAttribute("user");	    		    	
    	return up;
    }
    
	
}
