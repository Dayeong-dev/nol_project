package com.example.nol_project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.nol_project.dto.NoticeDTO;

@Mapper
public interface INoticeDAO {

	@Select("SELECT nno, adminId, title, content, isFixed, hit FROM nol_notice ORDER BY isFixed DESC, nno DESC")
    List<NoticeDTO> selectAll();

    @Select("SELECT nno, adminId, title, content, isFixed, hit FROM nol_notice WHERE nno = #{nno}")
    NoticeDTO selectByNno(int nno);

    @Insert("INSERT INTO nol_notice (nno, adminId, title, content, isFixed) VALUES (seq_nol_notice.NEXTVAL, #{adminId}, #{title}, #{content}, #{isFixed})")
    void insert(NoticeDTO notice);

    @Update("UPDATE nol_notice SET title = #{title}, content = #{content}, isFixed = #{isFixed} WHERE nno = #{nno}")
    void NoticeUpdate(NoticeDTO notice);

    @Delete("DELETE FROM nol_notice WHERE nno = #{nno}")
    void delete(int nno);
    
    @Update("UPDATE nol_notice SET hit = hit + 1 WHERE nno = #{nno}")
    void increaseHit(int nno);

 // 전체 공지사항 개수 조회
    @Select("SELECT COUNT(*) FROM nol_notice")
    int countNotices();

    // 페이지 단위 조회
    @Select("""
        SELECT * FROM (
            SELECT ROWNUM AS rn, a.* FROM (
                SELECT nno, adminId, title, content, isFixed, hit 
                FROM nol_notice 
                ORDER BY isFixed DESC, nno DESC
            ) a
            WHERE ROWNUM <= #{end}
        )
        WHERE rn >= #{start}
    """)
    List<NoticeDTO> selectPaged(@Param("start") int start, @Param("end") int end);
}
