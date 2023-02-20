package org.shoppingMall.controller;

import java.util.HashMap;
import java.util.Map;

import org.shoppingMall.login.controller.LoginActionController;
import org.shoppingMall.login.controller.LoginViewController;
import org.shoppingMall.login.controller.LogoutController;
import org.shoppingMall.mypage.controller.CustomerController;
import org.shoppingMall.mypage.controller.DeleteViewController;
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
		mapping.put(new RequestKeyValue("/login","GET"), new LoginViewController());
		mapping.put(new RequestKeyValue("/login","POST"), new LoginActionController());
		mapping.put(new RequestKeyValue("/logout","GET"), new LogoutController());
		
		// Product
		
		//mypage
		mapping.put(new RequestKeyValue("/update","GET"), new UpdateViewController());
	mapping.put(new RequestKeyValue("/update","POST"), new UpdateActionController());
	mapping.put(new RequestKeyValue("/deleteForm","GET"), new DeleteViewController());
	mapping.put(new RequestKeyValue("/deleteForm","POST"), new CustomerController());
	}
	
	public static Controller getController(RequestKeyValue key)
	{return mapping.get(key);}
}	// Class end
