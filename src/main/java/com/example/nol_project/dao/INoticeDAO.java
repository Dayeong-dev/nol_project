package com.example.nol_project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.nol_project.dto.NoticeDTO;

@Mapper
public interface INoticeDAO {

    @Select("SELECT nno, adminId, title, content FROM nol_notice ORDER BY nno DESC")
    List<NoticeDTO> selectAll();

    @Select("SELECT nno, adminId, title, content FROM nol_notice WHERE nno = #{nno}")
    NoticeDTO selectByNno(int nno);

    @Insert("INSERT INTO nol_notice (nno, adminId, title, content) VALUES (seq_nol_notice.NEXTVAL, #{adminId}, #{title}, #{content})")
    void insert(NoticeDTO notice);

    @Update("UPDATE nol_notice SET title = #{title}, content = #{content} WHERE nno = #{nno}")
    void NoticeUpdate(NoticeDTO notice);

    @Delete("DELETE FROM nol_notice WHERE nno = #{nno}")
    void delete(int nno);

}
