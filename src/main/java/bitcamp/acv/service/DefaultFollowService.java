package bitcamp.acv.service;

import java.util.List;
import org.springframework.stereotype.Service;
import bitcamp.acv.dao.FollowDao;
import bitcamp.acv.dao.MemberDao;
import bitcamp.acv.dao.TagDao;
import bitcamp.acv.domain.Follow;
@Service
public class DefaultFollowService implements FollowService {

  FollowDao followDao;
  MemberDao memberDao;
  TagDao tagDao;

  public DefaultFollowService(FollowDao followDao,
      MemberDao memberDao,
      TagDao tagDao) {
    this.followDao = followDao;
    this.memberDao = memberDao;
    this.tagDao = tagDao;
  }

  @Override
  public int deleteUser(Follow follow) throws Exception {
    return followDao.deleteUser(follow);
  }

  @Override
  public int addUser(Follow follow) throws Exception {
   if (follow.getFollowedType() == Follow.MEMBER) {
     followDao.insertUser(follow);
   }
   return -1;
  }

  @Override
  public int addTag(Follow follow) throws Exception {
    if (follow.getFollowedType() == Follow.TAG) {
      return followDao.insertTag(follow);
    }
    return -1;
  }

  @Override
  public List<Follow> getByMemberNo() throws Exception {
    return followDao.findByMemberNo();
  }

  @Override
  public List<Follow> list() throws Exception {
    return followDao.findAll();
  }

  @Override
  public Follow get(int no) throws Exception {
    return followDao.findByNo(no);
  }


  // target을 찾는다.
  @Override
  public Object getTarget(Follow follow) throws Exception {
    if (follow.getFollowedType() == Follow.MEMBER) {
      return memberDao.findByNo(follow.getFollowedNo());
    } else if (follow.getFollowedType() == Follow.TAG) {
      return tagDao.findByNo(follow.getFollowedNo());
    }
    return null;
  }
}
