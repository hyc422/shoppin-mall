package org.shoppingMall.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
public class CartVo {
	private int cartNum;
	private String id;
	private int productNum;
	private String productName;
	private int productPrice;
	private String productCategories;
	private String fileName;
	private int amount;
}
