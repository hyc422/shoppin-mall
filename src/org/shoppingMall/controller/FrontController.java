package org.shoppingMall.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
//css, js 요청에 대한 응답으로 처리해야 하므로 web.xml 에서 리소스에 대한 처리 설정
@WebServlet(urlPatterns = {"/"})
public class FrontController extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	private static final Logger logger = LoggerFactory.getLogger(FrontController.class);
	
	@Override
	public void init() throws ServletException 
	{RequestControllerMapping.init();}
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String url = request.getServletPath();
		String method = request.getMethod();
		
		RequestKeyValue key = new RequestKeyValue(url,method);
		Controller controller = RequestControllerMapping.getController(key);
		
		if(controller != null)
		{
			logger.info("::::{}-{}::::",key,controller.getClass());
			controller.handle(request,response);
		}
		else	// debugging 완료시 error 페이지로 구현
			throw new RuntimeException();
	}	// method end
}	// Class end
