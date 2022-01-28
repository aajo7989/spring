package net.koreate.mvc.board.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import net.koreate.mvc.board.vo.BoardVO;
import net.koreate.mvc.common.util.Criteria;

public class BoardDAOImpl implements BoardDAO {
	@Inject
	SqlSession session;

	@Override
	public int create(BoardVO vo) throws Exception {
		int result = session.insert("net.koreate.mvc.board.dao.BoardDAO.create", vo);
		return result;
	}

	@Override
	public BoardVO read(int bno) throws Exception {

		return null;
	}

	@Override
	public int update(BoardVO vo) throws Exception {

		return 0;
	}

	@Override
	public int delete(int bno) throws Exception {

		return 0;
	}

	@Override
	public void updateCnt(int bno) throws Exception {
	}

	@Override
	public int listCount() throws Exception {

		return 0;
	}

	@Override
	public List<BoardVO> list(Criteria cri) throws Exception {

		return null;
	}

}
