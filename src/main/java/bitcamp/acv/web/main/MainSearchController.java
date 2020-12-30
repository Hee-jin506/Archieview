package bitcamp.acv.web.main;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import bitcamp.acv.domain.Member;
import bitcamp.acv.domain.Movie;
import bitcamp.acv.domain.Tag;
import bitcamp.acv.service.MemberService;
import bitcamp.acv.service.MovieService;
import bitcamp.acv.service.ReviewService;
import bitcamp.acv.service.TagService;

@Controller
@RequestMapping("/main")
@SessionAttributes("loginUser")
public class MainSearchController {

  @Autowired ReviewService reviewService;
  @Autowired MemberService memberService;
  @Autowired MovieService movieService;
  @Autowired TagService tagService;


  @GetMapping("search")
  public ModelAndView search(
      String keyword,
      HttpSession session,
      Model model)
          throws Exception {
    ModelAndView mv = new ModelAndView();

    // 탑바
    Member loginUser = (Member) session.getAttribute("loginUser");
    model.addAttribute("loginUser", loginUser);

    // 사이드바
    model.addAttribute("topMembers", memberService.listByPop3());
    model.addAttribute("topMovies", movieService.listByPop3());
    model.addAttribute("topTags", tagService.listByPop3());

    // 메인피드

    if (keyword == "") {
      mv.setViewName("redirect:../../app/main");
      return mv;
    }

    if (keyword.length() != 0) {

      if(keyword.toCharArray()[0] != '#') {

        List<Movie> movies = movieService.listByKeywordTitle(keyword);
        List<Member> members = memberService.listByKeywordNickName(keyword);

        mv.addObject("movies", movies);
        mv.addObject("members", members);

      } else {

        List<Tag> tags = tagService.listByKeywordTitle(keyword.substring(1));

        mv.addObject("tags", tags);

      }
    }

    mv.setViewName("main/search");
    return mv;
  }
}
