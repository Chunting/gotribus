package controller;

import org.springframework.web.bind.annotation.RequestMapping;

//@Controller
public abstract class MyController {
	// 
	
	@RequestMapping("")
	public String addResource(Object request,Object response){
		// do some process
		Resource r = process(request,response);				
		r.addResource();		
		return r.getView();
	}
	
	public abstract Resource process(Object o1,Object o2);	
	
}
