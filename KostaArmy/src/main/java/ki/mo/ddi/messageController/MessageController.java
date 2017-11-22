package ki.mo.ddi.messageController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ki.mo.ddi.cadreModel.CadreDAO;
import ki.mo.ddi.cadreModel.CadreDTO;
import ki.mo.ddi.messageModel.MessageDAO;
import ki.mo.ddi.messageModel.MessageDTO;


@Controller
public class MessageController {
	
	@Resource
	private MessageDAO msgDAO;
	@Resource
	private CadreDAO cadreDAO;
	
	
	@RequestMapping("/message_receivedList.do")
	public String receivedList(HttpSession session,Model model, HttpServletResponse response) throws Exception{
		
		String cadre_num = (String)session.getAttribute("cadre_num");
		List<MessageDTO> received_list = msgDAO.getReceivedList(cadre_num);
		model.addAttribute("received_list",received_list);
		return "message/messageMainPage";
	}
	
	
	@RequestMapping("/message_sentList.do")
	public String sentList(HttpSession session, HttpServletResponse response, Model model) throws Exception{
		
		String id = (String)session.getAttribute("id");
		List<MessageDTO> sent_list = msgDAO.getSentList(id);
		model.addAttribute("sent_list", sent_list);
		return "message/messageMainPage";
	}
	
	@RequestMapping("/message_send.do")
	public void sendMessage(HttpServletRequest request,HttpServletResponse response, MessageDTO dto, HttpSession session) throws Exception{
		
		String msg_from_number = (String)session.getAttribute("cadre_num");
		String msg_to_number = request.getParameter("msg_to_number");
		String msg_content = request.getParameter("msg_content");
		Map<String, String> map = new HashMap<String, String>();
		map.put("msg_from_number", msg_from_number);
		map.put("msg_content", msg_content);
		map.put("msg_to_number", msg_to_number);
		msgDAO.sendMsg(map);
		response.getWriter().write(1);
	}

	@RequestMapping("/alramMsg.do")
	public void alramMsg(HttpServletResponse response,  HttpSession session) throws Exception{
	
		String cadre_num = (String)session.getAttribute("cadre_num");
		String cadre_group = (String)session.getAttribute("group");
		String cadre_position = (String)session.getAttribute("position");
		
		int count = msgDAO.alramMsg(cadre_num);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("cadre_group", cadre_group);
		map.put("cadre_position", cadre_position);
		int workCount = msgDAO.alramWorkMsg(map);
		
		response.getWriter().print(count+workCount);
	
	}
	
	@RequestMapping("/messagePage.do")
	public String messageBox(Model model, HttpSession session) {
		
		String cadre_num = (String)session.getAttribute("cadre_num");
		String cadre_group = (String)session.getAttribute("group");
		String cadre_position = (String)session.getAttribute("position");
		List<MessageDTO> sent_list = msgDAO.getSentList(cadre_num);
		List<MessageDTO> received_list = msgDAO.getReceivedList(cadre_num);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("cadre_group", cadre_group);
		map.put("cadre_position", cadre_position);
		List<MessageDTO> work_list = msgDAO.getWorkList(map);
		CadreDTO usersend = cadreDAO.findInfoByNum(cadre_num);
		
		model.addAttribute("usersend", usersend);
		model.addAttribute("sent_list", sent_list);
		model.addAttribute("received_list",received_list);
		model.addAttribute("work_list",work_list);
		
		return "/message/messageMainPage";
	}
	
	@RequestMapping("/Address_AllList.do")
	public void MsgAddrAllList(HttpServletRequest request, HttpServletResponse response, 
			HttpSession session, Model model, CadreDTO dto) throws Exception{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String cadre_num = (String)session.getAttribute("cadre_num");
		List<CadreDTO> addrList = msgDAO.getAddrList(cadre_num);
		model.addAttribute("addrList", addrList);
		response.getWriter().write(getAddrAll(dto,session));
	}
	

	private String getAddrAll(CadreDTO dto, HttpSession session) {
		String cadre_num = (String)session.getAttribute("cadre_num");
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		try {
			ArrayList<CadreDTO> AddrAllList = msgDAO.getAddrList(cadre_num);

			for (int i = 0; i < AddrAllList.size(); i++) {
				result.append("[{\"value\": \"" + AddrAllList.get(i).getCadre_number() + "\"},");
				result.append("{\"value\": \"" + AddrAllList.get(i).getCadre_mmr() + "\"},");
				result.append("{\"value\": \"" + AddrAllList.get(i).getCadre_dept() + "\"},");
				result.append("{\"value\": \"" + AddrAllList.get(i).getCadre_name() + "\"}]");
				if (i != AddrAllList.size() - 1)
					result.append(",");
			}
			result.append("], \"last\":\"" + AddrAllList.get(AddrAllList.size() - 1).getCadre_number() + "\"}");
			return result.toString();
		} catch (Exception e) {
			return result.toString();
		}
	}
	
	
	@RequestMapping("/getDetailView.do")
	public void getDetailView(HttpServletRequest request, CadreDTO dto, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		StringBuffer result = new StringBuffer("");
		int msg_no = Integer.parseInt(request.getParameter("msg_no"));
		int readflag = Integer.parseInt(request.getParameter("readflag"));
		result.append("{\"result\":[");
		try {
			ArrayList<MessageDTO> getDetailList = msgDAO.getDetailView(msg_no);
			
			if(readflag==1 || readflag==3) {
				msgDAO.readMsg(msg_no);
			}
			
			for (int i = 0; i < getDetailList.size(); i++) {
				result.append("[{\"value\": \"" + getDetailList.get(i).getMsg_no() + "\"},");
				result.append("{\"value\": \"" + getDetailList.get(i).getMsg_date() + "\"},");
				result.append("{\"value\": \"" + getDetailList.get(i).getMsg_content().replaceAll(" ", "&nbsp;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") + "\"},");
				result.append("{\"value\": \"" + getDetailList.get(i).getMsg_to_number() + "\"},");
				result.append("{\"value\": \"" + getDetailList.get(i).getMsg_from_number() + "\"}]");
				if (i != getDetailList.size() - 1)
					result.append(",");
			}
			result.append("], \"last\":\"" + getDetailList.get(getDetailList.size() - 1).getMsg_no() + "\"}");
			response.getWriter().write(result.toString());
		} catch (Exception e) {
			response.getWriter().write(result.toString());
		}
	}
	
	@RequestMapping("/CadreAddressKeyword_search.do")
	public void search_CadreAddr(HttpServletRequest request, CadreDTO dto, HttpServletResponse response, HttpSession session) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		
		response.getWriter().write(keySearchAddr(dto, request, session));
		
	}
	
	
	private String keySearchAddr(CadreDTO dto, HttpServletRequest request, HttpSession session) {
		String cadre_num = (String)session.getAttribute("cadre_num");
		String keyword = request.getParameter("keyword");
		StringBuffer result = new StringBuffer("");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("cadre_num", cadre_num);
		map.put("keyword", keyword);
		
		result.append("{\"result\":[");
		try {
			ArrayList<CadreDTO> serachKeywordAddr =  msgDAO.searchAddr(map);

			for (int i = 0; i < serachKeywordAddr.size(); i++) {
				result.append("[{\"value\": \"" + serachKeywordAddr.get(i).getCadre_number() + "\"},");
				result.append("{\"value\": \"" + serachKeywordAddr.get(i).getCadre_mmr() + "\"},");
				result.append("{\"value\": \"" + serachKeywordAddr.get(i).getCadre_dept() + "\"},");
				result.append("{\"value\": \"" + serachKeywordAddr.get(i).getCadre_name() + "\"}]");
				if (i != serachKeywordAddr.size() - 1)
					result.append(",");
			}
			result.append("], \"last\":\"" + serachKeywordAddr.get(serachKeywordAddr.size() - 1).getCadre_number() + "\"}");
			return result.toString();
		} catch (Exception e) {
			return result.toString();
		}
	}
}