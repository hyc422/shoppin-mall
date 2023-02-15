package org.shoppingMall.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ProductFileList {
	private int productNum;
	private String productName;
	private int productPrice;
	private int productStock;
	private String productCategories;
	private String fileName;
	private String fileNameOriginal;
}
