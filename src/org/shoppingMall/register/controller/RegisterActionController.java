package org.shoppingMall.register.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.shoppingMall.controller.Controller;
import org.shoppingMall.dao.MemberDao;
import org.shoppingMall.vo.Member;

public class RegisterActionController implements Controller{
@Override
public void handle(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
	// TODO Auto-generated method stub
	
	request.setCharacterEncoding("UTF-8");

	
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String nickname = request.getParameter("nickname");
	
	String email1 = request.getParameter("email1");
	String email2 = request.getParameter("email");
	String email;
	if(email2 == "0") {
		String email3 = request.getParameter("email2");
		email = email1 + "@" + email3;
	}else {
		email = email1 + "@" + email2;
	}
	String phone1 = request.getParameter("phone1");
	String phone2 = request.getParameter("phone2");
	String phone3 = request.getParameter("phone3");
	String phone = phone1 + "-" + phone2 + "-" + phone3;
	
	String c_code = request.getParameter("c_code");
	String address1 = request.getParameter("address1");
	String address2 = request.getParameter("address2");
	String address3 = request.getParameter("address3");
	String birth = request.getParameter("birth");
	
	MemberDao dao = MemberDao.getInstance();
	Member vo = Member.builder()
				.id(id)
				.password(password)
				.name(name)
				.nickname(nickname)
				.email(email)
				.phone(phone)
				.c_code(c_code)
				.address1(address1)
				.address2(address2)
				.address3(address3)
				.birth(birth)
				.build();
	response.setCharacterEncoding("UTF-8");
	response.setContentType("text/html");
	
	long result = dao.register(vo);
	if(result != 1) {
		response.sendRedirect("login");
	}else {
		response.sendRedirect(request.getContextPath());
	}
	
}
}
