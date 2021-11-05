/* 파일 설명 : 레포지토리(독서모임-개설신청,수정,삭제)
 * 담당자  : 황서연
 * 수정날짜 : 2021.10.28
 * */
package com.kh.bookmate.club.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bookmate.club.model.vo.Club;
import com.kh.bookmate.club.model.vo.ClubAttachment;
import com.kh.bookmate.club.model.vo.ClubTime;
import com.kh.bookmate.common.PageInfo;

@Repository
public class ClubDao {

	public int checkHost(SqlSessionTemplate sqlSession, String hostName) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("clubMapper.checkHost", hostName);
	}

	//1) Club테이블에 넣기
	public int saveStep1(SqlSessionTemplate sqlSession, Club c) {
		// TODO Auto-generated method stub
		return sqlSession.insert("clubMapper.saveStep1_1", c);
	}

	//2) Club_attachment 테이블에 넣기
	public int saveStep1(SqlSessionTemplate sqlSession, ClubAttachment ca) {
		// TODO Auto-generated method stub
		return sqlSession.insert("clubMapper.saveStep1_2", ca);
	}

	public int saveStep2(SqlSessionTemplate sqlSession, Club c) {
		// TODO Auto-generated method stub
		return sqlSession.update("clubMapper.saveStep2_1", c);
	}

	public int saveStep2(SqlSessionTemplate sqlSession, ClubAttachment ca) {
		// TODO Auto-generated method stub
		return sqlSession.update("clubMapper.saveStep2_2", ca);
	}

	public int saveStep3(SqlSessionTemplate sqlSession, Club c) {
		// TODO Auto-generated method stub
		return sqlSession.update("clubMapper.saveStep3_1", c);
	}

	public int saveStep3(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.insert("clubMapper.saveStep3_2", map);
	}

	public int insertClub(SqlSessionTemplate sqlSession, Club c) {
		// TODO Auto-generated method stub
		return sqlSession.update("clubMapper.insertClub", c);
	}

	public ArrayList<Club> selectList3(SqlSessionTemplate sqlSession, String userId, PageInfo pi) {
		// TODO Auto-generated method stub
		
		int offset = (pi.getCurrentPage()-1)*(pi.getBoardLimit());
		
		System.out.println("dao-currentPage: "+ pi.getCurrentPage());
		System.out.println("dao-getBoardLimit " + pi.getBoardLimit());
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		//return (ArrayList)sqlSession.selectList("clubMapper.selectList3", userId);
		
		/*collection으로 하면 페이징 처리가 되지 않는다. sql에서는 9행이 조회되지만 collection처리로 인해 club_no갯수만큼 뽑히기 때문에 되지 않아서 싹 고쳤다.(11.05)*/
		//1. club테이블에서 페이징처리 갯수만큼 뽑아오기
		ArrayList<Club> list1 = (ArrayList)sqlSession.selectList("clubMapper.selectList_club", userId, rowBounds);
		
		//2. 위에서 뽑아온 clubNo를 list에 담는다.
		List<Integer> clubNo1 = new ArrayList<>();
		for(Club c : list1) {
			clubNo1.add(c.getClubNo());
		}
		
		//3. 2에서 담은 list를 club_time테이블에 넘겨서 그 갯수만큼 club_time갯수 조회해오기
		ArrayList<ClubTime> list2 = (ArrayList)sqlSession.selectList("clubMapper.selectList_clubTime", clubNo1); 

		//4. 1에서 받아온 <club>리스트에 3에서 받아온 clubTime정보를 clubNo로 매칭시켜 set해주기
		for(Club c : list1) {
			List<ClubTime> temp = new ArrayList<>();
			for(ClubTime ct : list2) {
				if(c.getClubNo() == ct.getClubNo()) {
					temp.add(ct);
				}
			}
			c.setClubTimes(temp);
		}
		
		for(Club c : list1) {
			System.out.println("club최종 : " + c.toString());
		}
		
		return list1;
	}

	public ArrayList<ClubAttachment> selectPhotoList(SqlSessionTemplate sqlSession, List<Integer> clubNo) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("clubMapper.selectPhotoList", clubNo);
	}

	public int deleteClub3(SqlSessionTemplate sqlSession, List<Integer> clubNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("clubMapper.deleteClub3",clubNo);
	}

	public int selectListCount(SqlSessionTemplate sqlSession, String userId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("clubMapper.selectListCount",userId);
	}

	public ArrayList<Club> selectCateList(SqlSessionTemplate sqlSession, String category) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("clubMapper.selectCateList",category);
	}

}
