package com.giveandtake.controller;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.giveandtake.dao.ItemDao;
import com.giveandtake.daoimpl.ItemDaoImpl;
import com.giveandtakemodel.Item;


@Controller
public class ItemSortController {

    @RequestMapping("/ItemSortController")
    public String itemSort(
            @RequestParam(name="category", required=false) String category,
            @RequestParam(name="condition", required=false) String condition,
            @RequestParam(name="dateSort", required=false) String dateSort,
            @RequestParam(name="type", required=false) String type,
            Model model) {

        ItemDao itemDao = new ItemDaoImpl();
        List<Item> items = itemDao.getAllItemRequestHasAccepted();

        // --- FILTERS ---
        if (category != null && !category.isEmpty()) {
            items.removeIf(i -> !category.equals(i.getCategory()));
        }

        if (condition != null && !condition.isEmpty()) {
            items.removeIf(i -> !condition.equals(i.getCondition()));
        }

        if (type != null && !type.isEmpty()) {
            items.removeIf(i -> !type.equals(i.getType()));
        }

        // --- SORT ---
        if (dateSort != null) {
            switch (dateSort) {
                case "NewestFirst":
                    Collections.sort(items, Comparator.comparing(Item::getAddedDate).reversed());
                    break;
                case "OldestFirst":
                    Collections.sort(items, Comparator.comparing(Item::getAddedDate));
                    break;
            }
        }

        // --- ADD ATTRIBUTES TO JSP ---
        model.addAttribute("allItem", items);
        model.addAttribute("selectedCategory", category);
        model.addAttribute("selectedCondition", condition);
        model.addAttribute("selectedDateSort", dateSort);
        model.addAttribute("selectedType", type);

        return "user/browse-items";
    }
}
