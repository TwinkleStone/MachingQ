package controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import model.service.UserManager;

public class LoginController implements Controller {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	String stuId = request.getParameter("stuId");
		String password = request.getParameter("password");
		
		try {
			// �𵨿� �α��� ó���� ����
			UserManager manager = UserManager.getInstance();
			manager.login(stuId, password);
	
			// ���ǿ� ����� ���̵� ����
			HttpSession session = request.getSession();
            session.setAttribute(UserSessionUtils.USER_SESSION_KEY, stuId);
            
            return "redirect:/review/list";			
		} catch (Exception e) {
			/* UserNotFoundException�̳� PasswordMismatchException �߻� ��
			 * �ٽ� login form�� ����ڿ��� �����ϰ� ���� �޼����� ���
			 */
            request.setAttribute("loginFailed", true);
			request.setAttribute("exception", e);
            return "/user/loginForm.jsp";			
		}	
    }
}