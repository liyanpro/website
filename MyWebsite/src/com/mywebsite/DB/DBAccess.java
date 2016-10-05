package com.mywebsite.DB;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

/**
 * 访问数据库
 *
 */
public class DBAccess {

	public SqlSession getSqlSession() throws IOException {
		//通过配置文件获取数据库连接信息
		Reader reader=Resources.getResourceAsReader("com/mywebsite/config/Configuration.xml");
		//通过构建配置信息获取SqlSessionFactory
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		//通过SqlSessionFactory打开一个数据库会话
		SqlSession sqlSession=sqlSessionFactory.openSession();
		return sqlSession;
	}

}
