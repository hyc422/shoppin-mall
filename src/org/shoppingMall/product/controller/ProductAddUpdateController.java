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

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

// 요청 매핑 :	mapping.put(new RequestKeyValue("/community/update","POST"), new UpdateController() );  
public class ProductAddUpdateController implements Controller {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//수정 내용 저장  구현해 보세요.
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		/*String saveFolder = "C:\\Users\\user\\Desktop\\project\\111\\shoppingMall\\WebContent\\upload";
		int fileSize = 1024 * 1024 * 10;
		ProductVO vo = new ProductVO();
		ProductDAO pDao = ProductDAO.getInstance();
		FileDAO fDao = FileDAO.getInstance();
		
		MultipartRequest multi = null;
		multi = new MultipartRequest(request, saveFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());
		
		int productNum = Integer.parseInt(multi.getParameter("productNum"));
		
		for(FileVO file : fDao.getFiles(productNum)) {
			File f = new File(saveFolder, file.getFileName());
			if(f.exists()) {
				f.delete();
			}
		}
		
		//DB에서 삭제  후 새로 넣어주기
		fDao.deleteFiles(productNum);
		fDao.insertFile(multi, productNum);
		
		vo.setProductNum(productNum);
		vo.setProductName(multi.getParameter("productName"));
		vo.setProductPrice(Integer.parseInt(multi.getParameter("productPrice")));
		vo.setProductStock(Integer.parseInt(multi.getParameter("productStock")));
		vo.setProductCategories(multi.getParameter("productCategories"));
		
		pDao.productAddUpdate(vo);*/
		
		ProductVO pVo = new ProductVO();
		FileVO fVo = new FileVO();
		ProductDAO pDao = ProductDAO.getInstance();
		FileDAO fDao = FileDAO.getInstance();
		
		int productNum = Integer.parseInt(request.getParameter("productNum"));
		
		pVo.setProductNum(productNum);
		pVo.setProductName(request.getParameter("productName"));
		pVo.setProductPrice(Integer.parseInt(request.getParameter("productPrice")));
		pVo.setProductStock(Integer.parseInt(request.getParameter("productStock")));
		pVo.setProductCategories(request.getParameter("productCategories"));
		
		fVo.setProductNum(productNum);
		fVo.setFileName(request.getParameter("product_file1"));
		fVo.setFileNameOriginal(request.getParameter("productImage"));
		
		pDao.productAddUpdate(pVo);
		fDao.updateFiles(fVo);
		
		response.sendRedirect(request.getContextPath()+"/Product/product?productNum="+Integer.parseInt(request.getParameter("productNum")));
		
	}

}
