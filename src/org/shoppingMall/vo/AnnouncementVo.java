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
public class AnnouncementVo 
{
	private long idx;
	private String nickname;
	private String title;
	private String content;
	private int readCount;
	private Timestamp createdAt;
	private String ip;
}	// Class end
