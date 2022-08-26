package com.shop.first.category.repository;

import com.shop.first.category.domain.Category;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CategoryMapper {

    //전체 카테고리 조회
    List<Category> getCategory();
}
