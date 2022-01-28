package net.koreate.mvc.board.dao;

import java.util.List;

import net.koreate.mvc.board.vo.BoardVO;
import net.koreate.mvc.common.util.Criteria;

public interface BoardDAO {
	// �Խñ� �ۼ�
	int create(BoardVO vo)throws Exception;
	
	// �Խñ� �󼼺���
	BoardVO read(int bno) throws Exception;
	
	// �Խñ� ����
	int update(BoardVO vo) throws Exception;
	
	// �Խñ� ����
	int delete(int bno) throws Exception;
	
	// ��ȸ�� ����
	void updateCnt(int bno) throws Exception;
	
	// ��ü �Խù��� ����
	int listCount()throws Exception;
	
	// ����¡ ó���� �Խù� ����Ʈ
	List<BoardVO> list(Criteria cri) throws Exception;
	
}

