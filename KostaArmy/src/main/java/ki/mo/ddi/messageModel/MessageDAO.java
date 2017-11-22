package ki.mo.ddi.messageModel;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import ki.mo.ddi.cadreModel.CadreDTO;

public interface MessageDAO {
	public List<MessageDTO> getWorkList(Map<String, String> map);
	public List<MessageDTO> getMsgList(); // Config msg list
	public List<MessageDTO> getReceivedList(String cadre_num);
	public List<MessageDTO> getSentList(String cadre_num);
	public ArrayList<CadreDTO> getAddrList(String cadre_num);
	public void sendMsg(Map<String, String> map); //send msg list
	public void readMsg(int msg_no); //read msg list
	public void deleteMsg(int msg_no);  //delete msg
	public ArrayList<MessageDTO> getDetailView(int msg_no);
	public int alramMsg(String cadre_num);
	public int alramWorkMsg(Map<String, String> map);
	public MessageDTO getMsgNo(int msg_no);
	public ArrayList<CadreDTO> searchAddr(Map<String, String> map);

}
