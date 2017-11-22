package ki.mo.ddi.noticeModel;

import java.util.List;
import java.util.Map;

public interface MnoticeDAO {
	
	public void insertNotice(MnoticeDTO dto);  // insert
	
	public MnoticeDTO getNoticeByNum(int num);
	
	public List<MnoticeDTO> searchNoticeList(Map map);
	
	public void updateNotice(MnoticeDTO dto);  //update
	
	public void deleteNotice(int num);  //delete
	
	public void updateHit(int num);
	
	public int getListCount();
	
	public List<MnoticeDTO> noticeList();

	public List<MnoticeDTO> selectAll(Map<Object, Object> map);

	public List<MnoticeDTO> selectDeptAll(Map<Object, Object> map);

	public int getDeptListCount(String dept);

}
