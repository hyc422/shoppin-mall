package org.shoppingMall.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.shoppingMall.controller.Controller;
import org.shoppingMall.dao.FileDAO;
import org.shoppingMall.dao.ProductDAO;
import org.shoppingMall.vo.FileVO;
import org.shoppingMall.vo.ProductVO;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ProductAddController implements Controller {
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*String saveFolder = "C:\\Users\\user\\Desktop\\project\\111\\shoppingMall\\WebContent\\upload";
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
		
		response.sendRedirect("productList");*/	

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		ProductVO pVo = new ProductVO();
		FileVO fVo = new FileVO();
		ProductDAO pDao = ProductDAO.getInstance();
		FileDAO fDao = FileDAO.getInstance();
		
		System.out.println(request.getParameter("product_file1"));
		System.out.println(request.getParameter("productImage"));
		
		pVo.setProductName(request.getParameter("productName"));
		pVo.setProductPrice(Integer.parseInt(request.getParameter("productPrice")));
		pVo.setProductStock(Integer.parseInt(request.getParameter("productStock")));
		pVo.setProductCategories(request.getParameter("productCategories"));
		
		fVo.setFileName(request.getParameter("product_file1"));
		fVo.setFileNameOriginal(request.getParameter("productImage"));
		fVo.setProductNum(Integer.parseInt(request.getParameter("productNum")));
		
		pDao.productInsert(pVo);
		fDao.insertFile(fVo);
		
		response.sendRedirect(request.getContextPath()+"/Product/product?productNum="+Integer.parseInt(request.getParameter("productNum")));
		
	}
	
}
