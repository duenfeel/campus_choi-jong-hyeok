package kr.campus.mapper;

import java.util.List;

import kr.campus.domain.Criteria;
import kr.campus.domain.ItemVO;

public interface AdminMapper {

   // 게시물 목록 가져오기
   public List<ItemVO> getList();
   
   public List<ItemVO> adminshoplist(Criteria cri);

   public int getTotal(Criteria cri); //상품 총 개수 파악
   
   /* 상품 등록 */
   public void itemsEnroll(ItemVO items);

//   // 생성되는 시퀀스 값을 확인하고 나머지 값 입력.
//   // 새로운 게시물 1개 추가의 다른 방식.
//   public void insertSelectKey(ItemVO board);
//
//   // 게시물 내용 읽기
//   public ItemVO read(Long bno);
//
//   // 게시물 삭제
//   public int delete(Long bno);
//
//   // 게시물 수정
//   public int update(ItemVO board);

}