package org.shoppingMall.index.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.shoppingMall.controller.Controller;
import org.shoppingMall.dao.RecommendDao;
import org.shoppingMall.vo.RecommendVo;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class NewRecommendProductController implements Controller {
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//학원
		String path = "D:\\I_Class_1020\\workspace\\shoppingMall\\WebContent\\images\\Product";
		//집
//		String path = "D:\\LDH_JAVA\\workspace\\shoppingMall\\WebContent\\images\\Alcohol";
		
		int maxSize = 10*1024*1024;
		
		MultipartRequest multiRequest = new MultipartRequest(request, 
				path,
				maxSize,
				"UTF-8", 
				new DefaultFileRenamePolicy());
		
		String name = multiRequest.getParameter("productname");
		int price = Integer.parseInt(multiRequest.getParameter("productPrice"));
		
		String cover = multiRequest.getFilesystemName("filename");
		
		RecommendDao dao = RecommendDao.getInstance();
		String url = null;
		RecommendVo vo = new RecommendVo(name, price, cover);
		
		if(dao.insert(vo)==1) {
			url = "index";
		}else {
			url = "index";
		}
		
		
		response.sendRedirect(request.getContextPath());
	}
}
