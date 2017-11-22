package ki.mo.ddi.supplyController;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import ki.mo.ddi.supplyModel.Supply_BasketDAO;
import ki.mo.ddi.supplyModel.Supply_BasketDTO;
import ki.mo.ddi.supplyModel.Supply_TableDAO;
import ki.mo.ddi.supplyModel.Supply_TableDTO;

@Controller
public class SupplyBasketController {
	@Resource
	private Supply_TableDAO supply_tableDAO;
	@Resource
	private Supply_BasketDAO supply_BasketDAO;
	
	@RequestMapping("/insertBasketSupply.do")
	public void insertBasketSupply(Model model, HttpServletRequest request, HttpServletResponse response, Supply_BasketDTO dto) throws IOException {
		//실시간으로 추가하고 신청완료되면 테이블을 다 비워야함
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		supply_BasketDAO.insertBasketSupply(dto);
		List<Supply_BasketDTO> basketList = supply_BasketDAO.getBasketList();
		for(int i = 0; i < basketList.size(); i++) {
			result.append("[{\"value\": \""+basketList.get(i).getOsupply_num()+"\"},");
			result.append("{\"value\": \""+basketList.get(i).getOsupply_flag()+"\"},");
			result.append("{\"value\": \""+basketList.get(i).getOsupply_name()+"\"},");
			result.append("{\"value\": \""+basketList.get(i).getOsupply_order()+"\"}]");
			if(i != basketList.size() -1) result.append(",");///완료
		}
		result.append("],\"last\":\"" + basketList.get(basketList.size() - 1).getOsupply_name()+"\"}");
		response.getWriter().write(result.toString());
	}
	
	@RequestMapping("/deleteBasketSupply.do")
	public void deleteBasketSupply(HttpServletResponse response, Supply_BasketDTO dto) throws IOException {
		String osupply_num = dto.getOsupply_num();
		supply_BasketDAO.deleteBasketSupply(osupply_num);
		
		List<Supply_BasketDTO> basketList = supply_BasketDAO.getBasketList();
		if(basketList.size() != 0) {
			StringBuffer result = new StringBuffer("");
			result.append("{\"result\":[");
			for(int i = 0; i < basketList.size(); i++) {
				result.append("[{\"value\": \""+basketList.get(i).getOsupply_num()+"\"},");
				result.append("{\"value\": \""+basketList.get(i).getOsupply_flag()+"\"},");
				result.append("{\"value\": \""+basketList.get(i).getOsupply_name()+"\"},");
				result.append("{\"value\": \""+basketList.get(i).getOsupply_order()+"\"}]");
				if(i != basketList.size() -1) result.append(",");///완료
			}
			result.append("],\"last\":\"" + basketList.get(basketList.size() - 1).getOsupply_name()+"\"}");
			response.getWriter().write(result.toString()); 
		}
	} 
	
	@RequestMapping("/Supply_initialization.do")
	public String initialization(Model model, HttpServletRequest request) {
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
		supply_BasketDAO.initialization();
		List<Supply_TableDTO> list = supply_tableDAO.getCurrentSupplyList(tableName); 
		model.addAttribute("list", list);
		return "cadre_supply/supplyList";
	}
}
