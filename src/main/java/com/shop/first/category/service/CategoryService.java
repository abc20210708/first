package com.shop.first.category.service;

import com.shop.first.category.domain.Category;
import com.shop.first.category.repository.CategoryMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.List;

@Service @Log4j2
@RequiredArgsConstructor
public class CategoryService {

    private final CategoryMapper categoryMapper;

    //카테고리 조회 중간처리
    public List<Category> getCategory() {
        return categoryMapper.getCategory();
    }
}
