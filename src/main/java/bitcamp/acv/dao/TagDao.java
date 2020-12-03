package bitcamp.acv.dao;

import java.util.List;
import java.util.Map;
import bitcamp.acv.domain.Tag;

public interface TagDao {
  List<Tag> findAll(String keyword) throws Exception;
  Tag findByNo(int no) throws Exception;
  int delete(int no) throws Exception;
  List<Tag> findByDetailKeyword(Map<String, Object> keywords) throws Exception;
  int active(int no) throws Exception;
}
