package com.house.uploadfile.dao;

import com.house.uploadfile.model.UploadFile;

public interface UploadFileMapper {
    int deleteByPrimaryKey(Integer fid);

    int insert(UploadFile record);

    int insertSelective(UploadFile record);

    UploadFile selectByPrimaryKey(Integer fid);

    int updateByPrimaryKeySelective(UploadFile record);

    int updateByPrimaryKey(UploadFile record);
}