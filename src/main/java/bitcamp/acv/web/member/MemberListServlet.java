package bitcamp.acv.web.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import bitcamp.acv.domain.Member;
import bitcamp.acv.service.MemberService;

@WebServlet("/member/list")
public class MemberListServlet extends HttpServlet {

  private static final long serialVersionUID = 1L;

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    ServletContext ctx = request.getServletContext();
    MemberService memberService =  (MemberService) ctx.getAttribute("memberService");
    response.setContentType("text/html;charset=UTF-8");

    PrintWriter out = response.getWriter();

    out.println("<!DOCTYPE html>");
    out.println("<html>");
    out.println("<head><title>멤버 목록</title></head>");
    out.println("<body>");

    try {

      out.println("<h1>[멤버 목록]</h1>");

      String keyword = request.getParameter("keyword");

      out.println("<form action='list' method='get'>");
      out.printf("검색어: <input type='search' name='keyword' value='%s'>\n",
          keyword != null ? keyword : "회원 번호, 이름, 이메일, 닉네임, 회원상태로 검색");
      // 상태 번호와 회원 번호가 동시에 검색이 됩니다.
      out.println("<button>검색</button>");
      out.println("</form>");
      out.println("</p>");


      // 총 회원수
      //      out.printf("<span>총 회원수 : %d</span><br>", memberService.list().size());

      List<Member> list = memberService.list(keyword);

      out.println("<form action='multipleDelete' method='get'>");
      out.println("<button>삭제</button>");
      out.println("<table border=\"1\">");
      out.println("<thead><tr>");
      out.println("<th></th>");
      out.println("<th>회원 번호</th>");
      out.println("<th>권한</th>");
      out.println("<th>이름</th>");
      out.println("<th>로그인 유형 번호</th>");
      out.println("<th>이메일</th>");
      out.println("<th>암호</th>");
      out.println("<th>별명</th>");
      out.println("<th>소개글</th>");
      out.println("<th>비밀번호 힌트 질문 번호</th>");
      out.println("<th>비밀번호 힌트 정답</th>");
      out.println("<th>회원 가입일</th>");
      out.println("<th>회원 상태</th>");
      out.println("<th>회원 상태 변경일</th>");
      out.println("</tr></thead>");

      for (Member member : list ) {

        //        int statusLabel = member.getStatus();
        //        String label = "";
        //        switch (statusLabel) {
        //          case 1 : label = "활동중";
        //          break;
        //          case 2 : label = "정지";
        //          break;
        //          case 3 : label = "탈퇴";
        //          break;
        //        }

        out.printf("<tr>"
            + "<td><input type='checkbox' name='members' value='%d'</td>\n" // 선택
            + "<td>%1$d</td>\n" // no
            + "<td>%d</td>\n" // auto
            + "<td><a href='detail?no=%1$d'>%s</a></td>\n" // name
            + "<td>%d</td>\n" // login
            + "<td>%s</td>\n" // email
            + "<td>%s</td>\n" // pw
            + "<td>%s</td>\n" // nick
            + "<td>%s</td>\n" // intro
            + "<td>%d</td>\n" // qno
            + "<td>%s</td>\n" // qan
            + "<td>%s</td>\n" // rdt
            + "<td>%s</td>\n" // statusTitle
            + "<td>%s</td>\n", // smdt

            member.getNo(),
            member.getAuthority(),
            member.getName(),
            member.getLoginNo(),
            member.getEmail(),
            member.getPassword(),
            member.getNickName(),
            member.getIntro(),
            member.getQuestionsNo(),
            member.getQuestionsAnswer(),
            member.getRegisteredDate(),
            member.getStatusTitle(),
            member.getStatusModifiedDate()
            );
      }
      out.println("</tr>");

    } catch (Exception e) {
      out.printf("작업 처리 중 오류 발생! - %s\n", e.getMessage());
      StringWriter errOut = new StringWriter();
      e.printStackTrace(new PrintWriter(errOut));
      out.printf("<pre>%s</pre>\n", errOut.toString());
    }
    out.println("</body>");
    out.println("</html>");
  }
}


