package com.csxy.gggl.service;

import static org.junit.Assert.*;

import java.sql.Connection;

import org.junit.Before;
import org.junit.Test;

import com.csxy.gggl.db.JDBCUtils;
import com.csxy.gggl.web.ConnectionContext;
import com.csxy.gggl.web.normal_Notive;

public class Notive_serviceTest {
	Notive_service notive=new Notive_service();
	normal_Notive normal_Notive;

	@Before
	public void setUp() throws Exception {
		Connection connection=JDBCUtils.getConnection();
		ConnectionContext.getinstance().bind(connection);
		normal_Notive=new normal_Notive();
		normal_Notive.setN_id(n_id);
	}

	@Test
	public void testRelease() {
		notive.release(normal_Notive);
		fail("Not yet implemented");
	}

	@Test
	public void testCreate_normalNotive() {
		fail("Not yet implemented");
	}

	@Test
	public void testCreatePageInt() {
		fail("Not yet implemented");
	}

	@Test
	public void testCreatePageConditionInt() {
		fail("Not yet implemented");
	}

	@Test
	public void testDelect_Notive() {
		fail("Not yet implemented");
	}

	@Test
	public void testUpdate() {
		fail("Not yet implemented");
	}

}
