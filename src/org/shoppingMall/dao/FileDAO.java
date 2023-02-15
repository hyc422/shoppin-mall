package org.shoppingMall.dao;

import java.util.Enumeration;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.shoppingMall.vo.FileVO;

import com.oreilly.servlet.MultipartRequest;

import mybatis.SqlSessionBean;

public class FileDAO {
	private static final FileDAO dao = new FileDAO();
	private FileDAO() {	}
	public static FileDAO getInstance() {
		return dao;
	}
	
	public void insertFile(MultipartRequest multi, int productNum) {
		SqlSession mapper = SqlSessionBean.getSession();
		
		FileVO vo = new FileVO();
		Enumeration<String> files = multi.getFileNames();
		
//				files의 마지막 값까지 반복
		while(files.hasMoreElements()) {
			
//			사용자가 업로드한 파일 태그의 name
			String name = files.nextElement();
			
//			사용자가 업로드한 원본 파일 이름
			String original = multi.getOriginalFileName(name);
			
//			중복 시 변경된 이름
			String systemName = multi.getFilesystemName(name);
		
			if(systemName == null) {continue;}
			
			vo.setFileName(systemName);
			vo.setProductNum(productNum);
			vo.setFileNameOriginal(original);
			
			mapper.insert("file.insertFile", vo);
			mapper.commit();
			mapper.close();
		}
	}
	
}
