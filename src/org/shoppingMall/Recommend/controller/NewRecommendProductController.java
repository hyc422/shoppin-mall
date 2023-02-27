package org.shoppingMall.Recommend.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.shoppingMall.controller.Controller;
import org.shoppingMall.dao.ProductDAO;
import org.shoppingMall.dao.RecommendDao;
import org.shoppingMall.vo.ProductFileList;
import org.shoppingMall.vo.RecommendVo;


public class NewRecommendProductController implements Controller {
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		RecommendDao dao = RecommendDao.getInstance();
		ProductDAO dao2 = ProductDAO.getInstance();
		List<ProductFileList> list =  dao.selectAll();
		List<RecommendVo>list2 = dao2.selectrecommend();
		
		String productname = request.getParameter("productname");
		RecommendVo vo = null;
		
		for(int i = 0; i<list.size();i++) {
			if(list.get(i).getProductName().equals(productname)) {
				vo = new RecommendVo(list.get(i).getFileName(),
									list.get(i).getProductPrice(),
									list.get(i).getProductName(),
									list.get(i).getProductNum());
			}
		}
		
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		String url = null;
		String product = null;
		
		out.print("<script>");
		for(int i = 0 ; i<list2.size();i++) {
			if(list2.get(i).getPRODUCTNAME().equals(productname)) {
				product = list2.get(i).getPRODUCTNAME();
				out.print("alert('상품이 이미 추천상품으로 등록되어있습니다.');");
				url = "location.href='RecommendUpdate'";
			}
		}
		
		
		if (list2.size() < 8 && !(product.equals(productname))) {
			out.print("alert('추천상품으로 등록되었습니다.');");
			if (dao.insert(vo) == 1) {url = "location.href='RecommendUpdate'";}
			
		} else if (list2.size() >= 8 && product != productname) {
			out.print("alert('추천상품은 최대 8개까지 가능합니다.');");
			url = "location.href='./'";
		}
		out.print(url);
		out.print("</script>");

	}
}
