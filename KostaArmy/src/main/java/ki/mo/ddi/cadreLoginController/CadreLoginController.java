package ki.mo.ddi.cadreLoginController;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import ki.mo.ddi.cadreModel.CadreDAO;
import ki.mo.ddi.cadreModel.CadreDTO;
import ki.mo.ddi.commuteModel.Cadre_CommuteListDAO;
import ki.mo.ddi.commuteModel.Cadre_CommuteListDTO;
import ki.mo.ddi.commuteModel.Cadre_PayListDAO;
import ki.mo.ddi.commuteModel.Cadre_PayListDTO;
import ki.mo.ddi.managerModel.Manager_SoldierDAO;
import ki.mo.ddi.managerModel.Manager_SoldierDTO;
import ki.mo.ddi.managerModel.Vacation_ReceiptDAO;
import ki.mo.ddi.noticeModel.MnoticeDTO;

@Controller
public class CadreLoginController {
	@Resource
	private CadreDAO cadreDAO;
	
	@Resource
	private Cadre_CommuteListDAO cadre_CommuteListDAO;
	
	@Resource
	private Cadre_PayListDAO cadre_PayListDAO;
	
	@Resource
	private Manager_SoldierDAO soldierDAO;
	
	@Resource
	private Vacation_ReceiptDAO receiptDAO;
   
   @RequestMapping("/CadreLogin.do")
   public String getAllCadre(Model model) throws ParseException {
	   Timestamp current_day = new Timestamp(System.currentTimeMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String current_date = current_day.toString().split(" ")[0];
		int year = Integer.parseInt(current_date.split("-")[0]);
		int month = Integer.parseInt(current_date.split("-")[1]);
		int day = Integer.parseInt(current_date.split("-")[2]);
		Timestamp start_time = null;
		Timestamp end_time = null;
		
		
		if(day == 1) {
			int send_flag = cadre_PayListDAO.getSendPayCount();
			if(send_flag == 0) { //해당 월 초에 월급이 지급 되었는지 
				List<CadreDTO> cadre_list = cadreDAO.getAllCadre_flagOn(); //복무중인 간부 불러오고
				if(month != 1) {
					String last_month_start = String.valueOf(year) + "-" + String.valueOf(month-1) + "-" + String.valueOf(day);
					Date date = new Date();
					date = sdf.parse(last_month_start);
					Calendar cal = Calendar.getInstance();
					cal.setTime(date);
					int endDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
					String last_month_end = String.valueOf(year) + "-" + String.valueOf(month-1) + "-" + String.valueOf(endDay);
					
					start_time = Timestamp.valueOf(last_month_start+" 00:00:00.0");
					end_time = Timestamp.valueOf(last_month_end+" 00:00:00.0"); //지난달 시작일 마지막일 구해옴
				}
				
				else if(month == 1) {
					String last_month_start = String.valueOf(year-1) + "-" + String.valueOf(12) + "-" + String.valueOf(day);
					Date date = new Date();
					date = sdf.parse(last_month_start);
					Calendar cal = Calendar.getInstance();
					cal.setTime(date);
					int endDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
					String last_month_end = String.valueOf(year-1) + "-" + String.valueOf(12) + "-" + String.valueOf(endDay);
					
					start_time = Timestamp.valueOf(last_month_start+" 00:00:00.0");
					end_time = Timestamp.valueOf(last_month_end+" 00:00:00.0"); //지난달 시작일 마지막일 구해옴
				}
				
				for(int i = 0; i < cadre_list.size(); i++) { //간부 정보 처리
					
					int cadre_normalPay = 0;
					switch(cadre_list.get(i).getCadre_mmr().toString()) {
					case "하사":
						cadre_normalPay = 1800000;
						break;
					case "중사":
						cadre_normalPay = 2200000;
						break;
					case "상사":
						cadre_normalPay = 2500000;
						break;
					case "원사":
						cadre_normalPay = 3000000;
						break;
					case "준위":
						cadre_normalPay = 3500000;
						break;
					case "소위":
						cadre_normalPay = 2000000;
						break;
					case "중위":
						cadre_normalPay = 2200000;
						break;
					case "대위":
						cadre_normalPay = 2800000;
						break;
					case "소령":
						cadre_normalPay = 3500000;
						break;
					case "중령": 
						cadre_normalPay = 4000000;
						break; 
					} //기본급 계산
					int cadre_overPay = 0; //추가 수당 총합
					Cadre_CommuteListDTO cadre_commuteObj = new Cadre_CommuteListDTO();
					cadre_commuteObj.setCadre_number(cadre_list.get(i).getCadre_number());
					cadre_commuteObj.setStart_time(start_time);
					cadre_commuteObj.setEnd_time(end_time); 
					List<Cadre_CommuteListDTO> cadre_commuteList = 
							cadre_CommuteListDAO.getCadre_CommuteList(cadre_commuteObj); // 각 간부마다 출근 내역 불러오고
					for(int c = 0; c < cadre_commuteList.size(); c++) {
						cadre_overPay += cadre_commuteList.get(c).getOver_pay(); //한 달 동안 추가 수당 총합
					}
					//추가 수당 종합 끝났고
					int total_pay = cadre_normalPay + cadre_overPay;
					double cadre_incomeTax = total_pay * 0.1;
					double cadre_sub_incomeTax = total_pay * 0.01;
					double cadre_healthyTax = total_pay * 0.033;
										
					Cadre_PayListDTO cadre_pay = new Cadre_PayListDTO();
					cadre_pay.setCadre_number(cadre_list.get(i).getCadre_number());
					cadre_pay.setCadre_normalPay(cadre_normalPay);
					cadre_pay.setCadre_overPay(cadre_overPay);
					cadre_pay.setCadre_incomeTax((int)cadre_incomeTax);
					cadre_pay.setCadre_sub_incomeTax((int)cadre_sub_incomeTax);
					cadre_pay.setCadre_healthyTax((int)cadre_healthyTax);
					cadre_PayListDAO.insertCadrePayRecord(cadre_pay);
				}
				
			}
			else {
				
			}
		}
		else {
			
		}
		return "cadre/login";
   }
   
   @RequestMapping("/login-success.do")
   public String getAllCadre(HttpServletRequest request ,HttpSession session, Model model) throws Exception {
	   Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String user = authentication.getName();
		session.setAttribute("user", user);
		CadreDTO user1 = cadreDAO.findInfoByNum(user);
		String cadre_group =user1.getCadre_group();
		// 해당 간부 로그인 시 오늘 출근 날짜가 있는지 판별
		// 해당 간부 로그인 시 전날 출근 Flag를 가져와야함
		// 그 flag가 1 : 출근 / 2 : 추가 근무 / 3: 퇴근
		// 1이거나 2라면 default로 그 곳에 18시 찍어줘야함
		// 3이라면 그냥 현재 날짜 있는지 판별
		Map<String, Integer> count_map = new HashMap<>();
	     count_map = vacation_Count_main(cadre_group);
		String start_time = cadre_CommuteListDAO.getStart_time(user1.getCadre_number()); // 오늘 출근 날짜가 찍혔는가
		
		if (start_time != null) { //오늘 출근 날짜가 있다면 이미 출근 처리가 된 것임
			String over_time = cadre_CommuteListDAO.getOver_CommuteTime(user1.getCadre_number());
			String end_time = cadre_CommuteListDAO.getEnd_CommuteTime(user1.getCadre_number());
			if(over_time != null) {
				session.setAttribute("over_time", over_time);
			}  
			if(end_time != null) {
				session.setAttribute("end_time", end_time);
			}
			session.setAttribute("start_time", start_time); 
		} 
		else {
			Cadre_CommuteListDTO cadre_commuteObj = cadre_CommuteListDAO.getLastCommute_time(user1.getCadre_number());
			if(cadre_commuteObj != null) {
				if(cadre_commuteObj.getCommute_flag() == 1 || cadre_commuteObj.getCommute_flag() == 2) {
					String date = cadre_commuteObj.getStart_time().toString().split(" ")[0];
					String temp_end_date = date + " 18:00:00.0";
					Timestamp end_time = Timestamp.valueOf(temp_end_date);
					cadre_commuteObj.setEnd_time(end_time);
					cadre_CommuteListDAO.setEnd_Commute_time(cadre_commuteObj);
				}
			}
		}

		session.setAttribute("dept", user1.getCadre_dept());
		session.setAttribute("cadre_num", user1.getCadre_number());
		session.setAttribute("mmr", user1.getCadre_mmr());
		session.setAttribute("writer", user1.getCadre_name());
		session.setAttribute("position", user1.getCadre_position());
		session.setAttribute("group", user1.getCadre_group());
		session.setAttribute("cadre_name", user1.getCadre_name());
		model.addAttribute("count_map", count_map);
		model.addAttribute("user", user1);
		List<MnoticeDTO> list = cadreDAO.noticeList();
		model.addAttribute("list", list);

		return "cadre/main";
   }
   
   @RequestMapping("/accessError.do")
   public String accessError() {
      return "cadre/accessError";
   }
   
   public Map<String, Integer> vacation_Count_main(String cadre_group) throws Exception{
	     
	      Map<String, Integer> count_map = new HashMap<>();
	   
	      int center_total_Count =0; // 본부중대 인원
	      int center_out_Count = 0; //본부중대 출타 인원
	      
	      int one_total_Count =0; // 1중대 인원
	      int one_out_Count = 0; //1중대 출타 인원
	      
	      int two_total_Count =0; // 2중대 인원
	      int two_out_Count = 0; //2중대 출타 인원
	      
	      int three_total_Count =0; // 3중대 인원
	      int three_out_Count = 0; //3중대 출타 인원
	      
	      int All_out_Count = 0; // 총 출타자 (대대 / 해당중대로 나뉠수 있음)
	      
	      
	      List<Manager_SoldierDTO> list = soldierDAO.getAllSoldierList();
	      List<CadreDTO> list_c = cadreDAO.getAllCadre();
	      
	      int All_total_Count = list.size() + list_c.size(); // 현재 부대 병사 + 간부 총원
	      
	      if(cadre_group.equals("KOSTA대대")) {
	         
	      for(int i= 0; i < list.size(); i++) {
	      
	         if(list.get(i).getSoldier_group().equals("본부중대")) {
	            
	               center_total_Count++;
	            
	            if(list.get(i).getSoldier_v_flag().equals("3")) {
	               center_out_Count++;
	            }
	         }
	         
	         else if(list.get(i).getSoldier_group().equals("1중대")) {
	            
	               one_total_Count++;
	            
	            if(list.get(i).getSoldier_v_flag().equals("3")) {
	               one_out_Count++;
	            }
	         }
	         
	         else if(list.get(i).getSoldier_group().equals("2중대")) {
	            
	               two_total_Count++;
	            
	            if(list.get(i).getSoldier_v_flag().equals("3")) {
	               
	               two_out_Count++;
	            }
	         }
	         
	         else if(list.get(i).getSoldier_group().equals("3중대")) {
	            
	               three_total_Count++;
	            
	            if(list.get(i).getSoldier_v_flag().equals("3")) {
	               three_out_Count++;
	            }
	         }
	      }
	      
	      for(int i= 0; i < list_c.size(); i++) {
	         
	         
	         if(list_c.get(i).getCadre_group().equals("본부중대")) {
	            
	               center_total_Count++;
	            
	            if(list_c.get(i).getCadre_v_flag().equals("3")) {
	               center_out_Count++;
	            }
	         }
	         
	         else if(list_c.get(i).getCadre_group().equals("1중대")) {
	            
	               one_total_Count++;
	            
	            if(list_c.get(i).getCadre_v_flag().equals("3")) {
	               one_out_Count++;
	            }
	         }
	         
	         else if(list_c.get(i).getCadre_group().equals("2중대")) {
	            
	               two_total_Count++;
	            
	            if(list_c.get(i).getCadre_v_flag().equals("3")) {
	               two_out_Count++;
	            }
	         }
	         
	         else if(list_c.get(i).getCadre_group().equals("3중대")) {
	            
	               three_total_Count++;
	            
	            if(list_c.get(i).getCadre_v_flag().equals("3")) {
	               three_out_Count++;
	            }
	         }
	      }
	      }
	      
	      else {
	         
	         List<Manager_SoldierDTO> list_corp = soldierDAO.getSelect_vaction(cadre_group); // 현재 출타중인 병사들
	         List<CadreDTO> list_c_corp = cadreDAO.getSelect_vacation(cadre_group);
	         
	         int soldier_Count = receiptDAO.getCount_soldier(cadre_group);
	         int cadre_Count = receiptDAO.getCount_cadre(cadre_group); 
	         
	         All_total_Count = soldier_Count + cadre_Count; // 현재 부대 병사 + 간부 총원
	         All_out_Count = list_corp.size() + list_c_corp.size();
	         
	         count_map.put("All_total_Count", All_total_Count);
	         count_map.put("All_out_Count", All_out_Count);
	         count_map.put("flag", 2);
	         return count_map;
	         
	      }
	      
	      All_out_Count = center_out_Count + one_out_Count + two_out_Count + three_out_Count;
	      
	      
	      count_map.put("flag", 1);
	      count_map.put("All_total_Count", All_total_Count);
	      count_map.put("All_out_Count", All_out_Count);
	      
	      count_map.put("center_total_Count", center_total_Count);
	      count_map.put("center_out_Count", center_out_Count);
	      
	      count_map.put("one_total_Count", one_total_Count);
	      count_map.put("one_out_Count", one_out_Count);
	      
	      count_map.put("two_total_Count", two_total_Count);
	      count_map.put("two_out_Count", two_out_Count);
	      
	      count_map.put("three_total_Count", three_total_Count);
	      count_map.put("three_out_Count", three_out_Count);
	      
	      
	      return count_map;
	   }
}