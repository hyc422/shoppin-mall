package org.shoppingMall.index.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.shoppingMall.controller.Controller;
import org.shoppingMall.dao.ProductDAO;
import org.shoppingMall.vo.RecommendVo;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class NewRecommendProductController implements Controller {
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		ProductDAO dao = ProductDAO.getInstance();
		List<RecommendVo> list = dao.selectrecommend();
		int size = list.size();

		// 학원
//		String path = "D:\\I_Class_1020\\workspace\\shoppingMall\\WebContent\\images\\Product";
		// 집
		String path = "D:\\LDH_JAVA\\workspace\\shoppingMall\\WebContent\\images\\Product";

		int maxSize = 10 * 1024 * 1024;

		MultipartRequest multiRequest = new MultipartRequest(request, path, maxSize, "UTF-8",
				new DefaultFileRenamePolicy());

		String name = multiRequest.getParameter("productname");
		int price = Integer.parseInt(multiRequest.getParameter("productprice"));

		String cover = multiRequest.getFilesystemName("filename");

		RecommendVo vo = null;

		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		String url = null;
		
		out.print("<script>");
		if (size < 8) {
			vo = new RecommendVo(cover, price, name);
			out.print("alert('추천상품으로 등록되었습니다.');");
			if (dao.insert(vo) == 1) {url = "location.href='RecommendUpdate'";}
			
		} else if (size >= 8) {
			out.print("alert('추천상품은 최대 8개까지 가능합니다.');");
			url = "location.href='./'";
		}
		out.print(url);
		out.print("</script>");

	}
}
