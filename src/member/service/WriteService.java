package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

public class WriteService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		<jsp:useBean id="memberDTO" class="member.bean.MemberDTO"/>
		<jsp:setProperty property="*" name="memberDTO"/>



		MemberDAO memberDAO = MemberDAO.getInstance();
		int su = memberDAO.write(memberDTO);

		
		return su;
	}

}
