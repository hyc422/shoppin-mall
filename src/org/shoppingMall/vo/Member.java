package org.shoppingMall.vo;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@EqualsAndHashCode
public class Member {
	private long idx;
	private String id;
	private String password;
	private String name;
	private String nickname;
	private String email;
	private String address;
	private String phone;
	private String c_code;
	private String address1;
	private String address2;
	private String address3;
	private String birth;
	private String admin;
}
