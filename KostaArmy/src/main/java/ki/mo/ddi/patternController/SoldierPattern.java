package ki.mo.ddi.patternController;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SoldierPattern {

	@RequestMapping("/patternSoldierName.do")
	public void patternSoldierName(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String soldier_name = request.getParameter("soldier_name");

		Pattern p_soldier_name = Pattern.compile("(^[가-힣]{2,10}$)");
		Matcher m_soldier_name = p_soldier_name.matcher(soldier_name);

		if (!m_soldier_name.find()) {
			response.getWriter().print(0);
		} else {
			response.getWriter().print(1);
		}

	}

	@RequestMapping("/patternSoldierNum.do")
	public void patternSoldierNumber(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String soldier_num = request.getParameter("soldier_number");

		Pattern p_soldier_num = Pattern.compile("(^[0-9]{2}-[0-9]{8}$)");
		Matcher m_soldier_num = p_soldier_num.matcher(soldier_num);

		if (!m_soldier_num.find()) {
			response.getWriter().print(0);
		} else {
			response.getWriter().print(1);
		}

	}

	@RequestMapping("/patternSoldierRegidentNum.do")
	public void patternSoldierRegidentNumber(HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String soldier_regidentNum = request.getParameter("soldier_regidentNum");

		Pattern p_soldier_regidentNum = Pattern
				.compile("(^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))-[1-4][0-9]{6}$)");
		Matcher m_soldier_regidentNum = p_soldier_regidentNum.matcher(soldier_regidentNum);

		if (!m_soldier_regidentNum.find()) {
			response.getWriter().print(0);

		} else {
			response.getWriter().print(1);
		}

	}


	@RequestMapping("/patternSoldierPhone.do")
	public void patternSoldierPhone(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String soldier_phone = request.getParameter("soldier_phone");

		Pattern p_soldier_phone = Pattern.compile("(^01(?:0|1|0)-(?:\\d{3}|\\d{4})-\\d{4}$)");

		Matcher m_soldier_phone = p_soldier_phone.matcher(soldier_phone);

		if (!m_soldier_phone.find()) {
			response.getWriter().print(0);

		} else {
			response.getWriter().print(1);
		}

	}

}