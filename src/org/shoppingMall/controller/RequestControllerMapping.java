package org.shoppingMall.controller;

import java.util.HashMap;
import java.util.Map;

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
		// Register
		mapping.put(new RequestKeyValue("/member/register.hrd","GET"), new RegisterController());
		mapping.put(new RequestKeyValue("/member/register.hrd","POST"), new RegisterActionController());
		
		// Login
		mapping.put(new RequestKeyValue("/login.hrd","GET"), new LoginViewController());
		mapping.put(new RequestKeyValue("/login.hrd","POST"), new LoginActionController());
		mapping.put(new RequestKeyValue("/logout.hrd","GET"), new LogoutController());
		
		// Product
//		mapping.put(new RequestKeyValue("/Product/product.hrd","GET"), new ProductActionContoller());
//		mapping.put(new RequestKeyValue("/Product/product.hrd","POST"), new ProductViewContoller());
		mapping.put(new RequestKeyValue("/Product/productList.hrd","GET"), new ProductListViewContoller());
		
	}
	
	public static Controller getController(RequestKeyValue key)
	{return mapping.get(key);}
}	// Class end
