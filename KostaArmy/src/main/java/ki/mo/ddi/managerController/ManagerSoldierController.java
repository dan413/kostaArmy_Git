package ki.mo.ddi.managerController;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import ki.mo.ddi.cadreModel.CadreDAO;
import ki.mo.ddi.cadreModel.CadreDTO;
import ki.mo.ddi.managerModel.Manager_FamilyTableDAO;
import ki.mo.ddi.managerModel.Manager_FamilyTableDTO;
import ki.mo.ddi.managerModel.Manager_SoldierDAO;
import ki.mo.ddi.managerModel.Manager_SoldierDTO;

@Controller
public class ManagerSoldierController {

   @Resource
   private Manager_SoldierDAO soldierDAO;
   @Resource
   private CadreDAO cadreDAO;
   @Resource
   private Manager_FamilyTableDAO familyDAO;
   
   @RequestMapping("/soldierList.do")
   public ModelAndView getAllSoldierList() throws Exception{
      ModelAndView mav = new ModelAndView();
      List<Manager_SoldierDTO> temp_list = soldierDAO.getAllSoldierList();
      for(int i = 0; i < temp_list.size(); i++) {
         Timestamp soldier_outputDate = temp_list.get(i).getSoldier_outputDate();
         Timestamp d_day = Timestamp.valueOf(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(System.currentTimeMillis()));
         long soldier_d_day = ((soldier_outputDate.getTime() - d_day.getTime())/(24 * 60 * 60 * 1000));
         Manager_SoldierDTO soldier = new Manager_SoldierDTO();
         soldier.setSoldier_number(temp_list.get(i).getSoldier_number());
         soldier.setSoldier_d_day((int)soldier_d_day);
         soldierDAO.update_Day(soldier);
      }
      List<Manager_SoldierDTO> list = soldierDAO.getAllSoldierList();
      mav.addObject("list", list);
      mav.setViewName("cadre_manager/soldierList");
      return mav;
   }
   
   @RequestMapping("/addNewSoldier.do")
   public void addNewSoldier(HttpServletResponse response, HttpServletRequest request) throws ParseException, IOException {
      String soldier_number = request.getParameter("soldier_number");
      String soldier_name = request.getParameter("soldier_name");
      String soldier_mmr = request.getParameter("soldier_mmr");
      String soldier_group = request.getParameter("soldier_group");
      String temp_soldier_inputDate = request.getParameter("soldier_inputDate");
      String temp_soldier_outputDate = request.getParameter("soldier_outputDate");
      
      temp_soldier_inputDate = temp_soldier_inputDate + " 00:00:00.0";
      temp_soldier_outputDate = temp_soldier_outputDate + " 00:00:00.0";
      Timestamp soldier_inputDate = Timestamp.valueOf(temp_soldier_inputDate);
      Timestamp soldier_outputDate = Timestamp.valueOf(temp_soldier_outputDate);
      Timestamp d_day = Timestamp.valueOf(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(System.currentTimeMillis()));
      long soldier_d_day = ((soldier_outputDate.getTime() - d_day.getTime())/(24 * 60 * 60 * 1000));
      
      Manager_SoldierDTO dto = new Manager_SoldierDTO();
      dto.setSoldier_d_day((int)soldier_d_day);
      dto.setSoldier_number(soldier_number);
      dto.setSoldier_name(soldier_name);
      dto.setSoldier_mmr(soldier_mmr);
      dto.setSoldier_group(soldier_group);
      dto.setSoldier_inputDate(soldier_inputDate);
      dto.setSoldier_outputDate(soldier_outputDate);
      soldierDAO.addNewSoldier(dto);
      familyDAO.addSoldierNumber(soldier_number);
      
      response.getWriter().write("0");
   }
   
   @RequestMapping("/detailSoldier.do")
   public String getSoldierInfo(HttpServletRequest request, Model model) {
	  request.getSession().removeAttribute("successInput");
      String soldier_number = request.getParameter("soldier_number");
      Manager_SoldierDTO soldier_obj = soldierDAO.getSoldierInfo(soldier_number);
      Manager_FamilyTableDTO famInfo = familyDAO.getFamilyInfo(soldier_number);
      model.addAttribute("soldier_obj", soldier_obj);
      model.addAttribute("famInfo", famInfo);
      return "cadre_manager/soldierAddInfo";
   }
   
   @RequestMapping("/updateSoldier.do")
   public void updateSoldier(HttpServletRequest request, HttpServletResponse response, MultipartHttpServletRequest multi, 
         Model model, Manager_FamilyTableDTO familyDTO) throws IOException {
      request.setCharacterEncoding("utf-8");
      response.setCharacterEncoding("utf-8");
      request.getSession().removeAttribute("patternError");
      request.getSession().removeAttribute("successInput");
      
      String soldier_number = multi.getParameter("soldier_number");
      String soldier_name = multi.getParameter("soldier_name");
      String soldier_mmr = multi.getParameter("soldier_mmr"); 
      String soldier_age = multi.getParameter("soldier_age");
      String soldier_regidentNumber = multi.getParameter("soldier_regidentNumber");//
      String soldier_groupFullName = multi.getParameter("soldier_groupFullName");
      String soldier_position = multi.getParameter("soldier_position");
      String soldier_bloodType = multi.getParameter("soldier_bloodType");
      String soldier_subbloodType = multi.getParameter("soldier_subbloodType");
      String soldier_address = multi.getParameter("soldier_address");
      String soldier_phone = multi.getParameter("soldier_phone");//
      String soldier_remark = multi.getParameter("soldier_remark");
      String temp_soldier_inputDate = request.getParameter("soldier_inputDate");
      String temp_soldier_outputDate = request.getParameter("soldier_outputDate");
      
      temp_soldier_inputDate = temp_soldier_inputDate + " 00:00:00.0";
      temp_soldier_outputDate = temp_soldier_outputDate + " 00:00:00.0";
      Timestamp soldier_inputDate = Timestamp.valueOf(temp_soldier_inputDate);
      Timestamp soldier_outputDate = Timestamp.valueOf(temp_soldier_outputDate);
      Timestamp d_day = Timestamp.valueOf(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(System.currentTimeMillis()));
      long soldier_d_day = ((soldier_outputDate.getTime() - d_day.getTime())/(24 * 60 * 60 * 1000));
      
      String group_temp[] = soldier_groupFullName.split("/");
      String soldier_supergroup = group_temp[0];
      String soldier_group = group_temp[1];

      Pattern p_regidentNumber = Pattern.compile("(^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))-[1-4][0-9]{6}$)");
      Matcher m_regidentNumber = p_regidentNumber.matcher(soldier_regidentNumber);
      Pattern p_phone = Pattern.compile("(^(01[0|1|6|7|8|9])-([0-9]{3,4})-([0-9]{4})$)");
      Matcher m_phone = p_phone.matcher(soldier_phone);
      
      String error = null;
      if(!m_regidentNumber.find()) {
         error = "주민등록번호를 제대로 입력하세요.";
         request.getSession().setAttribute("patternError", error);
         response.sendRedirect("detailSoldier.do?soldier_number="+soldier_number);
         return;
      }
      if(!m_phone.find()) {
         error = "전화번호를 제대로 입력하세요.";
         request.getSession().setAttribute("patternError", error);
         response.sendRedirect("detailSoldier.do?soldier_number="+soldier_number);
         return;
      }
      
      Manager_SoldierDTO soldier = new Manager_SoldierDTO();
      HttpSession session = null;
      session = request.getSession();
      String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
      Iterator<String> file = multi.getFileNames();
      while(file.hasNext()) {
         String uploadFileName = file.next(); 
         MultipartFile mFile = multi.getFile(uploadFileName);
         String saveFileName = mFile.getOriginalFilename();
         
         if(saveFileName != null && !saveFileName.equals("")) {
            if(new File(savePath+saveFileName).exists()) {
               saveFileName = saveFileName + "_" + System.currentTimeMillis();
            }
            try {
               mFile.transferTo(new File(savePath+saveFileName));
            }
            catch(Exception e) {
               e.printStackTrace();
            }
         }
         soldier.setSoldier_picture(saveFileName);
      }
      
      soldier.setSoldier_number(soldier_number);
      soldier.setSoldier_name(soldier_name);
      soldier.setSoldier_mmr(soldier_mmr);
      soldier.setSoldier_age(Integer.parseInt(soldier_age));
      soldier.setSoldier_regidentNumber(soldier_regidentNumber);
      soldier.setSoldier_supergroup(soldier_supergroup);
      soldier.setSoldier_group(soldier_group);
      soldier.setSoldier_bloodType(soldier_bloodType);
      soldier.setSoldier_subbloodType(soldier_subbloodType);
      soldier.setSoldier_remark(soldier_remark);
      soldier.setSoldier_phone(soldier_phone);
      soldier.setSoldier_address(soldier_address);
      soldier.setSoldier_position(soldier_position);
      soldier.setSoldier_inputDate(soldier_inputDate);
      soldier.setSoldier_outputDate(soldier_outputDate);
      soldier.setSoldier_d_day((int)soldier_d_day);
      
      if(soldier.getSoldier_picture().equals("")) {
         soldierDAO.updateSoldier_nonFile(soldier); 
      }
      else {
         soldierDAO.updateSoldier(soldier);
      }
      familyDAO.updateSoldierFamily(familyDTO);
      response.sendRedirect("soldierList.do");
      return;
   }
   
   @RequestMapping("/search_soldier.do")
   public ModelAndView selectByKey(HttpServletRequest request) throws Exception{
      ModelAndView mav = new ModelAndView();
      String keyvalue= request.getParameter("keyvalue");
      String soldier_group = request.getParameter("m_search_table");
      String arr = request.getParameter("m_search_part");
      
      Map<String, String> map = new HashMap<String, String>();
       
      map.put("soldier_group", soldier_group);
      map.put("arr", arr);
      map.put("keyvalue", keyvalue); 
      
      List<Manager_SoldierDTO> list = soldierDAO.selectByKey(map);
      
      mav.addObject("list", list); 
      mav.setViewName("cadre_manager/soldierList");
      
      return mav;
      
   }
   @RequestMapping("/dischargeProcess.do")
   public void dischargeProcess(HttpServletRequest request, HttpServletResponse response) throws IOException {
      String soldier_number = request.getParameter("soldier_number");
      soldierDAO.dischargeProcess(soldier_number);
      response.getWriter().write("0"); 
   }
   
   @RequestMapping("/searchListFunction.do")
 	public void get_Soldier_By_Key(HttpServletRequest request, Model model, HttpSession session,
 			HttpServletResponse response) throws Exception {
 		ModelAndView mav = new ModelAndView();
 		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
 		String user = authentication.getName();
 		session.setAttribute("user", user);
 		CadreDTO user1 = cadreDAO.findInfoByNum(user);

 		session.setAttribute("group", user1.getCadre_group());
 		model.addAttribute("user", user1);

 		String selection = request.getParameter("selection");
 		String keyvalue = request.getParameter("keyvalue");
 		String soldier_group = user1.getCadre_group();

 		StringBuffer result = new StringBuffer("");
 		result.append("{\"result\":[");

 		Map<String, String> map = new HashMap<String, String>();
 		map.put("soldier_group", soldier_group);
 		map.put("selection", selection);
 		map.put("keyvalue", keyvalue);

 	
 		
 		try {
 			if (selection.equals("soldier")) {

 			 List<Manager_SoldierDTO> list = soldierDAO.get_Soldier_By_Key(map);

 				for (int i = 0; i < list.size(); i++) {
 					result.append("[{\"value\": \"" + list.get(i).getSoldier_number() + "\"},");
 					result.append("{\"value\": \"" + list.get(i).getSoldier_mmr() + "\"},");
 					result.append("{\"value\": \"" + list.get(i).getSoldier_name() + "\"}]");
 					
 					if (i != list.size() - 1)
 						result.append(",");
 				}
 				result.append("], \"last\":\"" + list.get(list.size() - 1).getSoldier_number() + "\"}");
 				
 			} else if (selection.equals("cadre")) {
 				 List<CadreDTO> list = cadreDAO.get_Cadre_By_Key(map);

 					for (int i = 0; i < list.size(); i++) {
 						result.append("[{\"value\": \"" + list.get(i).getCadre_number() + "\"},");
 						result.append("{\"value\": \"" + list.get(i).getCadre_mmr() + "\"},");
 						result.append("{\"value\": \"" + list.get(i).getCadre_name() + "\"}]");
 						if (i != list.size() - 1)
 							result.append(",");
 					}
 					result.append("], \"last\":\"" + list.get(list.size() - 1).getCadre_number() + "\"}");
 				

 			} else if (selection.equals("driver")) {
 				 List<Manager_SoldierDTO> list = soldierDAO.get_Driver_By_Key(map);

 					for (int i = 0; i < list.size(); i++) {
 						result.append("[{\"value\": \"" + list.get(i).getSoldier_number() + "\"},");
 						result.append("{\"value\": \"" + list.get(i).getSoldier_mmr() + "\"},");
 						result.append("{\"value\": \"" + list.get(i).getSoldier_name() + "\"}]");
 						if (i != list.size() - 1)
 							result.append(",");
 					}
 					result.append("], \"last\":\"" + list.get(list.size() - 1).getSoldier_number() + "\"}");
 			}
 		} catch (Exception e) {
 			result.toString();
 		}
 		
 		response.getWriter().write(result.toString());
 	}
    
}