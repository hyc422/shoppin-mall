package org.shoppingMall.controller;

import java.util.HashMap;
import java.util.Map;


import org.shoppingMall.product.controller.ProductActionController;
import org.shoppingMall.product.controller.ProductAddController;
import org.shoppingMall.product.controller.ProductAddDeleteController;
import org.shoppingMall.product.controller.ProductAddViewController;
import org.shoppingMall.Admincontroller.AdminController;
import org.shoppingMall.Recommend.controller.DeleteRecommendProductController;
import org.shoppingMall.Recommend.controller.IndexRecommendProductController;
import org.shoppingMall.Recommend.controller.NewRecommendProductController;
import org.shoppingMall.cart.controller.CartActoinController;
import org.shoppingMall.cart.controller.CartViewController;
import org.shoppingMall.cart.controller.CartDeleteAllController;
import org.shoppingMall.cart.controller.CartDeleteController;
import org.shoppingMall.cart.controller.CartSelectDeleteAllController;
import org.shoppingMall.community.controller.CommunityCheckActionController;
import org.shoppingMall.community.controller.CommunityCheckViewController;
import org.shoppingMall.community.controller.CommunityCommentsController;
import org.shoppingMall.community.controller.CommunityDeleteController;
import org.shoppingMall.community.controller.CommunityListController;
import org.shoppingMall.community.controller.CommunityReadController;
import org.shoppingMall.community.controller.CommunityUpdateActionController;
import org.shoppingMall.community.controller.CommunityUpdateViewController;
import org.shoppingMall.community.controller.CommunityWriteActionController;
import org.shoppingMall.community.controller.CommunityWriteViewController;
import org.shoppingMall.login.controller.LoginActionController;
import org.shoppingMall.login.controller.LoginViewController;
import org.shoppingMall.login.controller.LogoutController;
import org.shoppingMall.mypage.controller.CustomerController;
import org.shoppingMall.mypage.controller.DeleteViewController;
import org.shoppingMall.mypage.controller.PaylistActionController;
import org.shoppingMall.mypage.controller.PaylistViewController;
import org.shoppingMall.mypage.controller.ReivewViewController;
import org.shoppingMall.mypage.controller.UpdateActionController;
import org.shoppingMall.mypage.controller.UpdateViewController;
import org.shoppingMall.mypage.controller.qnalistViewController;
import org.shoppingMall.member.controller.Find_idController;
import org.shoppingMall.member.controller.IDViewController;
import org.shoppingMall.product.controller.ProductAddPaymentController;
import org.shoppingMall.product.controller.ProductAddPaymentViewController;
import org.shoppingMall.product.controller.ProductAddUpdateController;
import org.shoppingMall.product.controller.ProductAddUpdateViewController;
import org.shoppingMall.product.controller.ProductListViewContoller;
import org.shoppingMall.product.controller.ProductViewContoller;
import org.shoppingMall.register.controller.RegisterActionController;
import org.shoppingMall.register.controller.RegisterController;
import org.shoppingMall.search.controller.HighPriceSearchController;
import org.shoppingMall.search.controller.LowPriceSearchController;
import org.shoppingMall.search.controller.SearchController;

public class RequestControllerMapping 
{
	private static final Map<RequestKeyValue,Controller> mapping = new HashMap<>();
	
	public static void init()
	{	
		 // admin
		mapping.put(new RequestKeyValue("/admin","GET"), new AdminController());
		
		 // index
		 mapping.put(new RequestKeyValue("/RecommendUpdate","GET"), new IndexRecommendProductController());
		 mapping.put(new RequestKeyValue("/RecommendUpdate","POST"), new NewRecommendProductController());
		 mapping.put(new RequestKeyValue("/RecommendDelete","GET"), new DeleteRecommendProductController());
		 
		 // search
		 mapping.put(new RequestKeyValue("/search","GET"), new SearchController());
		 mapping.put(new RequestKeyValue("/high","GET"), new HighPriceSearchController());
		 mapping.put(new RequestKeyValue("/low","GET"), new LowPriceSearchController());

		// Register
		mapping.put(new RequestKeyValue("/member/register","GET"), new RegisterController());
		mapping.put(new RequestKeyValue("/member/register","POST"), new RegisterActionController());

		// Login
		mapping.put(new RequestKeyValue("/login","GET"), new LoginViewController());
		mapping.put(new RequestKeyValue("/login","POST"), new LoginActionController());
		mapping.put(new RequestKeyValue("/logout","GET"), new LogoutController());
		mapping.put(new RequestKeyValue("/member/findmem","GET"), new IDViewController());
		mapping.put(new RequestKeyValue("/member/findmem","POST"), new Find_idController());
		mapping.put(new RequestKeyValue("/update","GET"), new UpdateViewController());
		mapping.put(new RequestKeyValue("/update","POST"), new UpdateActionController());
		mapping.put(new RequestKeyValue("/deleteForm","GET"), new DeleteViewController());
		mapping.put(new RequestKeyValue("/deleteForm","POST"), new CustomerController());
    	
		//mypage
		mapping.put(new RequestKeyValue("/update","GET"), new UpdateViewController());
		mapping.put(new RequestKeyValue("/update","POST"), new UpdateActionController());
		mapping.put(new RequestKeyValue("/deleteForm","GET"), new DeleteViewController());
		mapping.put(new RequestKeyValue("/deleteForm","POST"), new CustomerController());
		mapping.put(new RequestKeyValue("/paylist","GET"), new PaylistViewController());
//		mapping.put(new RequestKeyValue("/paylist","POST"), new PaylistActionController());
		mapping.put(new RequestKeyValue("/review","GET"), new ReivewViewController());
		mapping.put(new RequestKeyValue("/qnalist","GET"), new qnalistViewController());
    
	  	// Product
		mapping.put(new RequestKeyValue("/Product/product","GET"), new ProductViewContoller());
		mapping.put(new RequestKeyValue("/Product/product", "POST"), new ProductActionController());
		mapping.put(new RequestKeyValue("/Product/productList","GET"), new ProductListViewContoller());
		mapping.put(new RequestKeyValue("/Product/productAdd", "GET"), new ProductAddViewController());
		mapping.put(new RequestKeyValue("/Product/productAdd", "POST"), new ProductAddController());
		mapping.put(new RequestKeyValue("/Product/productAddUpdate", "GET"), new ProductAddUpdateViewController());
		mapping.put(new RequestKeyValue("/Product/productAddUpdate", "POST"), new ProductAddUpdateController());
		mapping.put(new RequestKeyValue("/Product/productAddDelete", "GET"), new ProductAddDeleteController());
		mapping.put(new RequestKeyValue("/Product/productAddPayment", "GET"), new ProductAddPaymentViewController());
		mapping.put(new RequestKeyValue("/Product/productAddPayment", "POST"), new ProductAddPaymentController());

		//cart
		mapping.put(new RequestKeyValue("/cart", "GET"), new CartViewController());
		mapping.put(new RequestKeyValue("/cart", "POST"), new CartActoinController());
		mapping.put(new RequestKeyValue("/cart/delete", "POST"), new CartDeleteController());
		mapping.put(new RequestKeyValue("/cart/deleteAll", "POST"), new CartDeleteAllController());
		mapping.put(new RequestKeyValue("/cart/selectDelete", "POST"), new CartSelectDeleteAllController());
		
		//community
		mapping.put(new RequestKeyValue("/community/communitylist", "GET"), new CommunityListController());
		mapping.put(new RequestKeyValue("/community/communityread", "GET"), new CommunityReadController());
		mapping.put(new RequestKeyValue("/community/communitycomments", "POST"), new CommunityCommentsController());
		mapping.put(new RequestKeyValue("/community/communitywrite", "GET"), new CommunityWriteViewController());
		mapping.put(new RequestKeyValue("/community/communitywrite", "POST"), new CommunityWriteActionController());
		mapping.put(new RequestKeyValue("/community/communityupdate", "GET"), new CommunityUpdateViewController());
		mapping.put(new RequestKeyValue("/community/communityupdate", "POST"), new CommunityUpdateActionController());
		mapping.put(new RequestKeyValue("/community/communitydelete", "POST"), new CommunityDeleteController());
		mapping.put(new RequestKeyValue("/community/communitycheck", "GET"), new CommunityCheckViewController());
		mapping.put(new RequestKeyValue("/community/communitycheck", "POST"), new CommunityCheckActionController());
	}	// method end
	
	public static Controller getController(RequestKeyValue key)
	{return mapping.get(key);}
}	// Class end
