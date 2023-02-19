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
public class RecommendItemVo {
	private String name;
	private int price;
	private String coverfile;
}
