package org.shoppingMall.controller;

import java.util.HashMap;
import java.util.Map;

import org.shoppingMall.product.controller.ProductAddController;
import org.shoppingMall.product.controller.ProductAddDeleteController;
import org.shoppingMall.product.controller.ProductAddViewController;
import org.shoppingMall.index.controller.DeleteRecommendProductController;
import org.shoppingMall.index.controller.IndexRecommendProductController;
import org.shoppingMall.index.controller.NewRecommendProductController;
import org.shoppingMall.login.controller.LoginActionController;
import org.shoppingMall.login.controller.LoginViewController;
import org.shoppingMall.login.controller.LogoutController;
import org.shoppingMall.product.controller.ProductListViewContoller;
import org.shoppingMall.register.controller.RegisterActionController;
import org.shoppingMall.register.controller.RegisterController;

public class RequestControllerMapping 
{
	private static final Map<RequestKeyValue,Controller> mapping = new HashMap<>();
	
	public static void init()
	{	
		// index
		 mapping.put(new RequestKeyValue("/RecommendUpdate","GET"), new IndexRecommendProductController());
		 mapping.put(new RequestKeyValue("/RecommendUpdate","POST"), new NewRecommendProductController());
		 mapping.put(new RequestKeyValue("/RecommendDelete","GET"), new DeleteRecommendProductController());

		// Register
		mapping.put(new RequestKeyValue("/member/register.hrd","GET"), new RegisterController());
		mapping.put(new RequestKeyValue("/member/register.hrd","POST"), new RegisterActionController());
		
		// Login
		mapping.put(new RequestKeyValue("/login.hrd","GET"), new LoginViewController());
		mapping.put(new RequestKeyValue("/login.hrd","POST"), new LoginActionController());
		mapping.put(new RequestKeyValue("/logout.hrd","GET"), new LogoutController());
		
		// Product
		mapping.put(new RequestKeyValue("/Product/productList.hrd","GET"), new ProductListViewContoller());
    mapping.put(new RequestKeyValue("/Product/productAdd", "GET"), new ProductAddViewController());
		mapping.put(new RequestKeyValue("/Product/productAdd", "POST"), new ProductAddController());
		mapping.put(new RequestKeyValue("/Product/productAddUpdate", "GET"), new ProductAddViewController());
		mapping.put(new RequestKeyValue("/Product/productAddUpdate", "POST"), new ProductAddController());
		mapping.put(new RequestKeyValue("/Product/productAddDelete", "GET"), new ProductAddDeleteController());
	}
	
	public static Controller getController(RequestKeyValue key)
	{return mapping.get(key);}
}	// Class end
