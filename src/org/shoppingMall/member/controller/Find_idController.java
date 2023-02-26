package org.shoppingMall.member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.shoppingMall.controller.Controller;
import org.shoppingMall.dao.MemberDao;
import org.shoppingMall.vo.Member;

public class Find_idController implements Controller {
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Map<String, String> map = new HashMap<>();
		HttpSession session = request.getSession();
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String id = request.getParameter("id");
		String url = "findmem?incorrect=y";
		MemberDao dao = MemberDao.getInstance();
		
		if (id == null) {
			map.put("name", name);
			map.put("email", email);

			Member vo = dao.findid(map);

			if (vo != null) {
				session.setAttribute("mem", vo);
				response.sendRedirect("findmem");
			} else {
				response.sendRedirect(url);
			}
		} 
		if(id != null){
			map.put("id", id);
			map.put("email", email);

			Member vo = dao.findpwd(map);
			
			if(vo != null) {
				session.setAttribute("pwd", vo);
				response.sendRedirect("findmem");
			}else {
				response.sendRedirect(url);
			}
		}

	}
}
