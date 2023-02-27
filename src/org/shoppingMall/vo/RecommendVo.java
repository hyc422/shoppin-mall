package org.shoppingMall.vo;
//추천상품

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
public class RecommendVo {
	private String FILENAME;
	private int PRODUCTPRICE;
	private String PRODUCTNAME;
	private int PRODUCTNUM;
}
