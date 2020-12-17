package bitcamp.acv.web.option;

import java.util.UUID;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import bitcamp.acv.domain.Member;
import bitcamp.acv.service.MemberService;
import net.coobird.thumbnailator.ThumbnailParameter;
import net.coobird.thumbnailator.Thumbnails;
import net.coobird.thumbnailator.geometry.Positions;
import net.coobird.thumbnailator.name.Rename;

@Controller
@RequestMapping("/option")
public class OptionController {

  @Autowired MemberService memberService;
  @Autowired ServletContext servletContext;

  private void generatePhotoThumbnail(String saveFilePath) {
    try {
      Thumbnails.of(saveFilePath)
      .size(35, 35)
      .outputFormat("jpg")
      .crop(Positions.CENTER)
      .toFiles(new Rename() {
        @Override
        public String apply(String name, ThumbnailParameter param) {
          return name + "_35x35";
        }
      });

      Thumbnails.of(saveFilePath)
      .size(150, 150)
      .outputFormat("jpg")
      .crop(Positions.CENTER)
      .toFiles(new Rename() {
        @Override
        public String apply(String name, ThumbnailParameter param) {
          return name + "_150x150";
        }
      });
    } catch (Exception e) {
      e.printStackTrace();
    }
  }

  @RequestMapping("profile")
  protected ModelAndView profile(HttpServletRequest request) throws Exception {

    ModelAndView mv = new ModelAndView();
    HttpSession session = request.getSession();

    Member member = (Member) session.getAttribute("loginUser");
    if (member == null) {
      throw new Exception("로그인 되어있지 않습니다.");
    } else {
      mv.addObject("member", member);
      mv.setViewName("/option/profile.jsp");
      return mv;
    }
  }

  @RequestMapping("profile/update")
  protected String update(Member member) throws Exception {
    memberService.update(member);
    return "redirect:profile";
  }

  @RequestMapping("profile/updatePhoto")
  protected String updatePhoto(HttpServletRequest request, HttpServletRequest response) throws Exception {

    Member member = new Member();
    member.setNo(Integer.parseInt(request.getParameter("no")));

    Part photoPart = request.getPart("photo");
    if (photoPart.getSize() > 0) {
      String filename = UUID.randomUUID().toString();
      String saveFilePath = servletContext.getRealPath("/upload/" + filename);
      photoPart.write(saveFilePath);
      member.setPhoto(filename);

      // 회원 사진의 썸네일 이미지 파일 생성하기
      generatePhotoThumbnail(saveFilePath);
    }

    if (member.getPhoto() == null) {
      throw new Exception("사진을 선택하지 않았습니다.");
    } else {
      memberService.update(member);
    }
    return "redirect:profile";
  }

  @RequestMapping("password/hint")
  protected ModelAndView passwordHint(HttpServletRequest request) throws Exception {

    HttpSession session = request.getSession();
    ModelAndView mv = new ModelAndView();

    Member member = (Member) session.getAttribute("loginUser");

    if (member == null) {
      throw new Exception("로그인 되어있지 않습니다.");
    } else {
      mv.addObject("member", member);
      mv.setViewName("/option/passwordHint.jsp");
      return mv;
    }
  }

  @RequestMapping("password/update")
  protected ModelAndView passwordUpdate(HttpServletRequest request) throws Exception {

    HttpSession session = request.getSession();
    ModelAndView mv = new ModelAndView();

    Member member = (Member) session.getAttribute("loginUser");

    if (member == null) {
      throw new Exception("로그인 되어있지 않습니다.");
    } else {
      mv.addObject("member", member);
      mv.setViewName("/option/passwordUpdate.jsp");
      return mv;
    }
  }

  @RequestMapping("password/check")
  protected String passwordCheck(HttpServletRequest request) throws Exception {

    HttpSession session = request.getSession();

    Member old = (Member) session.getAttribute("loginUser");
    String email = old.getEmail();
    String oldPassword = request.getParameter("oldpassword");

    Member m = memberService.get(email, oldPassword);

    if (m != null) {
      String newPassword = request.getParameter("newpassword");
      m.setPassword(newPassword);
      memberService.updatePassword(m);
    } else {
    }
    return "redirect:update";
  }

  @RequestMapping("withdraw")
  protected ModelAndView withdraw(HttpServletRequest request) throws Exception {

    HttpSession session = request.getSession();
    ModelAndView mv = new ModelAndView();

    Member member = (Member) session.getAttribute("loginUser");

    if (member == null) {
      throw new Exception("로그인 되어있지 않습니다.");
    } else {
      mv.addObject("member", member);
      mv.setViewName("/option/withdraw.jsp");
      return mv;
    }
  }
}