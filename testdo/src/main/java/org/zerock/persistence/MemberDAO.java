package org.zerock.persistence;

import org.zerock.domain.MemberVO;

public interface MemberDAO {
	
	//서버시간을 읽어온다
	public String getTime();
	
	//회원정보 삽입하기
	public void insertMember(MemberVO vo);

	//특정 회원정보 읽어오기
	public MemberVO readMember(String userid)throws Exception;
  
	
	//로그인 체크기능
	public MemberVO readWithPW(String userid, 
				String userpw)throws Exception;
	
}
