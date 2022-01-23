package kr.campus.mapper;

import java.util.List;

import kr.campus.domain.BoardAdminVO;



public interface BoardAdminMapper {
	public void add(BoardAdminVO vo);
	

	public List<BoardAdminVO> select();

	public int update(BoardAdminVO vo);

	public int delete(Long code);
     
	public BoardAdminVO get(Long code);
}
