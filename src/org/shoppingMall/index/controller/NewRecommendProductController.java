package org.shoppingMall.index.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.shoppingMall.controller.Controller;
import org.shoppingMall.dao.RecommendItemDao;
import org.shoppingMall.vo.RecommendItemVo;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class NewRecommendProductController implements Controller {
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//학원
//		String path = "D:\\I_Class_1020\\Project\\shoppingMall\\WebContent\\image";
		//집
		String path = "C:\\Users\\82102\\Desktop\\shoppingMall\\WebContent\\image";
		
		int maxSize = 10*1024*1024;
		
		MultipartRequest multiRequest = new MultipartRequest(request, 
				path,
				maxSize,
				"UTF-8", 
				new DefaultFileRenamePolicy());
		
		String name = multiRequest.getParameter("name");
		int price = Integer.parseInt(multiRequest.getParameter("price"));
		
		String cover = multiRequest.getFilesystemName("coverfile");
		
		RecommendItemDao dao = RecommendItemDao.getInstance();
		String url = null;
		RecommendItemVo vo = new RecommendItemVo(name, price, cover);
		
		if(dao.insert(vo)==1) {
			url = "index";
		}else {
			url = "index";
		}
		
		
		response.sendRedirect(request.getContextPath());
	}
}
