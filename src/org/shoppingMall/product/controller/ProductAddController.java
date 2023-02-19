package org.shoppingMall.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.shoppingMall.controller.Controller;
import org.shoppingMall.dao.FileDAO;
import org.shoppingMall.dao.ProductDAO;
import org.shoppingMall.vo.ProductVO;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ProductAddController implements Controller {
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String saveFolder = "C:\\Users\\user\\Desktop\\project\\111\\shoppingMall\\WebContent\\upload";
		int fileSize = 1024 * 1024 * 10;
		
		MultipartRequest multi = null;
//		multi = new MultipartRequest(req, 경로, 파일의 크기, 인코딩방식, 정책(이름이 겹치지 않게 자동으로 변경해주는 객체설정))
		multi = new MultipartRequest(request, saveFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());
		
		ProductVO vo = new ProductVO();
		ProductDAO pDao = ProductDAO.getInstance();
		FileDAO fDao = FileDAO.getInstance();

		vo.setProductName(multi.getParameter("productName"));
		vo.setProductPrice(Integer.parseInt(multi.getParameter("productPrice")));
		vo.setProductStock(Integer.parseInt(multi.getParameter("productStock")));
		vo.setProductCategories(multi.getParameter("productCategories"));
		
		pDao.productInsert(vo);
		fDao.insertFile(multi, pDao.getSeq());
		
		response.sendRedirect("list1111111111111");	
	}
}
