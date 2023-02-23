package org.shoppingMall.controller;

import java.util.HashMap;
import java.util.Map;

import org.shoppingMall.login.controller.LoginActionController;
import org.shoppingMall.login.controller.LoginViewController;
import org.shoppingMall.login.controller.LogoutController;
import org.shoppingMall.mypage.controller.CustomerController;
import org.shoppingMall.mypage.controller.DeleteViewController;
import org.shoppingMall.mypage.controller.PaylistActionController;
import org.shoppingMall.mypage.controller.PaylistViewController;
import org.shoppingMall.mypage.controller.UpdateActionController;
import org.shoppingMall.mypage.controller.UpdateViewController;
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
		
		//mypage
		mapping.put(new RequestKeyValue("/update","GET"), new UpdateViewController());
	mapping.put(new RequestKeyValue("/update","POST"), new UpdateActionController());
	mapping.put(new RequestKeyValue("/deleteForm","GET"), new DeleteViewController());
	mapping.put(new RequestKeyValue("/deleteForm","POST"), new CustomerController());
	mapping.put(new RequestKeyValue("/paylist","GET"), new PaylistViewController());
	mapping.put(new RequestKeyValue("/paylist","POST"), new PaylistActionController());
	}
	
	public static Controller getController(RequestKeyValue key)
	{return mapping.get(key);}
}	// Class end
