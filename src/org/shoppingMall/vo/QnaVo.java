package org.shoppingMall.vo;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class QnaVo 
{
	private long idx;
	private String productNum;
	private String productName;
	private String fileName;
	private String nickname;
	private String title;
	private String password;
	private String content;
	private String readCount;
	private Timestamp createdAt;
	private String ip;
	private String commentCount;
}	// Class
