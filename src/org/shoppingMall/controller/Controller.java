package org.shoppingMall.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Controller 
{	// servlet(front controller)으로부터 처리해야할 request, response를 인자로 받음
	void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
}	// Interface end
