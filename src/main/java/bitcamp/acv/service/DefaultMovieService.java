package bitcamp.acv.service;

import java.util.List;
import bitcamp.acv.dao.MovieDao;
import bitcamp.acv.domain.Movie;

public class DefaultMovieService implements MovieService {

  MovieDao movieDao;

  public DefaultMovieService(MovieDao movieDao) {
    this.movieDao = movieDao;
  }

  @Override
  public List<Movie> list() throws Exception {
    return movieDao.findAll();
  }

  @Override
  public List<Movie> list(String keyword) throws Exception {
    return movieDao.findAll(keyword);
  }

  @Override
  public Movie findByNo(int no) throws Exception {
    return movieDao.findByNo(no);
  }

  @Override
  public int getStillCutNo(String stillcut) throws Exception {
    return movieDao.getStillCutNo(stillcut);
  }
}
