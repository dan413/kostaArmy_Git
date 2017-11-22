package ki.mo.ddi.supplyController;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ki.mo.ddi.supplyModel.Supply_ReceiptDAO;
import ki.mo.ddi.supplyModel.Supply_ReceiptDTO;
import ki.mo.ddi.supplyModel.Supply_TableDAO;
import ki.mo.ddi.supplyModel.Supply_TableDTO;

@Controller
public class SupplyReceiptTableController {
	
	@Resource
	private Supply_ReceiptDAO supply_ReceiptDAO;
	
	@Resource
	private Supply_TableDAO supply_TableDAO;
	
	@RequestMapping("/dateSearch.do")
	   public ModelAndView getDateSearch(HttpServletRequest request, HttpServletResponse response, Model model) throws ServletException, IOException {
	      
		ModelAndView mav = new ModelAndView();
	      Map<Object, Object> map = new HashMap<Object, Object>();
	      Timestamp date = null;
	      String searchdate = request.getParameter("date_search");
	      String receipt_type = request.getParameter("receipt_type");
	      if(searchdate == null || searchdate.equals("")) {
	    	  date = new Timestamp(System.currentTimeMillis());
	      } else {
	    	  date = Timestamp.valueOf(searchdate+" 00:00:00.0");
	      }
	      map.put("date", date);
	      map.put("receipt_type", receipt_type); 
	      
	      List<Supply_ReceiptDTO> list = supply_ReceiptDAO.getSearchDateList(map); 
	      model.addAttribute("list", list);
	      mav.addObject("list", list);
	      mav.setViewName("cadre_supply/dateSearchForm");
	      return mav;
	   }
	@RequestMapping("/dateSearchForm.do")
	public ModelAndView dateSearchForm() {
		ModelAndView mav = new ModelAndView();
		List<Supply_ReceiptDTO> list = supply_ReceiptDAO.selectAll();
		mav.addObject("list", list);
		mav.setViewName("cadre_supply/dateSearchForm");
		return mav;
	}
	@RequestMapping("/completeOrder.do")
	public ModelAndView completeOrder(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String group = (String)request.getSession().getAttribute("group");
		String tableName = null;
		switch(group) {
		case "본부중대":
			tableName = "supply_Table";
			break;
		case "1중대":
			tableName = "supply_Table_1";
			break;
		case "2중대":
			tableName = "supply_Table_2";
			break;
		case "3중대":
			tableName = "supply_Table_3"; 
			break;
		}
		ModelAndView mav = new ModelAndView();
		List<Supply_TableDTO> list = supply_TableDAO.getSupplyAgreeList(tableName);
		Timestamp supply_r_date = new Timestamp(System.currentTimeMillis());
		
		for(int i = 0; i < list.size(); i++) {
			Supply_ReceiptDTO dto = new Supply_ReceiptDTO();
			dto.setTableName(tableName);
			dto.setSupply_r_date(supply_r_date);
			dto.setSupply_r_num(list.get(i).getSupply_num());
			dto.setSupply_r_name(list.get(i).getSupply_name());
			dto.setSupply_r_order(list.get(i).getSupply_set());
			dto.setSupply_r_total(list.get(i).getSupply_set()+list.get(i).getSupply_total());
			dto.setSupply_group(group);
			supply_ReceiptDAO.insertReceipt(dto);
			supply_ReceiptDAO.setTotal(dto);
			list.get(i).setTableName(tableName);
			supply_TableDAO.resetSupply_Set(list.get(i));
		}
		mav.setViewName("redirect:getCurrentApplyList.do");
		return mav;
	}
	
	@RequestMapping("consumePro.do")
	public void consumePro(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String group = (String)request.getSession().getAttribute("group");
		String tableName = null;
		switch(group) {
		case "본부중대":
			tableName = "supply_Table";
			break;
		case "1중대":
			tableName = "supply_Table_1";
			break;
		case "2중대":
			tableName = "supply_Table_2";
			break;
		case "3중대":
			tableName = "supply_Table_3"; 
			break;
		}
		
		Timestamp supply_r_date = new Timestamp(System.currentTimeMillis());
		String supply_num = request.getParameter("supply_num");
		String supply_r_comments = request.getParameter("consume_reason");
		int supply_r_count = Integer.parseInt(request.getParameter("consume_count"));
		Map<String, String> t_map = new HashMap<String, String>();
		t_map.put("tableName", tableName);
		t_map.put("supply_num", supply_num);
		Supply_TableDTO dto = supply_TableDAO.getTotal(t_map);
		
		int consume_total = dto.getSupply_total() - supply_r_count;
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("tableName", tableName);
		map.put("supply_num", supply_num);
		map.put("supply_total", consume_total);
		supply_TableDAO.setConsume_total(map);
		 
		Supply_ReceiptDTO rec_dto = new Supply_ReceiptDTO();
		rec_dto.setSupply_r_date(supply_r_date);
		rec_dto.setSupply_r_num(supply_num);
		rec_dto.setSupply_r_name(dto.getSupply_name());
		rec_dto.setSupply_r_flag(1);
		rec_dto.setSupply_r_comments(supply_r_comments);
		rec_dto.setSupply_r_consumeCount(supply_r_count);
		rec_dto.setSupply_r_total(consume_total);
		rec_dto.setSupply_group(group);
		rec_dto.setTableName(tableName);
		supply_ReceiptDAO.setConsumeReceipt(rec_dto);
		response.getWriter().write("0");
	}
	
	
}
