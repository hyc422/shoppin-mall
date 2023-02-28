package org.shoppingMall.Admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.shoppingMall.controller.Controller;
import org.shoppingMall.dao.Best5Dao;
import org.shoppingMall.vo.Best5Vo;

public class AdminScoreController implements Controller {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Best5Dao dao = Best5Dao.getInstance();
		List<Best5Vo> list = dao.Best5();
		
		request.setAttribute("list", list);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("score.jsp");
		dispatcher.forward(request, response);
	}

}
