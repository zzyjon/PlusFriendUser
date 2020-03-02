package com.zlgoon.plusFriend;


import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@MapperScan(value="com.zlgoon.plusFriend.mapperSub", sqlSessionFactoryRef="db2SqlSessionFactory")
@EnableTransactionManagement
public class Db2DataSourceConfig {

	@Bean(name="db2DataSource")
	@ConfigurationProperties(prefix="spring.datasource.hikari.sub")
	public DataSource db2DataSource() {
		return DataSourceBuilder.create().build();
	}
	
	@Bean(name="db2SqlSessionFactory")
	public SqlSessionFactory db2SqlSessionFactory(@Qualifier("db2DataSource") DataSource db2DataSource, ApplicationContext applicationContext ) throws Exception {
		SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
		sqlSessionFactoryBean.setDataSource(db2DataSource);
		sqlSessionFactoryBean.setMapperLocations(applicationContext.getResources("classpath:mybatis/mapperSub/*.xml"));
		return sqlSessionFactoryBean.getObject();
	}
	
	@Bean(name="db2SqlSessionTemplate")
	public SqlSessionTemplate db2SqlSessionTemplate(SqlSessionFactory db2SqlSessionFactory) throws Exception {
		return new SqlSessionTemplate(db2SqlSessionFactory);
	}
}
