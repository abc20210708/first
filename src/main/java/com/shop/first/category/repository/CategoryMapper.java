package com.shop.first.category.repository;

import com.shop.first.category.domain.Category;

import java.util.List;

public interface CategoryMapper {

    //전체 카테고리 조회
    List<Category> getCategory();
}
