package ki.mo.ddi.noticeController;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthSeparatorUI;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ki.mo.ddi.noticeModel.MnoticeDAO;
import ki.mo.ddi.noticeModel.MnoticeDTO;
import ki.mo.ddi.noticeModel.Paging;

@Controller
public class MnoticeController {
   
   @Resource
   private MnoticeDAO  noticeDAO;
   
   @RequestMapping("/notice_list.do")
      public String list(  HttpSession session, HttpServletRequest request, Model model,
         @RequestParam(defaultValue="1") int curPage) throws Exception{
         String id = (String)session.getAttribute("user");
         String name= (String)session.getAttribute("writer");
         String dept = (String)session.getAttribute("dept");
         //레코드의 갯수 계산

         int count = noticeDAO.getListCount();
         Paging paging= new Paging(count, curPage);

         int start = paging.getPageBegin();
         int end =paging.getPageEnd();
         Map<Object, Object> all_map = new HashMap<Object, Object>();
         all_map.put("start", start);
         all_map.put("end", end);
         all_map.put("dept", dept);
         List<MnoticeDTO> list = noticeDAO.selectAll(all_map);
         
         Map<String, Object> map = new HashMap<String, Object>();
         map.put("paging", paging);
         model.addAttribute("map", map);
         model.addAttribute("list", list);
         
         return "cadre_notice/list";
      }

   
   @RequestMapping("/writeform_notice.do")
   public String writeForm() {
      return "cadre_notice/writeform";    //   /WEB-INF/views/writeform.jsp
   }
   
   @RequestMapping("/write_notice.do")
   public ModelAndView write(MnoticeDTO dto, HttpServletRequest request,  HttpSession session) throws Exception {
      ModelAndView mav = new ModelAndView();
      Timestamp idate = new Timestamp(System.currentTimeMillis());
      String cadre_num = (String)session.getAttribute("cadre_num");
      String position = (String)session.getAttribute("position");
      String mmr = (String)session.getAttribute("mmr");
      String dept = (String)session.getAttribute("dept");
      String writer = (String)session.getAttribute("writer");
      String group = (String)session.getAttribute("group");

      dto.setCadre_num(cadre_num);
      dto.setPosition(position);
      dto.setMmr(mmr);
      dto.setDept(dept);
      dto.setWriter(writer);
      dto.setCadre_group(group);
      dto.setIdate(idate);
      
      noticeDAO.insertNotice(dto);
      
      mav.setViewName("redirect:notice_list.do");
      return mav;
   }


   @RequestMapping("/updateform_notice.do")
   public String updateForm(HttpServletRequest request, Model model, 
         @RequestParam(value="message", required=false) String message) {
      int num= Integer.parseInt(request.getParameter("num"));
      MnoticeDTO list = noticeDAO.getNoticeByNum(num);
      model.addAttribute("message", message);
      model.addAttribute("list", list);
      
      return "cadre_notice/updateform";    //   /WEB-INF/views/writeform.jsp
   }
   
   @RequestMapping("/update_notice.do")
   public ModelAndView update(MnoticeDTO dto) throws Exception {
      ModelAndView mav = new ModelAndView();
      noticeDAO.updateNotice(dto);
      mav.setViewName("redirect:detail_notice.do?num="+dto.getNum());
      return mav;
   }
   
   @RequestMapping("/delete_notice.do")
   public ModelAndView delete(int num) throws Exception {
      ModelAndView mav = new ModelAndView();

      noticeDAO.deleteNotice(num);
      mav.setViewName("redirect:notice_list.do");
      return mav;
   }
   
   @RequestMapping("/detail_notice.do")
   public String detailForm(HttpServletRequest request, Model model, 
         @RequestParam(value="message", required=false) String message) {
      int num = Integer.parseInt(request.getParameter("num"));
      MnoticeDTO list = noticeDAO.getNoticeByNum(num);
      noticeDAO.updateHit(num);
      model.addAttribute("message", message);
      model.addAttribute("list", list);
      
      return "cadre_notice/content";    //   /WEB-INF/views/writeform.jsp
   }
   
   @RequestMapping("/notice_dept_list.do")
   public String selectDeptAll(HttpSession session, HttpServletRequest request, Model model,
            @RequestParam(defaultValue="1") int curPage) {
         
         String name= (String)session.getAttribute("writer");
         String dept = request.getParameter("dept");
         int count = noticeDAO.getDeptListCount(dept);
         Paging paging= new Paging(count, curPage);
         int start = paging.getPageBegin();
         int end =paging.getPageEnd();
         
         Map<Object, Object> all_map = new HashMap<Object, Object>();
         all_map.put("start", start);
         all_map.put("end", end);
         all_map.put("dept", dept);
         List<MnoticeDTO> list = noticeDAO.selectDeptAll(all_map);
         
         Map<String, Object> deptmap = new HashMap<String, Object>();
         deptmap.put("paging", paging);
         model.addAttribute("deptmap", deptmap);
         model.addAttribute("list", list);
         
         return "cadre_notice/list";
      }

   
}





