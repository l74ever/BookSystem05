package org.whc.mapper;

import org.whc.pojo.Category;
import org.whc.pojo.Product;

import java.util.List;
import java.util.Map;

public interface CategoryMapper {
    List<Category> findCategoryWithProduct(Map map);
}
