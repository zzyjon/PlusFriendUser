package com.zlgoon.plusFriend;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

/**
 * 프로젝트 설정을 모아둔 config 클래스
 * 
 * 
 * */

@Configuration
public class WebConfig {

	/*jsonView bean */
	@Bean
	MappingJackson2JsonView jsonView() {
		return new MappingJackson2JsonView();
	}
}
