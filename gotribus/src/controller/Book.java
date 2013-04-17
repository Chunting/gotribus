package controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("book")
public class Book {
	/**
	 * Prepare the variables and the getter setter methods for the results from Amazon   By JIAO
	 * @return
	 */
	String Author;
	String Title;
	String Pages;
	String ReleaseDate;
	String ImgURL;
	
	String getAuthor(){
		return this.Author;
	}
	void setAuthor(String author){
		this.Author=author;
	}
	String getTitle(){
		return this.Title;
	}
	void setTitle(String title){
		this.Title=title;
	}
	String getPages(){
		return this.Pages;
	}
	void setPages(String pages){
		this.Pages=pages;
	}
	String getReleaseDate(){
		return this.ReleaseDate;
	}
	void setReleaseDate(String releaseDate){
		this.ReleaseDate=releaseDate;
	}
	String getImgURL(){
		return this.ImgURL;
	}
	void setImgURL(String imgURL){
		this.ImgURL=imgURL;
	}
	
	
	
	
	@RequestMapping("add/{id}")	
	public ModelAndView create() {
		 ModelAndView view = new ModelAndView();				 		 
		 view.setViewName("book/add");
		 return view;
	}
	
	
	
}