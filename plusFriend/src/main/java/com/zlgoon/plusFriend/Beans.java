package com.zlgoon.plusFriend;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Component;

@Component
public class Beans {
	
	@Autowired
	private Environment environment;
	
	public String[] getActiveProfiles() {
		return environment.getActiveProfiles();
	}
}
