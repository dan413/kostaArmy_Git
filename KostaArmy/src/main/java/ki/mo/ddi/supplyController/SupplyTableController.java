package ki.mo.ddi.supplyController;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ki.mo.ddi.supplyModel.Supply_BasketDAO;
import ki.mo.ddi.supplyModel.Supply_TableDAO;
import ki.mo.ddi.supplyModel.Supply_TableDTO;

@Controller
public class SupplyTableController {
	@Resource
	private Supply_TableDAO supply_tableDAO;
	@Resource
	private Supply_BasketDAO supply_basketDAO;
	
	
	@RequestMapping("/SupplyCompleteAdd.do")
	public void SupplyCompleteAdd(HttpServletRequest request, HttpServletResponse response) throws IOException {
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
		
		String[] basket_supply_nums = request.getParameterValues("basket_supply_nums");
		String[] basket_supply_orders = request.getParameterValues("basket_supply_orders");
		if(basket_supply_nums == null || basket_supply_orders == null) {
			response.getWriter().write("0"); 
			return;
		}
		for(int i = 0; i < basket_supply_nums.length; i++) {
			Supply_TableDTO dto = new Supply_TableDTO();
			if(basket_supply_nums[i].length() != 0 || !basket_supply_nums[i].equals("") || basket_supply_orders[i].length() != 0 || !basket_supply_orders[i].equals("")) {
				dto.setTableName(tableName);
				dto.setSupply_num(basket_supply_nums[i]);
				dto.setSupply_order(Integer.parseInt(basket_supply_orders[i]));
				dto.setCadre_group(group);
				supply_tableDAO.SupplyCompleteAdd(dto); 
			}
		}
		supply_basketDAO.initialization();
	}
	
	@RequestMapping("/getCurrentApplyList.do")
	public String getCurrentSupplyList(Model model, HttpServletResponse response, HttpServletRequest request) throws IOException {
		String group = (String)request.getSession().getAttribute("group");
		String tableName = null;
		if(!group.equals("KOSTA대대")) {
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
			List<Supply_TableDTO> list = supply_tableDAO.getCurrentSupplyList(tableName);
			List<Supply_TableDTO> order_list = supply_tableDAO.getCurrentOrderSupplyList(tableName); 
			model.addAttribute("list", list); 
			model.addAttribute("order_list", order_list);
		}
		else {
			int supplyCount_center = supply_tableDAO.getSupplyOrderCountCenter();
			int supplyCount_1 = supply_tableDAO.getSupplyOrderCount1();
			int supplyCount_2 = supply_tableDAO.getSupplyOrderCount2();
			int supplyCount_3 = supply_tableDAO.getSupplyOrderCount3();
			model.addAttribute("supplyCount_center", supplyCount_center); 
			model.addAttribute("supplyCount_1", supplyCount_1); 
			model.addAttribute("supplyCount_2", supplyCount_2); 
			model.addAttribute("supplyCount_3", supplyCount_3); 
		}
		
		return "cadre_supply/supplyList";
	}
	
	@RequestMapping("/order_getCurrentApplyList.do")
	public String order_getCurrentSupplyList(Model model, HttpServletResponse response, HttpServletRequest request) throws IOException {
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
		List<Supply_TableDTO> list = supply_tableDAO.getCurrentSupplyList(tableName);
		List<Supply_TableDTO> order_list = supply_tableDAO.getCurrentOrderSupplyList(tableName); 
		model.addAttribute("list", list);
		model.addAttribute("order_list", order_list);
		
		return "cadre_supply/supplyConsume";
	}
	
	@RequestMapping("/search_supply.do")
	public ModelAndView selectByKey(HttpServletRequest request) throws Exception{
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
		String keyvalue= request.getParameter("keyvalue");
		String arr1 = request.getParameter("s_search_table");
		String arr = request.getParameter("s_search_part");
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("tableName", tableName);
		map.put("arr1", arr1);
		map.put("arr", arr);
		map.put("keyvalue", keyvalue);
		
		List<Supply_TableDTO> list = supply_tableDAO.selectByKey(map);
		List<Supply_TableDTO> order_list = supply_tableDAO.selectByKey(map);
		mav.addObject("list", list);
		mav.addObject("order_list", order_list);
		mav.setViewName("cadre_supply/supplyList");
		
		return mav;
		
	}

	@RequestMapping("/search_supply_order.do")
	public ModelAndView search_supply_order(HttpServletRequest request) throws Exception{
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
		String keyvalue= request.getParameter("keyvalue");
		String arr1 = request.getParameter("s_search_table");
		String arr = request.getParameter("s_search_part");
		Map<String, String> map = new HashMap<String, String>();
		map.put("tableName", tableName);
		map.put("arr1", arr1);
		map.put("arr", arr);
		map.put("keyvalue", keyvalue);
		
		List<Supply_TableDTO> list = supply_tableDAO.selectByKey(map);
		
		mav.addObject("list", list);
		mav.setViewName("cadre_supply/supplyConsume");
		
		return mav;
		
	}
	
	@RequestMapping("/currentSupplyOrder.do")
	public ModelAndView currentOrder(HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView();
		
		String group = request.getParameter("group");
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
		 
		List<Supply_TableDTO> list = supply_tableDAO.selectByOrder(tableName);
		int countByOrder = supply_tableDAO.countByOrder(tableName);
		int agree_count = supply_tableDAO.getAgreeCount(tableName); 
		mav.addObject("list", list);
		mav.addObject("countByOrder", countByOrder);
		mav.addObject("agree_count", agree_count);
		mav.setViewName("cadre_supply/currentSupplyOrder");
		
		return mav;
	}
	
	@RequestMapping("/deleteOrder.do")
	public ModelAndView deleteOrder(HttpServletRequest request, HttpServletResponse response) throws Exception{
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
		Map<String, String> map = new HashMap<String, String>();
		ModelAndView mav = new ModelAndView();
		String spply_num = request.getParameter("supply_num");
		map.put("tableName", tableName);
		map.put("supply_num", spply_num);
		supply_tableDAO.deleteOrder(map);
		List<Supply_TableDTO> list = supply_tableDAO.selectByOrder(tableName);
		int countByOrder = supply_tableDAO.countByOrder(tableName);
		int agree_count = supply_tableDAO.getAgreeCount(tableName); 
		mav.addObject("list", list);
		mav.addObject("countByOrder", countByOrder);
		mav.addObject("agree_count", agree_count);
		mav.setViewName("cadre_supply/currentSupplyOrder");
		return mav;
	}
	
	@RequestMapping("/sign_order.do")
	public void Sign_Order(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{
		String supply_group = request.getParameter("supply_group");
		String tableName = null;
		switch(supply_group) {
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
		String supply_num = request.getParameter("supply_num");
		String supply_name = request.getParameter("supply_name");
		Map<String, String> map = new HashMap<String, String>();
		map.put("tableName", tableName);
		map.put("supply_num", supply_num);
		int supply_order = supply_tableDAO.sign_Order_1(map); 
		Supply_TableDTO dto = new Supply_TableDTO();
		dto.setTableName(tableName);
		dto.setSupply_num(supply_num);
		dto.setSupply_order(supply_order);
		dto.setSupply_name(supply_name);
		dto.setCadre_group(supply_group);
		supply_tableDAO.sign_Order_2(dto);  
		
		response.getWriter().write("0"); 
	}
	@RequestMapping("Sign_Order_Reset.do")
	public void Sign_Order_Reset(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String supply_group = request.getParameter("supply_group");
		String sign_reason = request.getParameter("Sign_reason");
		String supply_num = request.getParameter("supply_num");
		String supply_name = request.getParameter("supply_name");
		String tableName = null;
		switch(supply_group) {
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
	
		Map<String, String> map = new HashMap<String, String>();
		map.put("tableName", tableName);
		map.put("sign_reason", sign_reason);
		map.put("supply_num", supply_num);
		map.put("supply_name", supply_name);
		map.put("cadre_group", supply_group);
		supply_tableDAO.Sign_Order_Reset(map);
		response.getWriter().write("0");
	}
	
	@RequestMapping("/supplyConsumeForm.do")
	public String ConsumeForm(Model model, HttpServletRequest request) {
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
		List<Supply_TableDTO> list = supply_tableDAO.getCurrentSupplyList(tableName);
		model.addAttribute("list", list);
		return "cadre_supply/supplyConsume";
	}
	
	@RequestMapping("/orderGroupView.do")
	public String orderGroupView(HttpServletRequest request, HttpServletResponse response, Model model	) throws Exception {
		String group = request.getParameter("group");
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
		List<Supply_TableDTO> order_list = supply_tableDAO.getCurrentOrderSupplyList(tableName); 
		model.addAttribute("order_list", order_list);
		model.addAttribute("supply_group", group);
		return "cadre_supply/supplyList";
	}
	
	
}
