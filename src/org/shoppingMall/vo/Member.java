package org.shoppingMall.vo;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
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
	private String birth;
}
