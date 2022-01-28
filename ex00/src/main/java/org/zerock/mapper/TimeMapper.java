package org.zerock.mapper;

import org.apache.ibatis.annotations.Select;

public interface TimeMapper {

	@Select("SELECT * FROM oracle_test")
	public String getTime();

	public String getTime2();
}
