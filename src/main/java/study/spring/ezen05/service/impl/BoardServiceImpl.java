package study.spring.ezen05.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import lombok.extern.slf4j.Slf4j;
import study.spring.ezen05.model.Board;
import study.spring.ezen05.service.BoardService;



@Service
@Slf4j
public class BoardServiceImpl implements BoardService {
	
		/** MyBatis */
		// --> 
		@Autowired
		SqlSession sqlSession;
		

		/**
		 * 게시판 데이터 상세 조회
		 * 
		 * @param Board 조회할 게시판의 일련번호를 담고 있는 Beans
		 * @return 조회된 데이터가 저장된 Beans
		 * @throws Exception
		 */
		@Override
		public Board getBoardItem(Board input) throws Exception {
			Board result = null;

			try {
				result = sqlSession.selectOne("BoardMapper.selectItem", input);

				if (result == null) {
					throw new NullPointerException("result=null");
				}
			} catch (NullPointerException e) {
				log.error(e.getLocalizedMessage());
				throw new Exception("조회된 데이터가 없습니다.");
			} catch (Exception e) {
				log.error(e.getLocalizedMessage());
				throw new Exception("데이터 조회에 실패했습니다.");
			}

			return result;
		}
		
		/**
		 * 게시판 데이터 목록 조회
		 * 
		 * @return 조회 결과에 대한 컬렉션
		 * @throws Exception
		 */
		@Override
		public List<Board> getBoardList(Board input) throws Exception {
			List<Board> result = null;

			try {
				result = sqlSession.selectList("BoardMapper.selectList", input);

				if (result == null) {
					throw new NullPointerException("result=null");
				}
			} catch (NullPointerException e) {
				log.error(e.getLocalizedMessage());
				throw new Exception("조회된 데이터가 없습니다.");
			} catch (Exception e) {
				log.error(e.getLocalizedMessage());
				throw new Exception("데이터 조회에 실패했습니다.");
			}

			return result;
		}

		/**
		 * 게시판 데이터가 저장되어 있는 갯수 조회
		 * 
		 * @return int
		 * @throws Exception
		 */
		@Override
		public int getBoardCount(Board input) throws Exception {
			int result = 0;

			try {
				result = sqlSession.selectOne("BoardMapper.selectCountAll", input);

			} catch (Exception e) {
				log.error(e.getLocalizedMessage());
				throw new Exception("데이터 조회에 실패했습니다.");
			}

			return result;
		}
		
		/**
		 * 
		 */
		@Override
		public int addBoard(Board input) throws Exception {
			int result = 0;

			try {
				result = sqlSession.insert("BoardMapper.insertItem", input);

				if (result == 0) {
					throw new NullPointerException("result=0");
				}
			} catch (NullPointerException e) {
				log.error(e.getLocalizedMessage());
				throw new Exception("저장된 데이터가 없습니다.");
			} catch (Exception e) {
				log.error(e.getLocalizedMessage());
				throw new Exception("데이터 저장에 실패했습니다.");
			
			}

			return result;
		}

		@Override
		public int editBoard(Board input) throws Exception {
			int result = 0;

			try {
				result = sqlSession.update("BoardMapper.updateItem", input);

				if (result == 0) {
					throw new NullPointerException("result=0");
				}
			} catch (NullPointerException e) {
				
				log.error(e.getLocalizedMessage());
				throw new Exception("수정된 데이터가 없습니다.");
			} catch (Exception e) {
				
				log.error(e.getLocalizedMessage());
				throw new Exception("데이터 수정에 실패했습니다.");
			} 

			return result;
		}

		@Override
		public int deleteBoard(Board input) throws Exception {
			int result = 0;

			try {
				// 교수 삭제 전 자신을 참조하는 학생들의 profno컬럼을 null로 수정
				sqlSession.update("StudentMapper.unsetBoard", input);
				
				result = sqlSession.delete("BoardMapper.deleteItem", input);

				if (result == 0) {
					throw new NullPointerException("result=0");
				}
			} catch (NullPointerException e) {
				
				log.error(e.getLocalizedMessage());
				throw new Exception("삭제된 데이터가 없습니다.");
			} catch (Exception e) {
				
				log.error(e.getLocalizedMessage());
				throw new Exception("데이터 삭제에 실패했습니다.");
			} 

			return result;
		}

	

}
