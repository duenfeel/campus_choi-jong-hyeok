package kr.campus.service;

import java.util.List;

import kr.campus.domain.Criteria;
import kr.campus.domain.ItemVO;

public interface AdminService {

   /* 상품 등록 */
   public void itemsEnroll(ItemVO items);

   public List<ItemVO> adminshoplist(Criteria cri); // 상품 목록(관리자)

   public int getTotal(Criteria cri);
   
   /* 
    * public void productUpdate(ProductVO vo); // 상품 수정(관리자)
    * 
    * public void productDelete(ProductVO vo); // 상품 삭제(관리자)
    */
}