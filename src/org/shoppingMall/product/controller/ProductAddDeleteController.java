package org.shoppingMall.product.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.shoppingMall.controller.Controller;
import org.shoppingMall.dao.FileDAO;
import org.shoppingMall.dao.ProductDAO;
import org.shoppingMall.vo.FileVO;
import org.shoppingMall.vo.ProductVO;

public class ProductAddDeleteController implements Controller {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		String saveFolder = "D:\\iclass_1020\\upload";
		
		FileDAO fDao = FileDAO.getInstance();
		ProductDAO pDao = ProductDAO.getInstance();
		int productNum = Integer.parseInt(request.getParameter("productNum"));
		String productCategories = request.getParameter("productCategories");
		for(FileVO file : fDao.getFiles(productNum)) {
			File f = new File(saveFolder, file.getFileName());
			if(f.exists()) {
				f.delete();
			}
		}
		
		fDao.deleteFiles(productNum);
		pDao.productAddDelete(productNum);

//		RequestDispatcher dispatcher = request.getRequestDispatcher("productList.jsp");
//	      dispatcher.forward(request, response);
		response.sendRedirect(request.getContextPath()+"/Product/productList?Categories="+productCategories);

	}
}
