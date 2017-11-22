package ki.mo.ddi.commuteController;

import java.io.IOException;
import java.security.Principal;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import ki.mo.ddi.cadreModel.CadreDAO;
import ki.mo.ddi.cadreModel.CadreDTO;
import ki.mo.ddi.commuteModel.Cadre_CommuteListDAO;
import ki.mo.ddi.commuteModel.Cadre_CommuteListDTO;
import ki.mo.ddi.commuteModel.Cadre_PayListDAO;
import ki.mo.ddi.commuteModel.Cadre_PayListDTO;

@Controller
public class Cadre_CommuteController {

	@Resource
	private Cadre_CommuteListDAO cadre_CommuteListDAO;
	@Resource
	private Cadre_PayListDAO cadre_PayListDAO;
	@Resource
	private CadreDAO cadreDAO;
	
	@RequestMapping("/start_commute.do")
	public void start_commute(HttpServletResponse response, HttpServletRequest request) throws Exception {
		Cadre_CommuteListDTO commute_dto = new Cadre_CommuteListDTO();
		commute_dto.setCadre_number((String) request.getSession().getAttribute("cadre_num"));
		cadre_CommuteListDAO.insertStart_time(commute_dto);
		
		String start_time = cadre_CommuteListDAO.getStart_time((String) request.getSession().getAttribute("cadre_num"));
		
		request.getSession().setAttribute("start_time", start_time);
		response.getWriter().write(start_time);
	}
 
	@RequestMapping("/end_commute.do")
	public void end_commute(HttpServletResponse response, HttpServletRequest request) throws Exception {
		String cadre_number = (String)request.getSession().getAttribute("cadre_num");
		Cadre_CommuteListDTO cadre_commuteObj = cadre_CommuteListDAO.getCadre_CommuteRecord(cadre_number);
		if(cadre_commuteObj.getCommute_flag() == 1) {
			cadre_CommuteListDAO.updateEnd_Commute(cadre_number);
			String end_time = cadre_CommuteListDAO.getEnd_CommuteTime(cadre_number);
			request.getSession().setAttribute("end_time", end_time);
			response.getWriter().write(end_time);
		}
		else if(cadre_commuteObj.getCommute_flag() == 2) {
			Timestamp temp_end_time = new Timestamp(System.currentTimeMillis());
			Timestamp over_time = cadre_commuteObj.getOver_time();
			int end_hour = temp_end_time.getHours();
			int over_hour = over_time.getHours();
			
			int over_pay = (end_hour - over_hour) * 9350;
			cadre_commuteObj.setOver_pay(over_pay);
			cadre_CommuteListDAO.updateEnd_Commute_over(cadre_commuteObj);
			String end_time = cadre_CommuteListDAO.getEnd_CommuteTime(cadre_number);
			request.getSession().setAttribute("end_time", end_time);
			response.getWriter().write(end_time);
		}
	}
	
	@RequestMapping("/over_commute.do")
	public void over_commute(HttpServletResponse response, HttpServletRequest request) throws Exception{
		//cadre_CommuteListDAO
		String cadre_number = (String)request.getSession().getAttribute("cadre_num");
		int result = cadre_CommuteListDAO.updateOver_Commute(cadre_number);
		String over_time = cadre_CommuteListDAO.getOver_CommuteTime(cadre_number);
		if(result == 1) {
			request.getSession().setAttribute("over_time", over_time);
			response.getWriter().write(over_time);
		}
	}
	
	@RequestMapping("/mycommute_pay.do")
	public String myCommute_PayList(Principal principal, Model model, HttpServletRequest request, HttpServletResponse response) throws ParseException, IOException {
		int flag=0;
		
		String cadre_number = principal.getName();
		String month = request.getParameter("month");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Cadre_CommuteListDTO cadre_commuteObj = new Cadre_CommuteListDTO();
		Timestamp current_date = new Timestamp(System.currentTimeMillis());
		String year = null;
		String pay_year = null;
		
		if(month == null && year == null) {
			month = current_date.toString().split(" ")[0].split("-")[1]; //해당 달을 구해옴
			if(month.equals("12")) {
				year = current_date.toString().split(" ")[0].split("-")[0]; //해당 년도를 구해옴
				pay_year = String.valueOf((Integer.parseInt(current_date.toString().split(" ")[0].split("-")[0])+1));
			}
			else {
				year = current_date.toString().split(" ")[0].split("-")[0]; //해당 년도를 구해옴
				pay_year = current_date.toString().split(" ")[0].split("-")[0]; //해당 년도를 구해옴
			}
		} else {
			if(month.equals("12")) {
				year = current_date.toString().split(" ")[0].split("-")[0]; //해당 년도를 구해옴
				pay_year = String.valueOf((Integer.parseInt(current_date.toString().split(" ")[0].split("-")[0])+1));
			}
			else {
				year = current_date.toString().split(" ")[0].split("-")[0]; //해당 년도를 구해옴
				pay_year = current_date.toString().split(" ")[0].split("-")[0]; //해당 년도를 구해옴
			}
		}
		String pay_time = null;
		if(month.equals("12")) {
			pay_time = pay_year+"-"+1+"-"+1;
		}
		else {
			pay_time = pay_year+"-"+(Integer.parseInt(month)+1)+"-"+1;
		}
		
		String start_time =  year+"-"+month+"-"+1; //시작일 마지막일 구하기
		Date date = new Date();
		date = sdf.parse(start_time);
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		String end_time = year+"-"+month+"-"+cal.getActualMaximum(Calendar.DAY_OF_MONTH);
	
		cadre_commuteObj.setCadre_number(cadre_number);
		cadre_commuteObj.setStart_time(Timestamp.valueOf(start_time+" 00:00:00.0"));
		cadre_commuteObj.setEnd_time(Timestamp.valueOf(end_time+" 00:00:00.0"));
		List<Cadre_CommuteListDTO> cadre_commuteList = cadre_CommuteListDAO.getCadre_CommuteList(cadre_commuteObj);
		
		Cadre_PayListDTO cadre_payObj = new Cadre_PayListDTO();
		cadre_payObj.setCadre_number(cadre_number);
		cadre_payObj.setCadre_sendPayDate(Timestamp.valueOf(pay_time+" 00:00:00.0"));
		cadre_payObj = cadre_PayListDAO.getCadre_PayList(cadre_payObj);
		
		CadreDTO cadre_obj = new CadreDTO();
		cadre_obj = cadreDAO.getCadreInfo(cadre_number);
		String nullMessage = null;
		if(cadre_commuteList.size() == 0) {
			nullMessage = "출근 내역이 없습니다.";
		} 
		model.addAttribute("nullMessage", nullMessage);
		model.addAttribute("month", month);
		model.addAttribute("cadre_payObj", cadre_payObj);
		model.addAttribute("cadre_obj", cadre_obj);
		model.addAttribute("cadre_commuteList", cadre_commuteList);
		
		return "cadre_commute/mycommute_pay";
	}
}
