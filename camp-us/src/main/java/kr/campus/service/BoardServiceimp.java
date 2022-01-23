package kr.campus.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.campus.domain.BoardVO;
import kr.campus.domain.Criteria;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class BoardServiceimp implements BoardService {

	@Override
	public int clientupdate(BoardVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void insertSelectKey(BoardVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public int delete(Long num) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void add(BoardVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<BoardVO> select(Criteria cri) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BoardVO get(Long code) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int update(BoardVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<BoardVO> myselect(Criteria cri) {
		// TODO Auto-generated method stub
		return null;
	}

}
