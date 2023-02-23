package org.shoppingMall.controller;

import java.util.HashMap;
import java.util.Map;

import org.shoppingMall.product.controller.ProductActionController;
import org.shoppingMall.product.controller.ProductAddController;
import org.shoppingMall.product.controller.ProductAddDeleteController;
import org.shoppingMall.product.controller.ProductAddViewController;
import org.shoppingMall.cart.controller.CartViewController;
import org.shoppingMall.index.controller.DeleteRecommendProductController;
import org.shoppingMall.index.controller.IndexRecommendProductController;
import org.shoppingMall.index.controller.NewRecommendProductController;
import org.shoppingMall.login.controller.LoginActionController;
import org.shoppingMall.login.controller.LoginViewController;
import org.shoppingMall.login.controller.LogoutController;
import org.shoppingMall.member.controller.Find_idController;
import org.shoppingMall.member.controller.IDViewController;
import org.shoppingMall.product.controller.ProductListViewContoller;
import org.shoppingMall.product.controller.ProductViewContoller;
import org.shoppingMall.register.controller.RegisterActionController;
import org.shoppingMall.register.controller.RegisterController;
import org.shoppingMall.search.controller.SearchController;

public class RequestControllerMapping 
{
	private static final Map<RequestKeyValue,Controller> mapping = new HashMap<>();
	
	public static void init()
	{	
		 // index
		 mapping.put(new RequestKeyValue("/RecommendUpdate","GET"), new IndexRecommendProductController());
		 mapping.put(new RequestKeyValue("/RecommendUpdate","POST"), new NewRecommendProductController());
		 mapping.put(new RequestKeyValue("/RecommendDelete","GET"), new DeleteRecommendProductController());
		 
		 // search
		 mapping.put(new RequestKeyValue("/search","GET"), new SearchController());

		// Register
		mapping.put(new RequestKeyValue("/member/register","GET"), new RegisterController());
		mapping.put(new RequestKeyValue("/member/register","POST"), new RegisterActionController());
		
		// Login
		mapping.put(new RequestKeyValue("/login","GET"), new LoginViewController());
		mapping.put(new RequestKeyValue("/login","POST"), new LoginActionController());
		mapping.put(new RequestKeyValue("/logout","GET"), new LogoutController());
		
		mapping.put(new RequestKeyValue("/member/findmem","GET"), new IDViewController());
		mapping.put(new RequestKeyValue("/member/findmem","POST"), new Find_idController());

		// Product
		mapping.put(new RequestKeyValue("/Product/product","GET"), new ProductViewContoller());
		mapping.put(new RequestKeyValue("/Product/product", "POST"), new ProductActionController());
		mapping.put(new RequestKeyValue("/Product/productList","GET"), new ProductListViewContoller());
		mapping.put(new RequestKeyValue("/Product/productAdd", "GET"), new ProductAddViewController());
		mapping.put(new RequestKeyValue("/Product/productAdd", "POST"), new ProductAddController());
		mapping.put(new RequestKeyValue("/Product/productAddUpdate", "GET"), new ProductAddViewController());
		mapping.put(new RequestKeyValue("/Product/productAddUpdate", "POST"), new ProductAddController());
		mapping.put(new RequestKeyValue("/Product/productAddDelete", "GET"), new ProductAddDeleteController());
		//cart
		mapping.put(new RequestKeyValue("/cart", "GET"), new CartViewController());
	}
	
	public static Controller getController(RequestKeyValue key)
	{return mapping.get(key);}
}	// Class end
