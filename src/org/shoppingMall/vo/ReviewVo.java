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
public class ReviewVo 
{
	private long idx;
	private int productNum;
	private String productName;
	private String fileName;
	private String nickname;
	private String title;
	private String content;
	private int readCount;
	private int point;
	private Timestamp createdAt;
	private String ip;
	private String commentCount;
}	// Class