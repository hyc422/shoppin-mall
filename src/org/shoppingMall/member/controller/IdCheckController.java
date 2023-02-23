package org.shoppingMall.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.shoppingMall.controller.Controller;
import org.shoppingMall.dao.MemberDao;

public class IdCheckController implements Controller{
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		MemberDao dao = MemberDao.getInstance();
		int result = dao.idcheck(id);
		
		if(result == 0) {
		}
	}

}
