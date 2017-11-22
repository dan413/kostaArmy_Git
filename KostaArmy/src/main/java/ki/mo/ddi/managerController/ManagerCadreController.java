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

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import ki.mo.ddi.cadreModel.CadreDAO;
import ki.mo.ddi.cadreModel.CadreDTO;
import ki.mo.ddi.managerModel.Manager_SoldierDTO;

@Controller
public class ManagerCadreController {
   @Resource
   private CadreDAO cadreDAO;
   
   @RequestMapping("/cadreList.do")
   public String getAllCadreList(Model model) {
      List<CadreDTO> temp_list = cadreDAO.getAllCadre();
      for(int i = 0; i < temp_list.size(); i++) { 
         Timestamp cadre_outputDate = temp_list.get(i).getCadre_outputDate();
         Timestamp d_day = Timestamp.valueOf(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(System.currentTimeMillis()));
         long Cadre_d_day = ((cadre_outputDate.getTime() - d_day.getTime())/(24 * 60 * 60 * 1000));
         CadreDTO cadre = new CadreDTO();
         cadre.setCadre_number(temp_list.get(i).getCadre_number());
         cadre.setCadre_d_day((int)Cadre_d_day);
         cadreDAO.update_Day(cadre);
      }
      List<CadreDTO> list = cadreDAO.getAllCadre();
      model.addAttribute("cadre_list", list);
      return "cadre_manager/cadreList";
   }
   
   @RequestMapping("/cadreAddInfo.do")
   public String cadreAddInfo() {
      return "cadre_manager/cadreAddInfo";
   }
   
   @RequestMapping("/search_cadre.do")
   public ModelAndView selectByKey(HttpServletRequest request) throws Exception{
      ModelAndView mav = new ModelAndView();
      String keyvalue= request.getParameter("keyvalue");
      String cadre_group = request.getParameter("m_search_table");
      String arr = request.getParameter("m_search_part");
      
      Map<String, String> map = new HashMap<String, String>();
      
      map.put("cadre_group", cadre_group);
      map.put("arr", arr);
      map.put("keyvalue", keyvalue); 
      
      List<CadreDTO> list = cadreDAO.selectByKey(map);

      
      mav.addObject("cadre_list", list); 
      mav.setViewName("cadre_manager/cadreList");
      
      return mav;
      
   }
   
   @RequestMapping("/addNewCadre.do")
   public void addNewCadre(HttpServletResponse response, HttpServletRequest request, MultipartHttpServletRequest multi) throws ParseException, IOException {
      request.setCharacterEncoding("utf-8");
      response.setCharacterEncoding("utf-8");
      
      String cadre_number = multi.getParameter("cadre_number");
      String cadre_name = multi.getParameter("cadre_name");
      String cadre_mmr = multi.getParameter("cadre_mmr");
      String cadre_regidentNumber = multi.getParameter("cadre_regidentNumber");
      String cadre_age = multi.getParameter("cadre_age");
      String cadre_supergroup = multi.getParameter("cadre_supergroup");
      String cadre_group = multi.getParameter("cadre_group");
      String cadre_position = multi.getParameter("cadre_position");
      String cadre_bloodType = multi.getParameter("cadre_bloodType");
      String cadre_subbloodType = multi.getParameter("cadre_subbloodType");
      String cadre_address = multi.getParameter("cadre_address");
      String cadre_phone = multi.getParameter("cadre_phone");
      String temp_cadre_inputDate = multi.getParameter("cadre_inputDate");
      String temp_cadre_outputDate = multi.getParameter("cadre_outputDate");
      String cadre_remark = multi.getParameter("cadre_remark");
      
      Pattern p_regidentNumber = Pattern.compile("(^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))-[1-4][0-9]{6}$)");
      Matcher m_regidentNumber = p_regidentNumber.matcher(cadre_regidentNumber);
      Pattern p_phone = Pattern.compile("(^(01[0|1|6|7|8|9])-([0-9]{3,4})-([0-9]{4})$)");
      Matcher m_phone = p_phone.matcher(cadre_phone);
      
      String error = null;
      if(!m_regidentNumber.find()) {
         error = "주민등록번호 오류입니다.";
         request.getSession().setAttribute("patternError", error);
         response.sendRedirect("cadreAddInfo.do");
         return;
      }
      if(!m_phone.find()) {
         error = "전화번호를 제대로 입력해주세요.";
         request.getSession().setAttribute("patternError", error);
         response.sendRedirect("cadreAddInfo.do");
         return;
      }
      
      temp_cadre_inputDate = temp_cadre_inputDate + " 00:00:00.0";
      temp_cadre_outputDate = temp_cadre_outputDate + " 00:00:00.0";
      Timestamp cadre_inputDate = Timestamp.valueOf(temp_cadre_inputDate);
      Timestamp cadre_outputDate = Timestamp.valueOf(temp_cadre_outputDate);
      Timestamp d_day = Timestamp.valueOf(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(System.currentTimeMillis()));
      long cadre_d_day = ((cadre_outputDate.getTime() - d_day.getTime())/(24 * 60 * 60 * 1000));
      
      CadreDTO cadre = new CadreDTO();
   
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
         cadre.setCadre_picture(saveFileName);
      }
      
      cadre.setCadre_d_day((int)cadre_d_day);
      cadre.setCadre_number(cadre_number);
      cadre.setCadre_name(cadre_name);
      cadre.setCadre_mmr(cadre_mmr);
      cadre.setCadre_regidentNumber(cadre_regidentNumber);
      cadre.setCadre_age(Integer.parseInt(cadre_age));
      cadre.setCadre_supergroup(cadre_supergroup);
      cadre.setCadre_group(cadre_group);
      cadre.setCadre_bloodType(cadre_bloodType);
      cadre.setCadre_subbloodType(cadre_subbloodType);
      cadre.setCadre_phone(cadre_phone);
      cadre.setCadre_address(cadre_address);
      cadre.setCadre_remark(cadre_remark);
      cadre.setCadre_position(cadre_position); 
      cadre.setCadre_inputDate(cadre_inputDate);
      cadre.setCadre_outputDate(cadre_outputDate); 
      String cadre_password = cadre_regidentNumber.split("-")[0];
      cadre.setCadre_password(cadre_password);
      if(cadre.getCadre_position().equals("군수과장")) {
         cadre.setCadre_role("ROLE_SUPPLY_CAPTAIN");
         cadre.setCadre_dept("군수");
      }
      else if(cadre.getCadre_position().equals("인사과장")) {
         cadre.setCadre_role("ROLE_MANAGE_CAPTAIN");
         cadre.setCadre_dept("인사");
      }
      else if(cadre.getCadre_position().equals("작전과장")) {
         cadre.setCadre_role("ROLE_MISSION_CAPTAIN");
         cadre.setCadre_dept("작전");
      }
      else if(cadre.getCadre_position().equals("대대장")) {
         cadre.setCadre_role("ROLE_COMMANDER");
         cadre.setCadre_dept("대대");
      }
      else if(cadre.getCadre_position().equals("중대장")) {
         cadre.setCadre_role("ROLE_TROOP_LIEUTENENT");
         cadre.setCadre_dept("-");
      }   
      else if(cadre.getCadre_position().equals("행정보급관")) {
         cadre.setCadre_role("ROLE_MASTER_SERGEANT");
         cadre.setCadre_dept("행정");
      }
      
      
      if(cadre.getCadre_picture().equals("")) {
         cadreDAO.insertCadre_nonFile(cadre); 
      }
      else {
         cadreDAO.insertCadre(cadre);
      } 

      response.sendRedirect("detailCadre.do?cadre_number="+cadre_number);
   }
   
   @RequestMapping("/detailCadre.do")
   public String getCadreInfo(HttpServletRequest request, Model model) {
      String cadre_number = request.getParameter("cadre_number");
      CadreDTO cadre = cadreDAO.getCadreInfo(cadre_number);
      model.addAttribute("cadre", cadre);
      return "cadre_manager/cadreDetailInfo";
   }
   @RequestMapping("/updateCadreForm.do")
   public String updateForm(Model model, HttpServletRequest request) {
      String cadre_number = request.getParameter("cadre_number");
      CadreDTO cadre = cadreDAO.getCadreInfo(cadre_number);
      model.addAttribute("cadre", cadre);
      return "cadre_manager/cadreUpdateForm";
      
   }
   @RequestMapping("/updateCadre.do")
   public void updateCadre(HttpServletRequest request, HttpServletResponse response, MultipartHttpServletRequest multi, Model model) throws IOException {
      request.setCharacterEncoding("utf-8");
      response.setCharacterEncoding("utf-8");
      
      String cadre_number = multi.getParameter("cadre_number");
      String cadre_name = multi.getParameter("cadre_name");
      String cadre_mmr = multi.getParameter("cadre_mmr");
      String cadre_regidentNumber = multi.getParameter("cadre_regidentNumber");
      String cadre_age = multi.getParameter("cadre_age");
      String cadre_supergroup = multi.getParameter("cadre_supergroup");
      String cadre_group = multi.getParameter("cadre_group");
      String cadre_position = multi.getParameter("cadre_position");
      String cadre_bloodType = multi.getParameter("cadre_bloodType");
      String cadre_subbloodType = multi.getParameter("cadre_subbloodType");
      String cadre_address = multi.getParameter("cadre_address");
      String cadre_phone = multi.getParameter("cadre_phone");
      String temp_cadre_inputDate = multi.getParameter("cadre_inputDate");
      String temp_cadre_outputDate = multi.getParameter("cadre_outputDate");
      String cadre_remark = multi.getParameter("cadre_remark");
      
      Pattern p_regidentNumber = Pattern.compile("(^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))-[1-4][0-9]{6}$)");
      Matcher m_regidentNumber = p_regidentNumber.matcher(cadre_regidentNumber);
      Pattern p_phone = Pattern.compile("(^(01[0|1|6|7|8|9])-([0-9]{3,4})-([0-9]{4})$)");
      Matcher m_phone = p_phone.matcher(cadre_phone);
      
      String error = null;
      if(!m_regidentNumber.find()) {
         error = "주민등록번호 오류입니다.";
         request.getSession().setAttribute("patternError", error);
         response.sendRedirect("cadreAddInfo.do");
         return;
      }
      if(!m_phone.find()) {
         error = "전화번호를 제대로 입력해주세요.";
         request.getSession().setAttribute("patternError", error);
         response.sendRedirect("cadreAddInfo.do");
         return;
      }
      
      temp_cadre_inputDate = temp_cadre_inputDate + " 00:00:00.0";
      temp_cadre_outputDate = temp_cadre_outputDate + " 00:00:00.0";
      Timestamp cadre_inputDate = Timestamp.valueOf(temp_cadre_inputDate);
      Timestamp cadre_outputDate = Timestamp.valueOf(temp_cadre_outputDate);
      Timestamp d_day = Timestamp.valueOf(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(System.currentTimeMillis()));
      long cadre_d_day = ((cadre_outputDate.getTime() - d_day.getTime())/(24 * 60 * 60 * 1000));
      
      CadreDTO cadre = new CadreDTO();

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
         cadre.setCadre_picture(saveFileName);
      }
      
      cadre.setCadre_d_day((int)cadre_d_day);
      cadre.setCadre_number(cadre_number);
      cadre.setCadre_name(cadre_name);
      cadre.setCadre_mmr(cadre_mmr);
      cadre.setCadre_regidentNumber(cadre_regidentNumber);
      cadre.setCadre_age(Integer.parseInt(cadre_age));
      cadre.setCadre_supergroup(cadre_supergroup);
      cadre.setCadre_group(cadre_group);
      cadre.setCadre_bloodType(cadre_bloodType);
      cadre.setCadre_subbloodType(cadre_subbloodType);
      cadre.setCadre_phone(cadre_phone);
      cadre.setCadre_address(cadre_address);
      cadre.setCadre_remark(cadre_remark);
      cadre.setCadre_position(cadre_position); 
      cadre.setCadre_inputDate(cadre_inputDate);
      cadre.setCadre_outputDate(cadre_outputDate); 
      if(cadre.getCadre_position().equals("군수과장")) {
         cadre.setCadre_role("ROLE_SUPPLY_CAPTAIN");
         cadre.setCadre_dept("군수");
      }
      else if(cadre.getCadre_position().equals("인사과장")) {
         cadre.setCadre_role("ROLE_MANAGE_CAPTAIN");
         cadre.setCadre_dept("인사");
      }
      else if(cadre.getCadre_position().equals("작전과장")) {
         cadre.setCadre_role("ROLE_MISSION_CAPTAIN");
         cadre.setCadre_dept("작전");
      }
      else if(cadre.getCadre_position().equals("대대장")) {
         cadre.setCadre_role("ROLE_COMMANDER");
         cadre.setCadre_dept("대대");
      }
      else if(cadre.getCadre_position().equals("중대장")) {
         cadre.setCadre_role("ROLE_TROOP_LIEUTENENT");
         cadre.setCadre_dept("-");
      }   
      else if(cadre.getCadre_position().equals("행정보급관")) {
         cadre.setCadre_role("ROLE_MASTER_SERGEANT");
         cadre.setCadre_dept("행정");
      }
      
      
      if(cadre.getCadre_picture().equals("")) {
         cadreDAO.updateCadre_nonFile(cadre);  
      }
      else {
         cadreDAO.updateCadre(cadre);
      } 
      

      response.sendRedirect("detailCadre.do?cadre_number="+cadre_number);
   }
   
   @RequestMapping("/passwordValid.do")
   public void passwordValid(HttpServletRequest request, HttpServletResponse response) throws IOException {
      String currentPassword = request.getParameter("currentPassword");
      String cadre_number = request.getParameter("cadre_number");
      
      String cadre_password = cadreDAO.getPassword(cadre_number);
      if(currentPassword.equals(cadre_password)) {
         response.getWriter().write("0");
      }
      else {
         response.getWriter().write("1");
      }
   }
   
   @RequestMapping("/changePassword.do")
   public void changePassword(HttpServletRequest request, HttpServletResponse response) throws IOException{
      String cadre_password = request.getParameter("NewPassword");
      String cadre_number = request.getParameter("cadre_number");
      
      CadreDTO cadre = new CadreDTO();
      cadre.setCadre_password(cadre_password);
      cadre.setCadre_number(cadre_number);
      
      int result = cadreDAO.changePassword(cadre);
      if(result == 1) {
         response.getWriter().write("0");
      }
      else {
         response.getWriter().write("1");
      }
   }
   
   @RequestMapping("/CadredischargeProcess.do")
   public void dischargeProcess(HttpServletRequest request, HttpServletResponse response) throws IOException {
      String cadre_number = request.getParameter("cadre_number");
      cadreDAO.cadreDischargeProcess(cadre_number);
      response.getWriter().write("0");  
   }
}