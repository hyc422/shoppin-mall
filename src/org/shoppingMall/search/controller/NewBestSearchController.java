package org.shoppingMall.search.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.shoppingMall.controller.Controller;
import org.shoppingMall.dao.BestItemDao;
import org.shoppingMall.vo.BestItemVo;

public class NewBestSearchController implements Controller {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		BestItemDao dao = BestItemDao.getInstance();
		BestItemVo vo = null;
		
		
		String [] price = request.getParameterValues("price");
		String [] fileName = request.getParameterValues("fileName");
		String [] productName = request.getParameterValues("productName");
		
		//price int형으로 변형하기
		int[] newArr = new int [productName.length];
		
		for (int i = 0; i<productName.length; i++) {
			newArr[i] = Integer.parseInt(price[i]);
		}
				
		
		for(int i = 0 ; i < productName.length; i++) {
			System.out.println(productName[i]);
			System.out.println(fileName[i]);
			System.out.println(price[i]);
			vo = new BestItemVo(productName[i], newArr[i], fileName[i]);
			dao.insertbest(vo);
			System.out.println("vo = " + vo);
		}
		
		
		
		response.sendRedirect("./");
	}

}
