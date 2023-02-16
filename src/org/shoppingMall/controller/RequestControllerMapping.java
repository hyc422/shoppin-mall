package org.shoppingMall.controller;

import java.util.HashMap;
import java.util.Map;

import org.shoppingMall.product.controller.ProductAddController;
import org.shoppingMall.product.controller.ProductAddDeleteController;
import org.shoppingMall.product.controller.ProductAddViewController;

public class RequestControllerMapping 
{
	private static final Map<RequestKeyValue,Controller> mapping = new HashMap<>();
	
	public static void init()
	{	
		// controller
		// mapping.put(new RequestKeyValue(""."GET"), null);
		// mapping.put(new RequestKeyValue(""."POST"), null);
		mapping.put(new RequestKeyValue("/Product/productAdd", "GET"), new ProductAddViewController());
		mapping.put(new RequestKeyValue("/Product/productAdd", "POST"), new ProductAddController());
		
		mapping.put(new RequestKeyValue("/Product/productAddUpdate", "GET"), new ProductAddViewController());
		mapping.put(new RequestKeyValue("/Product/productAddUpdate", "POST"), new ProductAddController());
		
		mapping.put(new RequestKeyValue("/Product/productAddDelete", "GET"), new ProductAddDeleteController());
	}
	
	public static Controller getController(RequestKeyValue key)
	{return mapping.get(key);}
}	// Class end
