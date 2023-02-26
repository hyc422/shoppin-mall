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
public class QnaCommentsVo 
{
	private long idx;
	private long mref;
	private String nickname;
	private String content;
	private Timestamp createdAt;
	private String ip;
}	// Class end
