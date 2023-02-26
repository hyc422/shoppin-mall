package org.shoppingMall.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@ToString
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class BestItemVo {
	private String productName;
	private int productPrice;
	private String fileName;
}
