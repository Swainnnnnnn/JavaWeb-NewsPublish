package com.rainsia.news.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

public interface RSProcessor {
	Object process(ResultSet rs) throws SQLException;
}
