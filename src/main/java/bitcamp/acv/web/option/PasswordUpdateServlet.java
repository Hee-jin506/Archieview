package bitcamp.acv.web.option;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import bitcamp.acv.domain.Member;

@WebServlet("/option/password/update")
public class PasswordUpdateServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    // 클라이언트 전용 보관소(httpSession)를 준비한다.
    HttpSession session = request.getSession();

    // 클라이언트로 데이터를 출력할 때 사용할 스트림 준비
    response.setContentType("text/html;charset=UTF-8");
    PrintWriter out = response.getWriter();

    out.println("<!DOCTYPE html>");
    out.println("<html>");
    out.println("<head><title>비밀번호변경</title></head>");
    out.println("<body>");

    try {
      Member member = (Member) session.getAttribute("loginUser");

      if (member == null) {
        out.println("<h1>로그인이 되어있지 않습니다!</h1>");
        out.println("<meta http-equiv='Refresh' content='2;url=../../auth/login'>");
      } else {
        out.println("<form action='check' method='post'>");
        out.printf("<input type='hidden' name='no' value='%d'><br>\n",
            member.getNo());
        out.println("기존 비밀번호 <input type='password' name='oldpassword'><br>");
        out.println("새 비밀번호 <input type='password' name='newpassword'><br>");
        out.println("<button>변경</button>");
        out.println("</form>");
      }
    } catch (Exception e) {
      request.setAttribute("exception", e);
      request.getRequestDispatcher("/error").forward(request, response);
      return;
    }

    out.println("</body></html>");
  }
}