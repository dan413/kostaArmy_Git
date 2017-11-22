package ki.mo.ddi.adminController;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import ki.mo.ddi.adminModel.AdminDAO;
import ki.mo.ddi.adminModel.AdminDTO;
import ki.mo.ddi.adminModel.Admin_WeekDAO;
import ki.mo.ddi.adminModel.Admin_WeekDTO;

@Controller
public class AdminController {
	
	@Resource
	private AdminDAO adminDAO;
	@Resource
	private Admin_WeekDAO admin_WeekDAO;
	
	
	@RequestMapping("/AdminWorkSchedule.do")
	public String adminWorkSchedule() {
		
		return "cadre_admin/adminWorkSchedule";
	}
	
	@RequestMapping("/AdminFood.do")
	public String adminFood() {

		return "cadre_admin/adminFood";
	}
	
	@RequestMapping("/AdminDaily.do")
	public String adminDaily(HttpServletRequest request, HttpServletResponse response,HttpSession session) {
		String cadre_group = (String)session.getAttribute("group");
		request.setAttribute("cadre_group", cadre_group);
		return "cadre_admin/adminDaily";
	}
	
	@RequestMapping("/weekPlan.do")
	   public String weekPlan(Model model,HttpServletRequest request, HttpServletResponse response,HttpSession session) throws IOException {
		String cadre_group = (String)session.getAttribute("group");
		request.setAttribute("cadre_group", cadre_group);
		List<Admin_WeekDTO> list = admin_WeekDAO.getAllWeekly(cadre_group); 
	      model.addAttribute("list", list);
	      return "cadre_admin/adminWeek";
	}
	
	@RequestMapping("/monthPlan.do")
	   public String getAllWeekly(Model model, HttpServletResponse response,HttpSession session) throws IOException {
			String cadre_group = (String)session.getAttribute("group");
			List<Admin_WeekDTO> list = admin_WeekDAO.getAllWeekly(cadre_group); 
			model.addAttribute("list", list);
	      
	      return "cadre_admin/adminMonth";
	}
	
	@RequestMapping("/AdminSubmit.do")
	public void adminsubmit(HttpServletRequest request, HttpServletResponse response, AdminDTO dto,HttpSession session) throws IOException {
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		String dailyContent = request.getParameter("dailyContent");
		String dailyMemo = request.getParameter("dailyMemo");
		String dailyTime = request.getParameter("dailyTime");
		
		if(dailyContent == null || dailyContent.equals("")||dailyTime == null || dailyTime.equals("")){
			response.getWriter().write("0");
		}
		else if(dailyMemo == null || dailyMemo.equals("")){
			dto.setDailyMemo("내용 없음");
			adminDAO.dailyInsert(dto);
		}
		else{
			adminDAO.dailyInsert(dto);
		}
	}
	
	@RequestMapping("/DailyUpdateFunction.do")
	public void dailyUpdateFunction(HttpServletRequest request, HttpServletResponse response, AdminDTO dto) throws IOException {
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		String dailyContent = request.getParameter("dailyContent");
		String dailyMemo = request.getParameter("dailyMemo");
		String dailyTime = request.getParameter("dailyTime");
		if(dailyContent == null || dailyContent.equals("")||dailyTime == null || dailyTime.equals("")){
			response.getWriter().write("0");
		}
		else if(dailyMemo == null || dailyMemo.equals("")){
			dto.setDailyMemo("내용 없음");
			adminDAO.dailyUpdate(dto);
		}
		else{
			adminDAO.dailyUpdate(dto);
		}
	}
	
	@RequestMapping("/DailyListFunction.do")
	public void dailyListFunction(HttpServletRequest request, HttpServletResponse response,AdminDTO dto,HttpSession session) throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String listType = request.getParameter("listType");
		if(listType == null || listType.equals("")){
			response.getWriter().write("");
		}
		else if(listType.equals("listAll")) response.getWriter().write(getToday(dto, session));
	}
	
	@RequestMapping("/DailyDeleteFunction.do")
	public void dailyDeleteFunction(HttpServletRequest request, HttpServletResponse response,AdminDTO dto) throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		int dailyID =Integer.parseInt(request.getParameter("dailyID"));
		adminDAO.dailyDelete(dailyID);
	}
	
	private String getToday(AdminDTO dto,HttpSession session) {
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		String cadre_group = (String)session.getAttribute("group");
		try {
			ArrayList<AdminDTO> dailyList = adminDAO.getDaily(cadre_group);

			for (int i = 0; i < dailyList.size(); i++) {
				result.append("[{\"value\": \"" + dailyList.get(i).getDailyID() + "\"},");
				result.append("{\"value\": \"" + dailyList.get(i).getDailyContent().replaceAll(" ", "&nbsp;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") + "\"},");
				result.append("{\"value\": \"" + dailyList.get(i).getDailyMemo().replaceAll(" ", "&nbsp;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") + "\"},");
				result.append("{\"value\": \"" + dailyList.get(i).getDailyTime().replaceAll(" ", "&nbsp;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") + "\"}]");
				if (i != dailyList.size() - 1)
					result.append(",");
			}
			result.append("], \"last\":\"" + dailyList.get(dailyList.size() - 1).getDailyID() + "\"}");
			return result.toString();
		} catch (Exception e) {
			return result.toString();
		}
	}
	@RequestMapping("/monthDelete.do")
	public String deleteWeekly(HttpSession session, String cadre_group) {
		cadre_group = (String)session.getAttribute("group");
		admin_WeekDAO.deleteWeekly(cadre_group);
		return "cadre_admin/adminMonth";
	}
	
	/* 월간에서 주간 일정을 수정할 경우 */
	@RequestMapping("/weekUpdate.do")
	public void updateWeekly(Admin_WeekDTO dto, HttpServletRequest request, HttpServletResponse response) throws Exception {

		String w_num = request.getParameter("w_num");
		String weekly = request.getParameter("weekly");
		String w_monday = request.getParameter("w_monday");
		String w_tuesday = request.getParameter("w_tuesday");
		String w_wednesday = request.getParameter("w_wednesday");
		String w_thursday = request.getParameter("w_thursday");
		String w_friday = request.getParameter("w_friday");
		String w_saturday = request.getParameter("w_saturday");
		String w_sunday = request.getParameter("w_sunday");

		request.setAttribute("weekly", weekly);
		request.setAttribute("w_monday", w_monday);
		request.setAttribute("w_tuesday", w_tuesday);
		request.setAttribute("w_wednesday", w_wednesday);
		request.setAttribute("w_thursday", w_thursday);
		request.setAttribute("w_friday", w_friday);
		request.setAttribute("w_saturday", w_saturday);
		request.setAttribute("w_sunday", w_sunday);
		request.setAttribute("w_num", w_num);
		admin_WeekDAO.updateWeekly(dto);

		response.getWriter().write(1);
	}
	
	//------------------------엑섹저장 파일
	@RequestMapping("/AdminDailyExel.do")
	public String adminDailyExel(AdminDTO dto, Model model, HttpServletRequest request, HttpServletResponse response,HttpSession session) throws UnsupportedEncodingException {
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		String cadre_group = (String)session.getAttribute("group");
		String today = request.getParameter("today");
		
		request.setAttribute("today", today);
		ArrayList<AdminDTO> dailyList = adminDAO.getDaily(cadre_group);
		model.addAttribute("dailyList", dailyList);
		String fileName = "복무일지";
		String docName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
		response.setHeader("Content-Disposition", "attachment;filename="+docName+today+".xls");
		response.setHeader("Content-Description", "JSP Generated Data");

		adminDAO.dailyAllDelete(cadre_group);
		return "cadre_admin/adminDailyExel";
	}
	
	
	@RequestMapping("/AdminFoodExel.do")
	public String adminFoodExel(Model model, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		String supplyName = request.getParameter("supplyName");
		String officerName = request.getParameter("officerName");
		String today = request.getParameter("today");
		String breakFast = request.getParameter("breakFast");
		String lunch = request.getParameter("lunch");
		String dinner = request.getParameter("dinner");
		String supplyFood = request.getParameter("supplyFood");
		
		request.setAttribute("supplyName", supplyName);
		request.setAttribute("officerName", officerName);
		request.setAttribute("today", today);
		request.setAttribute("breakFast", breakFast);
		request.setAttribute("lunch", lunch);
		request.setAttribute("dinner", dinner);
		request.setAttribute("supplyFood", supplyFood);
		
		String fileName = "급양관리";
		String docName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
		response.setHeader("Content-Disposition", "attachment;filename="+docName+today+".xls");
		response.setHeader("Content-Description", "JSP Generated Data");
		
		return "cadre_admin/adminFoodExel";
	}
	
	@RequestMapping("/AdminNightExel.do")
	public String adminNightExel(Model model, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		String nightDate = request.getParameter("nightDate");
		String officerName = request.getParameter("officerName");
		String officerSubName = request.getParameter("officerSubName");
		String nightWitch1 = request.getParameter("nightWitch1");
		String nightWitch2 = request.getParameter("nightWitch2");
		String nightWitch3 = request.getParameter("nightWitch3");
		String nightWitch4 = request.getParameter("nightWitch4");
		String nightWitch5 = request.getParameter("nightWitch5");
		String nightWitch6 = request.getParameter("nightWitch6");
		String fiveMinuteCaptain = request.getParameter("fiveMinuteCaptain");
		String fiveMinuteDriver = request.getParameter("fiveMinuteDriver");
		String fiveMinute1 = request.getParameter("fiveMinute1");
		String fiveMinute2 = request.getParameter("fiveMinute2");
		String fiveMinute3 = request.getParameter("fiveMinute3");
		String fiveMinute4 = request.getParameter("fiveMinute4");
		String fiveMinute5 = request.getParameter("fiveMinute5");
		String fiveMinute6 = request.getParameter("fiveMinute6");
		String fiveMinute7 = request.getParameter("fiveMinute7");
		String fiveMinute8 = request.getParameter("fiveMinute8");
		String note = request.getParameter("note");
		
		request.setAttribute("nightDate", nightDate);
		request.setAttribute("officerName", officerName);
		request.setAttribute("officerSubName", officerSubName);
		request.setAttribute("nightWitch1", nightWitch1);
		request.setAttribute("nightWitch2", nightWitch2);
		request.setAttribute("nightWitch3", nightWitch3);
		request.setAttribute("nightWitch4", nightWitch4);
		request.setAttribute("nightWitch5", nightWitch5);
		request.setAttribute("nightWitch6", nightWitch6);
		request.setAttribute("fiveMinuteCaptain", fiveMinuteCaptain);
		request.setAttribute("fiveMinuteDriver", fiveMinuteDriver);
		request.setAttribute("fiveMinute1", fiveMinute1);
		request.setAttribute("fiveMinute2", fiveMinute2);
		request.setAttribute("fiveMinute3", fiveMinute3);
		request.setAttribute("fiveMinute4", fiveMinute4);
		request.setAttribute("fiveMinute5", fiveMinute5);
		request.setAttribute("fiveMinute6", fiveMinute6);
		request.setAttribute("fiveMinute7", fiveMinute7);
		request.setAttribute("fiveMinute8", fiveMinute8);
		request.setAttribute("note", note);
		
		String fileName = "근무일지(불침번)";
		String docName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
		response.setHeader("Content-Disposition", "attachment;filename="+docName+nightDate+".xls");
		response.setHeader("Content-Description", "JSP Generated Data");
		
		return "cadre_admin/adminNightExel";
	}
	
	@RequestMapping("/AdminTowerExel.do")
	public String adminTowerExel(Model model, HttpServletRequest request , HttpServletResponse response) throws UnsupportedEncodingException {
		
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		
		String today = request.getParameter("today");
		String officerName = request.getParameter("officerName");
		String officerSubName = request.getParameter("officerSubName");
		String nightWitch1 = request.getParameter("nightWitch1");
		String nightWitch2 = request.getParameter("nightWitch2");
		String nightWitch3 = request.getParameter("nightWitch3");
		String nightWitch4 = request.getParameter("nightWitch4");
		String nightWitch5 = request.getParameter("nightWitch5");
		String nightWitch6 = request.getParameter("nightWitch6");
		String nightWitch7 = request.getParameter("nightWitch7");
		String nightWitch8 = request.getParameter("nightWitch8");
		String nightWitch9 = request.getParameter("nightWitch9");
		String nightWitch10 = request.getParameter("nightWitch10");
		String nightWitch11 = request.getParameter("nightWitch11");
		String nightWitch12 = request.getParameter("nightWitch12");
		String nightWitch13 = request.getParameter("nightWitch13");
		String nightWitch14 = request.getParameter("nightWitch14");
		String nightWitch15 = request.getParameter("nightWitch15");
		String nightWitch16 = request.getParameter("nightWitch16");
		String nightWitch17 = request.getParameter("nightWitch17");
		String nightWitch18 = request.getParameter("nightWitch18");
		String nightWitch19 = request.getParameter("nightWitch19");
		String nightWitch20 = request.getParameter("nightWitch20");
		String nightWitch21 = request.getParameter("nightWitch21");
		String nightWitch22 = request.getParameter("nightWitch22");
		String nightWitch23 = request.getParameter("nightWitch23");
		String nightWitch24 = request.getParameter("nightWitch24");
		String note = request.getParameter("note");
		
		request.setAttribute("today", today);
		request.setAttribute("officerName", officerName);
		request.setAttribute("officerSubName", officerSubName);
		request.setAttribute("nightWitch1", nightWitch1);
		request.setAttribute("nightWitch2", nightWitch2);
		request.setAttribute("nightWitch3", nightWitch3);
		request.setAttribute("nightWitch4", nightWitch4);
		request.setAttribute("nightWitch5", nightWitch5);
		request.setAttribute("nightWitch6", nightWitch6);
		request.setAttribute("nightWitch7", nightWitch7);
		request.setAttribute("nightWitch8", nightWitch8);
		request.setAttribute("nightWitch9", nightWitch9);
		request.setAttribute("nightWitch10", nightWitch10);
		request.setAttribute("nightWitch11", nightWitch11);
		request.setAttribute("nightWitch12", nightWitch12);
		request.setAttribute("nightWitch13", nightWitch13);
		request.setAttribute("nightWitch14", nightWitch14);
		request.setAttribute("nightWitch15", nightWitch15);
		request.setAttribute("nightWitch16", nightWitch16);
		request.setAttribute("nightWitch17", nightWitch17);
		request.setAttribute("nightWitch18", nightWitch18);
		request.setAttribute("nightWitch19", nightWitch19);
		request.setAttribute("nightWitch20", nightWitch20);
		request.setAttribute("nightWitch21", nightWitch21);
		request.setAttribute("nightWitch22", nightWitch22);
		request.setAttribute("nightWitch23", nightWitch23);
		request.setAttribute("nightWitch24", nightWitch24);
		request.setAttribute("note", note);
		String fileName = "근무일지(초소)";
		String docName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
		response.setHeader("Content-Disposition", "attachment;filename="+docName+today+".xls");
		response.setHeader("Content-Description", "JSP Generated Data");
		
		return "cadre_admin/adminTowerExel";
	}
	
	@RequestMapping("/monthExcel.do")
	public String monthExcel(Model model, HttpServletResponse response, HttpSession session) throws IOException {
		String cadre_group = (String)session.getAttribute("group");
		List<Admin_WeekDTO> list = admin_WeekDAO.getAllWeekly(cadre_group);
		model.addAttribute("list", list);

		String fileName = "월간종합";
		String docName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
		response.setHeader("Content-Disposition", "attachment;filename=" + docName + ".xls");
		response.setHeader("Content-Description", "JSP Generated Data");
		return "cadre_admin/adminMonthExcel";
	}
//-------------------------
	
	
//---------------주 간 계 획----

	@RequestMapping("/weekSave.do")
	public String weekSave(Admin_WeekDTO dto, Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws UnsupportedEncodingException {
		
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		
		try {
			admin_WeekDAO.insertWeekly(dto);
			return "redirect:/weekPlan.do";
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/weekPlan.do";
		}
	}
	
	@RequestMapping("/weekExcel.do")
	public String weekExel(Admin_WeekDTO dto, Model model, HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");

		String w_num = request.getParameter("w_num");
		String weekly = request.getParameter("weekly");

		
		request.setAttribute("w_num", w_num);
		request.setAttribute("weekly", weekly);
		Admin_WeekDTO admin_obj = admin_WeekDAO.selectWeekly(w_num);
		request.setAttribute("w_num", admin_obj.getW_num());
		request.setAttribute("weekly", admin_obj.getWeekly());
		request.setAttribute("w_monday", admin_obj.getW_monday());
		request.setAttribute("w_tuesday", admin_obj.getW_tuesday());
		request.setAttribute("w_wednesday", admin_obj.getW_wednesday());
		request.setAttribute("w_thursday", admin_obj.getW_thursday());
		request.setAttribute("w_friday", admin_obj.getW_friday());
		request.setAttribute("w_saturday", admin_obj.getW_saturday());
		request.setAttribute("w_sunday", admin_obj.getW_sunday());
		

		String fileName =  w_num+"주차 주간계획";
		String docName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
		response.setHeader("Content-Disposition", "attachment;filename=" + docName+ ".xls");
		response.setHeader("Content-Description", "JSP Generated Data");
		
		return "cadre_admin/adminWeekExcel";
		
	}
	
}
