package com.bit.UntitledBistro.service.balju;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bit.UntitledBistro.model.balju.Balju_DAO;
import com.bit.UntitledBistro.model.balju.Balju_DTO;
import com.bit.UntitledBistro.model.balju.Balju_PlanDTO;
import com.bit.UntitledBistro.model.balju.Balju_SaveDTO;

@Service("Balju_Service")
public class Balju_ServiceImpl implements Balju_Service {

	@Autowired
	private Balju_DAO balju_DAO;
	
	@Override
	public void Balju_Insert(Balju_DTO Bdto) {
		balju_DAO.Balju_Insert(Bdto);
		balju_DAO.
	}

	@Override
	public void Balju_Plan_Insert(Balju_PlanDTO BPdto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void Balju_Save_Insert(Balju_SaveDTO BSdto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Balju_DTO> Balju_list(String ORDIN_NUM, String ORDER_NUM) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Balju_PlanDTO> Balju_Plan_list(String ORPLIN_NUM, String ORDPL_ONUM) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Balju_SaveDTO> Balju_Save_list(String ORSP_NUM, String ORSA_NUM) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void Balju_Modify(String ORDIN_NUM, String ORDER_NUM) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void Balju_Plan_Modify(String ORPLIN_NUM, String ORDPL_ONUM) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void Balju_Plan_Save_Modify(String ORSP_NUM, String ORSA_NUM) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void Balju_Delete(String ORDIN_NUM, String ORDER_NUM) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void Balju_Plan_Delete(String ORPLIN_NUM, String ORDPL_ONUM) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void Balju_Plan_Save_Delete(String ORSP_NUM, String ORSA_NUM) {
		// TODO Auto-generated method stub
		
	}

}
