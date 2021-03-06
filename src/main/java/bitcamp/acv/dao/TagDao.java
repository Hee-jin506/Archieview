package bitcamp.acv.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import bitcamp.acv.domain.Review;
import bitcamp.acv.domain.Tag;

public interface TagDao {
  List<Tag> findAll(String keyword) throws Exception;

  Tag findByNo(int no) throws Exception;
  int delete(int no) throws Exception;
  int active(int no) throws Exception;
  int insert(Tag tag) throws Exception;
  int insertByReview(Review review) throws Exception;
  Tag findByTitle(String title) throws Exception;

  List<Tag> findByKeyword(HashMap<String, Object> keyMap) throws Exception;

  List<Tag> findByDetailKeyword(Map<String, Object> keywords) throws Exception;
  List<Tag> findByReviewNo(int reviewNo) throws Exception;
  List<Tag> findByPop() throws Exception;
  List<Tag> findByKeywordTitle(String keyword) throws Exception;
  
  List<Tag> findForThumbnailStillCut() throws Exception;
}
