package kr.campus.service;

import java.util.List;

import kr.campus.domain.BoardVO;
import kr.campus.domain.Criteria;

public interface BoardService {
	public int clientupdate(BoardVO vo);

	public void insertSelectKey(BoardVO vo);

	public int delete(Long num);

	public void add(BoardVO vo);

	public List<BoardVO> select(Criteria cri);

	public BoardVO get(Long code);

	public int update(BoardVO vo);
	public List<BoardVO> myselect(Criteria cri);
}
