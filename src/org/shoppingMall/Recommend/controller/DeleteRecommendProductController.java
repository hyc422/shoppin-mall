package org.shoppingMall.Recommend.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.shoppingMall.controller.Controller;
import org.shoppingMall.dao.ProductDAO;

public class DeleteRecommendProductController implements Controller {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ProductDAO dao = ProductDAO.getInstance();
		String name = request.getParameter("productname");
		int result = dao.delete(name);
	
		
		String url="location.href='index.jsp'";
	    
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		out.print("<script>");
		if(result ==1) {
			out.print("alert('삭제성공');");
		} else {
			out.print("alert('삭제실패');");
		}
		out.print(url);
		out.print("</script>");
	}

}
