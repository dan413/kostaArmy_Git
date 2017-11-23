package ki.mo.ddi.managerController;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ki.mo.ddi.cadreModel.CadreDAO;
import ki.mo.ddi.cadreModel.CadreDTO;
import ki.mo.ddi.managerModel.Manager_SoldierDAO;
import ki.mo.ddi.managerModel.Manager_SoldierDTO;
import ki.mo.ddi.managerModel.Vacation_ReceiptDAO;
import ki.mo.ddi.managerModel.Vacation_ReceiptDTO;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class VacationReceiptController {

	@Resource
	private Manager_SoldierDAO soldierDAO;
	@Resource
	private Vacation_ReceiptDAO receiptDAO;
	@Resource
	private CadreDAO cadreDAO;

	@RequestMapping("/soldierOutSide.do")
	public ModelAndView soldierOutSide() throws Exception {
		ModelAndView mav = new ModelAndView();
		
		Calendar calendar = new GregorianCalendar(Locale.KOREA);
		int nYear = calendar.get(Calendar.YEAR);
		int nMonth = calendar.get(Calendar.MONTH) + 1 +1;
		String fullcal = nYear + "-" + nMonth;

		SimpleDateFormat date = new SimpleDateFormat("yyyy/MM/dd");
		String count = "";
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String cadre = authentication.getName();
		CadreDTO cadre_dto = cadreDAO.findInfoByNum(cadre); // 간부 데이터 읽어 오고

		List<CadreDTO> cadre_list = cadreDAO.getAllCadre();
		List<Manager_SoldierDTO> soldier_list = soldierDAO.getAllSoldierList(); // 모든 간부 병사 리스트를 읽어 오자

		int soldier_count = receiptDAO.getCount_soldier(cadre_dto.getCadre_group());
		int cadre_count = receiptDAO.getCount_cadre(cadre_dto.getCadre_group());
		int total_count = soldier_count + cadre_count; // 해당 중대 총 병력

		int receipt_count = receiptDAO.getCount_receipt(cadre_dto.getCadre_group()); // 현재 휴가 신청 인원 수

		List<Vacation_ReceiptDTO> vacation_list = receiptDAO.selectCalendar(cadre_dto.getCadre_group());
		/*
		 * if(receipt_count != 0) { percent_Vacationer = total_count / receipt_count; }
		 */
		mav.addObject("soldier_count", soldier_count);
		mav.addObject("cadre_count", cadre_count);
		mav.addObject("total_count", total_count);
		mav.addObject("receipt_count", receipt_count);
		mav.addObject("soldier_list", soldier_list);
		mav.addObject("cadre_list", cadre_list);

		for (int i = 0; i < vacation_list.size(); i++) {

			vacation_list.get(i).setVacation_name(vacation_list.get(i).getVacation_name() + "("
					+ vacation_list.get(i).getVacation_mmr() + ") /" + vacation_list.get(i).getVacation_group());
			vacation_list.get(i).setVacation_start1(date.format(vacation_list.get(i).getVacation_start()));
			vacation_list.get(i).setVacation_end1(date.format(vacation_list.get(i).getVacation_end()));
		}

		JSONArray jsonArray = JSONArray.fromObject(vacation_list);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", jsonArray);
		JSONObject jsonObect = JSONObject.fromObject(map);
		
		//결제 중인지 결제 승인 됬는지 결제 취소됬는지 구하는 부분
		int v_ing = receiptDAO.getVacationProcessCount(cadre_dto.getCadre_group()); 
		int v_agree = receiptDAO.getVacationAgreeCount(cadre_dto.getCadre_group());
		int v_disagree = receiptDAO.getVacationDisAgreelCount(cadre_dto.getCadre_group());
		
		//각 중대 휴가 신청 여부
		int center_v_count = receiptDAO.getCenterVacationCount();
		int squad1_v_count = receiptDAO.getSquad1VacationCount();
		int squad2_v_count = receiptDAO.getSquad2VacationCount();
		int squad3_v_count = receiptDAO.getSquad3VacationCount();
		mav.addObject("center_v_count", center_v_count);
		mav.addObject("squad1_v_count", squad1_v_count);
		mav.addObject("squad2_v_count", squad2_v_count);
		mav.addObject("squad3_v_count", squad3_v_count);
		
		mav.addObject("fullcal", fullcal);
		mav.addObject("v_ing", v_ing);
		mav.addObject("v_agree", v_agree);
		mav.addObject("v_disagree", v_disagree);
		
		mav.addObject("jsonObject", jsonObect);
		mav.addObject("vacation_list", vacation_list);
		mav.setViewName("cadre_manager/vacation_Apply");
		return mav;
	}

	@RequestMapping("/soldierOutSide_sub.do")
	public ModelAndView sub_soldierOutSide(HttpServletRequest request) throws Exception {
		request.getSession().removeAttribute("part_flag");
		ModelAndView mav = new ModelAndView();
		
		Calendar calendar = new GregorianCalendar(Locale.KOREA);
		int nYear = calendar.get(Calendar.YEAR);
		int nMonth = calendar.get(Calendar.MONTH) + 1 +1;
		String fullcal = nYear + "-" + nMonth;
		
		SimpleDateFormat date = new SimpleDateFormat("yyyy/MM/dd");
		String count = "";
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String cadre = authentication.getName();
		CadreDTO cadre_dto = cadreDAO.findInfoByNum(cadre); // 간부 데이터 읽어 오고

		List<CadreDTO> cadre_list = cadreDAO.getAllCadre();
		List<Manager_SoldierDTO> soldier_list = soldierDAO.getAllSoldierList(); // 모든 간부 병사 리스트를 읽어 오자

		int soldier_count = receiptDAO.getCount_soldier(cadre_dto.getCadre_group());
		int cadre_count = receiptDAO.getCount_cadre(cadre_dto.getCadre_group());
		int total_count = soldier_count + cadre_count; // 해당 중대 총 병력

		int receipt_count = receiptDAO.getCount_receipt(cadre_dto.getCadre_group()); // 현재 휴가 신청 인원 수

		List<Vacation_ReceiptDTO> vacation_list = receiptDAO.selectCalendar(cadre_dto.getCadre_group());
	
		mav.addObject("soldier_count", soldier_count);
		mav.addObject("cadre_count", cadre_count);
		mav.addObject("total_count", total_count);
		mav.addObject("receipt_count", receipt_count);
		mav.addObject("soldier_list", soldier_list);
		mav.addObject("cadre_list", cadre_list);

		for (int i = 0; i < vacation_list.size(); i++) {

			vacation_list.get(i).setVacation_name(vacation_list.get(i).getVacation_name() + "("
					+ vacation_list.get(i).getVacation_mmr() + ") /" + vacation_list.get(i).getVacation_group());
			vacation_list.get(i).setVacation_start1(date.format(vacation_list.get(i).getVacation_start()));
			vacation_list.get(i).setVacation_end1(date.format(vacation_list.get(i).getVacation_end()));
		}

		JSONArray jsonArray = JSONArray.fromObject(vacation_list);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", jsonArray);
		JSONObject jsonObect = JSONObject.fromObject(map);
		//결제 중인지 결제 승인 됬는지 결제 취소됬는지 구하는 부분
		int v_ing = receiptDAO.getVacationProcessCount(cadre_dto.getCadre_group()); 
		int v_agree = receiptDAO.getVacationAgreeCount(cadre_dto.getCadre_group());
		int v_disagree = receiptDAO.getVacationDisAgreelCount(cadre_dto.getCadre_group());
		
		//각 중대 휴가 신청 여부
		int center_v_count = receiptDAO.getCenterVacationCount();
		int squad1_v_count = receiptDAO.getSquad1VacationCount();
		int squad2_v_count = receiptDAO.getSquad2VacationCount();
		int squad3_v_count = receiptDAO.getSquad3VacationCount();
		mav.addObject("center_v_count", center_v_count);
		mav.addObject("squad1_v_count", squad1_v_count);
		mav.addObject("squad2_v_count", squad2_v_count);
		mav.addObject("squad3_v_count", squad3_v_count);
		mav.addObject("v_ing", v_ing);
		mav.addObject("v_agree", v_agree);
		mav.addObject("v_disagree", v_disagree);
		mav.addObject("jsonObject", jsonObect);
		mav.addObject("vacation_list", vacation_list);
		mav.addObject("receipt_v_flag", "3");
		mav.addObject("fullcal", fullcal);
		mav.setViewName("cadre_manager/vacation_Apply");

		return mav;
	}

	@RequestMapping("/search_vacation.do")
	public ModelAndView search_vacation(HttpServletRequest request, HttpSession session) throws Exception {
	    String cadre_group = (String)session.getAttribute("group");
		ModelAndView mav = new ModelAndView();
		SimpleDateFormat date = new SimpleDateFormat("yyyy/MM/dd");

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String cadre = authentication.getName();
		
		Calendar calendar = new GregorianCalendar(Locale.KOREA);
		int nYear = calendar.get(Calendar.YEAR);
		int nMonth = calendar.get(Calendar.MONTH) + 1 + 1;
		String fullcal = nYear + "-" + nMonth;

		CadreDTO cadre_dto = cadreDAO.findInfoByNum(cadre);

		String keyvalue = request.getParameter("keyvalue");
		String arr1 = request.getParameter("m_search_table");
		String arr = request.getParameter("m_search_part");
		
		Map<String, String> map2 = new HashMap<String, String>();
		map2.put("arr", arr);
		map2.put("keyvalue", keyvalue);
		map2.put("cadre_group", cadre_group);
		if (arr1.equals("manager_soldier")) {

			List<Manager_SoldierDTO> soldier_list = soldierDAO.selectByKey_vacation_manager_soldier(map2);

			for (int i = 0; i < soldier_list.size(); i++) {

				if (soldier_list.get(i).getSoldier_s_vacation() != null
						&& soldier_list.get(i).getSoldier_e_vacation() != null) {
					soldier_list.get(i)
							.setSoldier_s_vacation1(date.format(soldier_list.get(i).getSoldier_s_vacation()));
					soldier_list.get(i)
							.setSoldier_e_vacation1(date.format(soldier_list.get(i).getSoldier_e_vacation()));
				} else {
					soldier_list.get(i).setSoldier_vacation("none");
					soldier_list.get(i).setSoldier_s_vacation1("x");
					soldier_list.get(i).setSoldier_e_vacation1("x");
				}

			}
			mav.addObject("part_flag", arr1);
			mav.addObject("soldier_list", soldier_list);
		}

		else if (arr1.equals("manager_cadre")) {
			List<CadreDTO> cadre_list = cadreDAO.selectByKey_vacation_cadreUser_table(map2);

			for (int i = 0; i < cadre_list.size(); i++) {

				if (cadre_list.get(i).getCadre_s_vacation() != null
						&& cadre_list.get(i).getCadre_e_vacation() != null) {

					cadre_list.get(i).setCadre_s_vacation1(date.format(cadre_list.get(i).getCadre_s_vacation()));
					cadre_list.get(i).setCadre_e_vacation1(date.format(cadre_list.get(i).getCadre_e_vacation()));

				} else {
					cadre_list.get(i).setCadre_vacation("none");
					cadre_list.get(i).setCadre_s_vacation1("x");
					cadre_list.get(i).setCadre_e_vacation1("x");
				}

			}

			mav.addObject("part_flag", arr1);
			mav.addObject("cadre_list", cadre_list);
		}

		List<Vacation_ReceiptDTO> vacation_list = receiptDAO.selectCalendar(cadre_dto.getCadre_group());

		for (int i = 0; i < vacation_list.size(); i++) {

			vacation_list.get(i).setVacation_name(vacation_list.get(i).getVacation_name() + "("
					+ vacation_list.get(i).getVacation_mmr() + ") /" + vacation_list.get(i).getVacation_group());
			vacation_list.get(i).setVacation_start1(date.format(vacation_list.get(i).getVacation_start()));
			vacation_list.get(i).setVacation_end1(date.format(vacation_list.get(i).getVacation_end()));

		}

		JSONArray jsonArray = JSONArray.fromObject(vacation_list);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", jsonArray);

		JSONObject jsonObect = JSONObject.fromObject(map);

		mav.addObject("jsonObject", jsonObect);

		int soldier_count = receiptDAO.getCount_soldier(cadre_dto.getCadre_group());
		int cadre_count = receiptDAO.getCount_cadre(cadre_dto.getCadre_group());
		int total_count = soldier_count + cadre_count;
		int receipt_count = receiptDAO.getCount_receipt(cadre_dto.getCadre_group());
		//결제 중인지 결제 승인 됬는지 결제 취소됬는지 구하는 부분
		int v_ing = receiptDAO.getVacationProcessCount(cadre_dto.getCadre_group()); 
		int v_agree = receiptDAO.getVacationAgreeCount(cadre_dto.getCadre_group());
		int v_disagree = receiptDAO.getVacationDisAgreelCount(cadre_dto.getCadre_group());
		
		//각 중대 휴가 신청 여부
		int center_v_count = receiptDAO.getCenterVacationCount();
		int squad1_v_count = receiptDAO.getSquad1VacationCount();
		int squad2_v_count = receiptDAO.getSquad2VacationCount();
		int squad3_v_count = receiptDAO.getSquad3VacationCount();
		mav.addObject("center_v_count", center_v_count);
		mav.addObject("squad1_v_count", squad1_v_count);
		mav.addObject("squad2_v_count", squad2_v_count);
		mav.addObject("squad3_v_count", squad3_v_count);
		mav.addObject("fullcal", fullcal);
		mav.addObject("v_ing", v_ing);
		mav.addObject("v_agree", v_agree);
		mav.addObject("v_disagree", v_disagree);
		mav.addObject("soldier_count", soldier_count);
		mav.addObject("cadre_count", cadre_count);
		mav.addObject("total_count", total_count);
		mav.addObject("receipt_count", receipt_count);
		mav.setViewName("cadre_manager/vacation_Apply");
		return mav;

	}

	@RequestMapping("/vacation_apply_Bymodal.do")
	public void vacation_apply_Bymodal(HttpServletRequest request, HttpServletResponse response, Model model)
			throws Exception {
		ModelAndView mav = new ModelAndView();
		SimpleDateFormat date = new SimpleDateFormat("yyyy/MM/dd");
		String vacation_number = request.getParameter("vacation_number");
		String vacation_name = request.getParameter("vacation_name");
		String vacation_mmr = request.getParameter("vacation_mmr");
		String vacation_group = request.getParameter("vacation_group");
		String vacation_kind = request.getParameter("vacation_kind");
		String vacation_start = request.getParameter("vacation_start");
		String vacation_end = request.getParameter("vacation_end");

		Map<String, String> map = new HashMap<String, String>();

		map.put("vacation_number", vacation_number);
		map.put("vacation_name", vacation_name);
		map.put("vacation_mmr", vacation_mmr);
		map.put("vacation_group", vacation_group);
		map.put("vacation_kind", vacation_kind);
		map.put("vacation_start", vacation_start);
		map.put("vacation_end", vacation_end);

		receiptDAO.insert_vacation(map);

		List<Vacation_ReceiptDTO> vacation_list = receiptDAO.selectCalendar(vacation_group);
		for (int i = 0; i < vacation_list.size(); i++) {
			vacation_list.get(i).setVacation_name(vacation_list.get(i).getVacation_name() + "("
					+ vacation_list.get(i).getVacation_mmr() + ") /" + vacation_list.get(i).getVacation_group());
			vacation_list.get(i).setVacation_start1(date.format(vacation_list.get(i).getVacation_start()));
			vacation_list.get(i).setVacation_end1(date.format(vacation_list.get(i).getVacation_end()));
		}
		JSONArray jsonArray = JSONArray.fromObject(vacation_list);

		Map<String, Object> vacation_map = new HashMap<String, Object>();
		vacation_map.put("list", jsonArray);
		JSONObject jsonObect = JSONObject.fromObject(vacation_map);
		model.addAttribute("jsonObject", jsonObect);
		response.getWriter().write("0");
	}
	//=========================================================================================================================================================
	@RequestMapping("/reset_vacation_apply.do")
	public ModelAndView reset_vacation_apply(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		String vacation_number = request.getParameter("vacation_number");
		receiptDAO.reset_vacation_apply(vacation_number);
		mav.setViewName("redirect:soldierOutSide.do");
		return mav;
	}

	@RequestMapping("/vacation_apply_toCaptain.do")
	public void vacation_apply_toCaptain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String cadre_group = request.getParameter("cadre_group");
		receiptDAO.vacation_apply_toCaptain(cadre_group);
		response.getWriter().write("0");
	}

	@RequestMapping("/vacation_SignForm.do")
	public ModelAndView vacation_SignForm() throws Exception {
		ModelAndView mav = new ModelAndView();
		int center_v_count = receiptDAO.getCenterVacationCount();
		int squad1_v_count = receiptDAO.getSquad1VacationCount();
		int squad2_v_count = receiptDAO.getSquad2VacationCount();
		int squad3_v_count = receiptDAO.getSquad3VacationCount();
		mav.addObject("center_v_count", center_v_count);
		mav.addObject("squad1_v_count", squad1_v_count);
		mav.addObject("squad2_v_count", squad2_v_count);
		mav.addObject("squad3_v_count", squad3_v_count);
		mav.addObject("listcount", 0);
		mav.setViewName("cadre_manager/vacation_Sign");
		return mav; //그냥 이동
	}

	@RequestMapping("/search_vacation_Sign.do")
	public ModelAndView search_vacation_Sign(HttpServletRequest request) throws Exception {

		ModelAndView mav = new ModelAndView();
		SimpleDateFormat date = new SimpleDateFormat("yyyy/MM/dd");
		String vacation_group = request.getParameter("m_search_table");
		List<Vacation_ReceiptDTO> list = receiptDAO.selectCalendar_Sign(vacation_group);
		for (int i = 0; i < list.size(); i++) {

			list.get(i).setVacation_name(list.get(i).getVacation_name() + "(" + list.get(i).getVacation_mmr() + ") /"
					+ list.get(i).getVacation_group());
			list.get(i).setVacation_start1(date.format(list.get(i).getVacation_start()));
			list.get(i).setVacation_end1(date.format(list.get(i).getVacation_end()));
		}

		JSONArray jsonArray = JSONArray.fromObject(list);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", jsonArray);
		JSONObject jsonObect = JSONObject.fromObject(map);
		
		int center_v_count = receiptDAO.getCenterVacationCount();
		int squad1_v_count = receiptDAO.getSquad1VacationCount();
		int squad2_v_count = receiptDAO.getSquad2VacationCount();
		int squad3_v_count = receiptDAO.getSquad3VacationCount();
		mav.addObject("center_v_count", center_v_count);
		mav.addObject("squad1_v_count", squad1_v_count);
		mav.addObject("squad2_v_count", squad2_v_count);
		mav.addObject("squad3_v_count", squad3_v_count);
		mav.addObject("jsonObject", jsonObect);
		mav.addObject("list", list);
		mav.addObject("vacation_group", vacation_group);
		mav.addObject("listcount", list.size());

		mav.setViewName("cadre_manager/vacation_Sign");

		return mav; //중대 휴가 검색

	}

	@RequestMapping("/vacation_success.do")
	public ModelAndView vacation_success(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		SimpleDateFormat date = new SimpleDateFormat("yyyy/MM/dd");
		String vacation_group = request.getParameter("vacation_group");
		List<Vacation_ReceiptDTO> list = receiptDAO.Sign_success_1(vacation_group);

		for (int i = 0; i < list.size(); i++) {

			Map<String, String> map = new HashMap<String, String>();

			list.get(i).setVacation_start1(date.format(list.get(i).getVacation_start()));
			list.get(i).setVacation_end1(date.format(list.get(i).getVacation_end()));
			
			System.out.println(list.get(i).getVacation_kind());
			map.put("vacation_number", list.get(i).getVacation_number());
			map.put("vacation_group", list.get(i).getVacation_group());
			map.put("vacation_kind", list.get(i).getVacation_kind());
			map.put("vacation_start", list.get(i).getVacation_start1());
			map.put("vacation_end", list.get(i).getVacation_end1());
			map.put("vacation_name", list.get(i).getVacation_name());
			receiptDAO.Sign_success_2(map);

		}

		mav.setViewName("redirect:vacation_SignForm.do");

		return mav;
	} //과장이 승인 했을 때

	@RequestMapping("/vacation_refuse.do")
	public ModelAndView vacation_refuse(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		String vacation_group = request.getParameter("vacation_group");
		receiptDAO.Sign_refuse(vacation_group);
		mav.setViewName("redirect:vacation_SignForm.do");
		return mav;
	}

	@RequestMapping("/ok_bySergeant.do")
	public ModelAndView ok_bySergeant(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		String vacation_group = request.getParameter("vacation_group");
		receiptDAO.ok_bySergeant(vacation_group);
		mav.setViewName("cadre_manager/vacation_calendar");
		return mav;

	} //장바구니 날린다고ㅅㅂ

	@RequestMapping("/reset_bySergeant.do")
	public ModelAndView reset_bySergeant(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		String vacation_group = request.getParameter("vacation_group");
		receiptDAO.reset_bySergeant(vacation_group);
		mav.setViewName("cadre_manager/vacation_calendar");
		return mav;

	} //거절 후 확인 주를 때 애들 싹다 플래그 0으로 바꿔줌-------------------------------------------------------------------------------------------------------- 내일 분량

	@RequestMapping("/Vacation_Calendar.do")
	public ModelAndView Vacation_CalendarForm() throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("cadre_manager/vacation_calendar");
		
		return mav;
	}

	@RequestMapping("/Vacation_Calendar_result.do")
	public ModelAndView Vacation_Calendar(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		Calendar calendar = new GregorianCalendar(Locale.KOREA);
		int nYear = calendar.get(Calendar.YEAR);
		int nMonth = calendar.get(Calendar.MONTH) + 1 +1;
		String fullcal = nYear + "-" + nMonth;

		SimpleDateFormat date = new SimpleDateFormat("yyyy/MM/dd");

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String user = authentication.getName();

		CadreDTO user1 = cadreDAO.findInfoByNum(user);
		String cadre_group = user1.getCadre_group();

		String arr1 = request.getParameter("m_search_table");

		if (arr1.equals("manager_soldier")) {

			List<Manager_SoldierDTO> list = soldierDAO.select_Complete_Soldier_Vacation(cadre_group);

			for (int i = 0; i < list.size(); i++) {

				list.get(i).setSoldier_name(list.get(i).getSoldier_name() + "(" + list.get(i).getSoldier_mmr() + ") /"
						+ list.get(i).getSoldier_vacation());
				list.get(i).setSoldier_s_vacation1(date.format(list.get(i).getSoldier_s_vacation()));
				list.get(i).setSoldier_e_vacation1(date.format(list.get(i).getSoldier_e_vacation()));
			}
			JSONArray jsonArray = JSONArray.fromObject(list);

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("list", jsonArray);

			JSONObject jsonObect = JSONObject.fromObject(map);

			
			mav.addObject("jsonObject", jsonObect);
			mav.addObject("list", list);

		}

		else if (arr1.equals("manager_cadre")) {
			List<CadreDTO> list = cadreDAO.select_Complete_Cadre_Vacation(cadre_group);

			for (int i = 0; i < list.size(); i++) {
				list.get(i).setCadre_name(list.get(i).getCadre_name() + "(" + list.get(i).getCadre_mmr() + ") /"
						+ list.get(i).getCadre_vacation());
				list.get(i).setCadre_s_vacation1(date.format(list.get(i).getCadre_s_vacation()));
				list.get(i).setCadre_e_vacation1(date.format(list.get(i).getCadre_e_vacation()));

			}
			JSONArray jsonArray = JSONArray.fromObject(list);

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("list", jsonArray);

			JSONObject jsonObect = JSONObject.fromObject(map);

			mav.addObject("jsonObject", jsonObect);
			mav.addObject("list", list);

		}

		mav.addObject("fullcal", fullcal);
		mav.addObject("part", arr1);
		mav.addObject("cadre_group", cadre_group);
		mav.setViewName("cadre_manager/vacation_calendar");

		return mav;
	}
	
	@RequestMapping("select_vacation_for_Radio.do")
	public ModelAndView select_vacation_for_Radio(HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView();
		
		String radio_select = request.getParameter("m_search_table");
		
		if(radio_select.equals("soldier")) {
			mav.setViewName("redirect:vaction_soldierList.do");
		}
		else if(radio_select.equals("cadre")) {
			mav.setViewName("redirect:vaction_cadreList.do");
		}
		
		return mav;
	}
	
	@RequestMapping("/vaction_soldierList.do")
	   public ModelAndView vaction_soldierList() throws Exception{
	      ModelAndView mav = new ModelAndView();
	      
	      Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	      String user = authentication.getName();

	      CadreDTO user1 = cadreDAO.findInfoByNum(user);
	      String cadre_group = user1.getCadre_group();
	      SimpleDateFormat date  = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
	       
	      String compareVal = "N";
	      Date currentTime = new Date();
	      String oTime = date.format ( currentTime ); //�쁽�옱�떆媛� (String)
	      
	      List<Manager_SoldierDTO> list = soldierDAO.getSoldier_vacationMember(cadre_group);
	      List<Vacation_ReceiptDTO> list2 = receiptDAO.selectCalendar(cadre_group);
	      
	      for(int i = 0; i< list.size(); i++) {
	    	 
	         if(list.get(i).getSoldier_v_flag().equals("2")) {
	          
	            int compare = oTime.compareTo(date.format(list.get(i).getSoldier_s_vacation())); // �궇吏쒕퉬援�

	            if ( compare > 0 ){

	            compareVal = "start_after";

	            } else if ( compare < 0) {

	            compareVal = "start_before";

	       
	            } else {

	            compareVal = "start_now";

	           

	            }
	            list.get(i).setSolider_current_vacation(compareVal);
	         }
	         
	         else if(list.get(i).getSoldier_v_flag().equals("3")) {
	        	 
		            int compare = oTime.compareTo(date.format(list.get(i).getSoldier_e_vacation())); // �궇吏쒕퉬援�

		            if ( compare > 0 ){ 

		            compareVal = "end_after";

		            } else if ( compare < 0) { 

		            compareVal = "end_before";

		            } else { 

		            compareVal = "end_now";

		            }
		            list.get(i).setSolider_current_vacation(compareVal);
	         }
	      }
	      if(list2.isEmpty()) {
	    	  
	    	  mav.addObject("list", list);
	      }
	      mav.addObject("part", 1);
	      mav.setViewName("cadre_manager/soldier_vacation_list");
	      return mav;
	   }
	
	@RequestMapping("/vaction_cadreList.do")
	   public ModelAndView vaction_cadreList() throws Exception{
	      ModelAndView mav = new ModelAndView();
	      
	      Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	      String user = authentication.getName();

	      CadreDTO user1 = cadreDAO.findInfoByNum(user);
	      String cadre_group = user1.getCadre_group();
	      SimpleDateFormat date  = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
	       
	      String compareVal = "N";
	      Date currentTime = new Date();
	      String oTime = date.format ( currentTime );
	      
	     
	      List<CadreDTO> list = cadreDAO.getCadre_vacationMember(cadre_group);
	      List<Vacation_ReceiptDTO> list2 = receiptDAO.selectCalendar(cadre_group);
	      
	      for(int i = 0; i< list.size(); i++) {
	    	 
	         if(list.get(i).getCadre_v_flag().equals("2")) {
	           
	            int compare = oTime.compareTo(date.format(list.get(i).getCadre_s_vacation())); // �궇吏쒕퉬援�

	            if ( compare > 0 ){ 
	        
	            compareVal = "start_after";

	            } else if ( compare < 0) {
	            compareVal = "start_before";

	      
	            } else { 

	            compareVal = "start_now";
	            
	            }
	            list.get(i).setCadre_current_vacation(compareVal);
	         }
	         
	         else if(list.get(i).getCadre_v_flag().equals("3")) {
	        	 
		            int compare = oTime.compareTo(date.format(list.get(i).getCadre_e_vacation())); // �궇吏쒕퉬援�

		            if ( compare > 0 ){ 

		            compareVal = "end_after";

		            } else if ( compare < 0) { 

		            compareVal = "end_before";

		            } else { 

		            compareVal = "end_now";

		            }
		            list.get(i).setCadre_current_vacation(compareVal);
	         }
	      }
	      if(list2.isEmpty()) {
	    	  
	    	  mav.addObject("list", list);
	      }
	      mav.addObject("part", 2);
	      mav.setViewName("cadre_manager/soldier_vacation_list");
	      return mav;
	   }
	
	
	@RequestMapping("soldier_vacation_start.do")
	public ModelAndView soldier_vacation_start(HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView();
		
		String soldier_number = request.getParameter("soldier_number");
		
		soldierDAO.soldier_vacation_start(soldier_number);
		
		mav.setViewName("redirect:vaction_soldierList.do");
		
		return mav;
	}
	
	@RequestMapping("soldier_vacation_end.do")
	public ModelAndView soldier_vacation_end(HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView();
		
		String soldier_number = request.getParameter("soldier_number");
		
		Manager_SoldierDTO soldier_obj  =  soldierDAO.getSoldierInfo(soldier_number);
		
		soldierDAO.soldier_vacation_end(soldier_obj);
		
		mav.setViewName("redirect:vaction_soldierList.do");
		
		return mav;
	}
	
	@RequestMapping("cadre_vacation_start.do")
	public ModelAndView cadre_vacation_start(HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView();
		
		String cadre_number = request.getParameter("cadre_number");
		
		cadreDAO.cadre_vacation_start(cadre_number);
		
		mav.setViewName("redirect:vaction_cadreList.do");
		
		return mav;
	}
	
	@RequestMapping("cadre_vacation_end.do")
	public ModelAndView cadre_vacation_end(HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView();
		
		String cadre_number = request.getParameter("cadre_number");
		
		CadreDTO user = cadreDAO.findInfoByNum(cadre_number);
		
		cadreDAO.cadre_vacation_end(user);
		
		mav.setViewName("redirect:vaction_cadreList.do");
		
		return mav;
	}
	
	@RequestMapping("Total_vacation.do")
	public ModelAndView last_vacation_list() throws Exception{
		ModelAndView mav = new ModelAndView();
		
		SimpleDateFormat date = new SimpleDateFormat("yyyy/MM/dd");
		int nYear;
		int nMonth;
		
		Calendar calendar = new GregorianCalendar(Locale.KOREA);
		nYear = calendar.get(Calendar.YEAR);
		nMonth = calendar.get(Calendar.MONTH) + 1 +1;
		String fullcal = nYear + "-" + nMonth;
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String user = authentication.getName();

		CadreDTO user1 = cadreDAO.findInfoByNum(user);
		String cadre_group = user1.getCadre_group();
		
		List<Vacation_ReceiptDTO> list = receiptDAO.select_backup(cadre_group);
		
		for (int i = 0; i < list.size(); i++) {

			list.get(i).setVacation_name(list.get(i).getVacation_name() + "(" + list.get(i).getVacation_mmr() + ") /"
					+ list.get(i).getVacation_group());
			list.get(i).setVacation_start1(date.format(list.get(i).getVacation_start()));
			list.get(i).setVacation_end1(date.format(list.get(i).getVacation_end()));
		}

		JSONArray jsonArray = JSONArray.fromObject(list);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", jsonArray);

		JSONObject jsonObect = JSONObject.fromObject(map);

		mav.addObject("jsonObject", jsonObect);
		mav.addObject("list", list);
			
		mav.addObject("fullcal", fullcal);
		mav.addObject("cadre_group", cadre_group); 
		mav.setViewName("cadre_manager/Total_vacation_calendar");
		
		return mav;
	}
	
	@RequestMapping("sergeant_Total_gragh.do")
	public ModelAndView vacation_Total() throws Exception{
		ModelAndView mav = new ModelAndView();
		
		SimpleDateFormat date = new SimpleDateFormat ( "yyyy/MM/dd", Locale.KOREA ); 
		Date currentTime = new Date (); 
		String dTime = date.format ( currentTime ); 
		

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String user = authentication.getName();
		
		CadreDTO user1 = cadreDAO.findInfoByNum(user);
		String cadre_group =user1.getCadre_group();
		
		int count_by_normal = 0; // 신병, 1차, 2차, 3차 정기휴가 카운트
		int count_by_sunday = 0; // 외박
		int count_by_hospital = 0; // 입실
		int count_by_away = 0; // 파견
		int count_by_now_soldier = 0; 
		
		int soldier_Count = receiptDAO.getCount_soldier(cadre_group);
		int cadre_Count = receiptDAO.getCount_cadre(cadre_group); 
		int total_Count = soldier_Count + cadre_Count; // 현재 부대 병사 + 간부 총원
		
		List<Manager_SoldierDTO> list = soldierDAO.getSelect_vaction(cadre_group); // 현재 출타중인 병사들
		List<CadreDTO> list_c = cadreDAO.getSelect_vacation(cadre_group);
		
		if(list.size() != 0) 
		{
			for(int i=0; i <list.size(); i++) {
			
				if(list.get(i).getSoldier_vacation().equals("신병") || list.get(i).getSoldier_vacation().equals("1차")
						|| list.get(i).getSoldier_vacation().equals("2차") || list.get(i).getSoldier_vacation().equals("3차") || list.get(i).getSoldier_vacation().equals("포상")) 
				{
					count_by_normal++;
				}
				else if(list.get(i).getSoldier_vacation().equals("외박") || list.get(i).getSoldier_vacation().equals("외출"))
				{
					count_by_sunday++;
				}
				else if(list.get(i).getSoldier_vacation().equals("입실") )
				{
					count_by_hospital++;
				}
				else if(list.get(i).getSoldier_vacation().equals("파견") )
				{
					count_by_away++;
				}
			}
		}
		
		if(list_c.size() != 0) 
		{
			for(int i=0; i <list_c.size(); i++) {
			
				if(list_c.get(i).getCadre_vacation().equals("신병") || list_c.get(i).getCadre_vacation().equals("1차")
						|| list_c.get(i).getCadre_vacation().equals("2차") || list_c.get(i).getCadre_vacation().equals("3차") || 
						list_c.get(i).getCadre_vacation().equals("포상")) 
				{
					count_by_normal++;
				}
				else if(list_c.get(i).getCadre_vacation().equals("외박") || list_c.get(i).getCadre_vacation().equals("외출"))
				{
					
					count_by_sunday++;
				}
				else if(list_c.get(i).getCadre_vacation().equals("입실") )
				{
					count_by_hospital++;
				}
				else if(list_c.get(i).getCadre_vacation().equals("파견") )
				{
					count_by_away++;
				}
			}
			
		}
		
		mav.addObject("dTime", dTime);
		mav.addObject("cadre_group", cadre_group);
		mav.addObject("total_Count", total_Count);
		mav.addObject("count_by_normal", count_by_normal);
		mav.addObject("count_by_sunday", count_by_sunday);
		mav.addObject("count_by_hospital", count_by_hospital);
		mav.addObject("count_by_away", count_by_away);
		mav.addObject("count_by_now", total_Count - (list.size() + list_c.size()));
		
		mav.setViewName("cadre_manager/cadreState");
		return mav;
	}
	
	@RequestMapping("captain_Total_gragh.do")
	   public ModelAndView captain_Total_gragh() throws Exception{
	      ModelAndView mav = new ModelAndView();
	      
	       int center_total_Count =0; // 본부중대 인원
	        int center_out_Count = 0; //본부중대 출타 인원
	         int center_count_by_normal = 0;
	         int center_count_by_sunday =0;
	         int center_count_by_hospital = 0;
	         int center_count_by_away =0;
	         
	         int one_total_Count =0; // 1중대 인원
	         int one_out_Count = 0; //1중대 출타 인원
	         int one_count_by_normal = 0;
	         int one_count_by_sunday =0;
	         int one_count_by_hospital = 0;
	         int one_count_by_away =0;
	         
	         int two_total_Count =0; // 2중대 인원
	         int two_out_Count = 0; //2중대 출타 인원
	         int two_count_by_normal = 0;
	         int two_count_by_sunday =0;
	         int two_count_by_hospital = 0;
	         int two_count_by_away =0;
	         
	         int three_total_Count =0; // 3중대 인원
	         int three_out_Count = 0; //3중대 출타 인원
	         int three_count_by_normal = 0;
	         int three_count_by_sunday =0;
	         int three_count_by_hospital = 0;
	         int three_count_by_away =0;
	         
	         int All_out_Count = 0; // 총 출타자 (대대 / 해당중대로 나뉠수 있음)
	      
	      List<Manager_SoldierDTO> list = soldierDAO.getAllSoldierList();
	      List<CadreDTO> list_c = cadreDAO.getAllCadre();
	      
	      for(int i= 0; i < list.size(); i++) {
	         
	         if(list.get(i).getSoldier_group().equals("본부중대")) {
	            center_total_Count++;
	         }
	         else if(list.get(i).getSoldier_group().equals("1중대")) {
	            one_total_Count++;
	         }
	         else if(list.get(i).getSoldier_group().equals("2중대")) {
	            two_total_Count++;
	         }
	         else if(list.get(i).getSoldier_group().equals("3중대")) {
	            three_total_Count++;
	         }
	         
	         
	      }
	      
	      for(int i= 0; i < list_c.size(); i++) {
	         if(list_c.get(i).getCadre_group().equals("본부중대")) {
	            center_total_Count++;
	         }
	         else if(list_c.get(i).getCadre_group().equals("1중대")) {
	            one_total_Count++;
	         }
	         else if(list_c.get(i).getCadre_group().equals("2중대")) {
	            two_total_Count++;
	         }
	         else if(list_c.get(i).getCadre_group().equals("3중대")) {
	            three_total_Count++;
	         }
	      }
	      
	      
	         
	      int All_total_Count = list.size() + list_c.size(); // 현재 부대 병사 + 간부 총원
	       
	      List<Manager_SoldierDTO> list_outer = soldierDAO.getOuterSoldier();
	      List<CadreDTO> list_c_outer = cadreDAO.getOuterCadre();
	      
	      for(int i= 0; i < list_outer.size(); i++) {
	         
	       if(list_outer.get(i).getSoldier_group().equals("본부중대")) {
	            
	            center_out_Count++;
	         
	            if(list_outer.get(i).getSoldier_vacation().equals("신병") || list_outer.get(i).getSoldier_vacation().equals("1차")
	               || list_outer.get(i).getSoldier_vacation().equals("2차") || list_outer.get(i).getSoldier_vacation().equals("3차") || list_outer.get(i).getSoldier_vacation().equals("포상")) 
	         {
	            center_count_by_normal++;
	         }
	         else if(list_outer.get(i).getSoldier_vacation().equals("외박") || list_outer.get(i).getSoldier_vacation().equals("외출"))
	         {
	            center_count_by_sunday++;
	         }
	         else if(list_outer.get(i).getSoldier_vacation().equals("입실") )
	         {
	            center_count_by_hospital++;
	         }
	         else if(list_outer.get(i).getSoldier_vacation().equals("파견") )
	         {
	            center_count_by_away++;
	         }
	      }
	      
	      else if(list_outer.get(i).getSoldier_group().equals("1중대")) {
	         
	            one_out_Count++;
	         
	            if(list_outer.get(i).getSoldier_vacation().equals("신병") || list_outer.get(i).getSoldier_vacation().equals("1차")
	               || list_outer.get(i).getSoldier_vacation().equals("2차") || list_outer.get(i).getSoldier_vacation().equals("3차") || list_outer.get(i).getSoldier_vacation().equals("포상")) 
	         {
	            one_count_by_normal++;
	         }
	         else if(list_outer.get(i).getSoldier_vacation().equals("외박") || list_outer.get(i).getSoldier_vacation().equals("외출"))
	         {
	            one_count_by_sunday++;
	         }
	         else if(list_outer.get(i).getSoldier_vacation().equals("입실") )
	         {
	            one_count_by_hospital++;
	         }
	         else if(list_outer.get(i).getSoldier_vacation().equals("파견") )
	         {
	            one_count_by_away++;
	         }
	      }
	      
	      else if(list_outer.get(i).getSoldier_group().equals("2중대")) {
	         
	            two_out_Count++;
	         
	            if(list_outer.get(i).getSoldier_vacation().equals("신병") || list_outer.get(i).getSoldier_vacation().equals("1차")
	               || list_outer.get(i).getSoldier_vacation().equals("2차") || list_outer.get(i).getSoldier_vacation().equals("3차") || list_outer.get(i).getSoldier_vacation().equals("포상")) 
	         {
	               two_count_by_normal++;
	         }
	         else if(list_outer.get(i).getSoldier_vacation().equals("외박") || list_outer.get(i).getSoldier_vacation().equals("외출"))
	         {
	            two_count_by_sunday++;
	         }
	         else if(list_outer.get(i).getSoldier_vacation().equals("입실") )
	         {
	            two_count_by_hospital++;
	         }
	         else if(list_outer.get(i).getSoldier_vacation().equals("파견") )
	         {
	            two_count_by_away++;
	         }
	      }
	      
	      else if(list_outer.get(i).getSoldier_group().equals("3중대")) {
	         
	            three_out_Count++;
	         
	            if(list_outer.get(i).getSoldier_vacation().equals("신병") || list_outer.get(i).getSoldier_vacation().equals("1차")
	               || list_outer.get(i).getSoldier_vacation().equals("2차") || list_outer.get(i).getSoldier_vacation().equals("3차") || list_outer.get(i).getSoldier_vacation().equals("포상")) 
	         {
	               three_count_by_normal++;
	         }
	         else if(list_outer.get(i).getSoldier_vacation().equals("외박") || list_outer.get(i).getSoldier_vacation().equals("외출"))
	         {
	            three_count_by_sunday++;
	         }
	         else if(list_outer.get(i).getSoldier_vacation().equals("입실") )
	         {
	            three_count_by_hospital++;
	         }
	         else if(list_outer.get(i).getSoldier_vacation().equals("파견") )
	         {
	            three_count_by_away++;
	         }
	      }
	   }
	   
	      for(int i= 0; i < list_c_outer.size(); i++) {
	          if(list_c_outer.get(i).getCadre_group().equals("본부중대")) {
	               
	               center_out_Count++;
	            
	               if(list_c_outer.get(i).getCadre_vacation().equals("신병") || list_c_outer.get(i).getCadre_vacation().equals("1차")
	                  || list_c_outer.get(i).getCadre_vacation().equals("2차") || list_c_outer.get(i).getCadre_vacation().equals("3차") || list_c_outer.get(i).getCadre_vacation().equals("포상")) 
	            {
	               center_count_by_normal++;
	            }
	            else if(list_c_outer.get(i).getCadre_vacation().equals("외박") || list_c_outer.get(i).getCadre_vacation().equals("외출"))
	            {
	               center_count_by_sunday++;
	            }
	            else if(list_c_outer.get(i).getCadre_vacation().equals("입실") )
	            {
	               center_count_by_hospital++;
	            }
	            else if(list_c_outer.get(i).getCadre_vacation().equals("파견") )
	            {
	               center_count_by_away++;
	            }
	         }
	         
	         else if(list_c_outer.get(i).getCadre_group().equals("1중대")) {
	            
	               one_out_Count++;
	            
	               if(list_c_outer.get(i).getCadre_vacation().equals("신병") || list_c_outer.get(i).getCadre_vacation().equals("1차")
	                  || list_c_outer.get(i).getCadre_vacation().equals("2차") || list_c_outer.get(i).getCadre_vacation().equals("3차") || list_c_outer.get(i).getCadre_vacation().equals("포상")) 
	            {
	               one_count_by_normal++;
	            }
	            else if(list_c_outer.get(i).getCadre_vacation().equals("외박") || list_c_outer.get(i).getCadre_vacation().equals("외출"))
	            {
	               one_count_by_sunday++;
	            }
	            else if(list_c_outer.get(i).getCadre_vacation().equals("입실") )
	            {
	               one_count_by_hospital++;
	            }
	            else if(list_c_outer.get(i).getCadre_vacation().equals("파견") )
	            {
	               one_count_by_away++;
	            }
	         }
	         
	         else if(list_c_outer.get(i).getCadre_group().equals("2중대")) {
	            
	               two_out_Count++;
	            
	               if(list_c_outer.get(i).getCadre_vacation().equals("신병") || list_c_outer.get(i).getCadre_vacation().equals("1차")
	                  || list_c_outer.get(i).getCadre_vacation().equals("2차") || list_c_outer.get(i).getCadre_vacation().equals("3차") || list_c_outer.get(i).getCadre_vacation().equals("포상")) 
	            {
	                  two_count_by_normal++;
	            }
	            else if(list_c_outer.get(i).getCadre_vacation().equals("외박") || list_c_outer.get(i).getCadre_vacation().equals("외출"))
	            {
	               two_count_by_sunday++;
	            }
	            else if(list_c_outer.get(i).getCadre_vacation().equals("입실") )
	            {
	               two_count_by_hospital++;
	            }
	            else if(list_c_outer.get(i).getCadre_vacation().equals("파견") )
	            {
	               two_count_by_away++;
	            }
	         }
	         
	         else if(list_c_outer.get(i).getCadre_group().equals("3중대")) {
	            
	               three_out_Count++;
	            
	               if(list_c_outer.get(i).getCadre_vacation().equals("신병") || list_c_outer.get(i).getCadre_vacation().equals("1차")
	                  || list_c_outer.get(i).getCadre_vacation().equals("2차") || list_c_outer.get(i).getCadre_vacation().equals("3차") || list_c_outer.get(i).getCadre_vacation().equals("포상")) 
	            {
	                  three_count_by_normal++;
	            }
	            else if(list_c_outer.get(i).getCadre_vacation().equals("외박") || list_c_outer.get(i).getCadre_vacation().equals("외출"))
	            {
	               three_count_by_sunday++;
	            }
	            else if(list_c_outer.get(i).getCadre_vacation().equals("입실") )
	            {
	               three_count_by_hospital++;
	            }
	            else if(list_c_outer.get(i).getCadre_vacation().equals("파견") )
	            {
	               three_count_by_away++;
	            }
	         }
	      }
	      All_out_Count = center_out_Count + one_out_Count + two_out_Count + three_out_Count;
	      
	     
	      mav.addObject("All_total_Count", All_total_Count);
	      mav.addObject("All_out_Count", All_out_Count);
	      
	      mav.addObject("center_total_Count", center_total_Count);
	      mav.addObject("center_out_Count", center_out_Count);
	      mav.addObject("center_count_by_normal", center_count_by_normal);
	      mav.addObject("center_count_by_sunday", center_count_by_sunday);
	      mav.addObject("center_count_by_hospital", center_count_by_hospital);
	      mav.addObject("center_count_by_away", center_count_by_away);
	      
	      mav.addObject("one_total_Count", one_total_Count);
	      mav.addObject("one_out_Count", one_out_Count);
	      mav.addObject("one_count_by_normal", one_count_by_normal);
	      mav.addObject("one_count_by_sunday", one_count_by_sunday);
	      mav.addObject("one_count_by_hospital", one_count_by_hospital);
	      mav.addObject("one_count_by_away", one_count_by_away);
	      
	      mav.addObject("two_total_Count", two_total_Count);
	      mav.addObject("two_out_Count", two_out_Count);
	      mav.addObject("two_count_by_normal", two_count_by_normal);
	      mav.addObject("two_count_by_sunday", two_count_by_sunday);
	      mav.addObject("two_count_by_hospital", two_count_by_hospital);
	      mav.addObject("two_count_by_away", two_count_by_away);
	      
	      mav.addObject("three_total_Count", three_total_Count);
	      mav.addObject("three_out_Count", three_out_Count);
	      mav.addObject("three_count_by_normal", three_count_by_normal);
	      mav.addObject("three_count_by_sunday", three_count_by_sunday);
	      mav.addObject("three_count_by_hospital", three_count_by_hospital);
	      mav.addObject("three_count_by_away", three_count_by_away);
	     
	      
	      mav.setViewName("cadre_manager/corp_cadreState");

	      return mav;
	      
	   }
}
