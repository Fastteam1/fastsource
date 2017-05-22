/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vnpt.media.efinder.controller;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import vnpt.media.efinder.dao.GameCategoryDAO;
import vnpt.media.efinder.model.GameCategoryInfo;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import vnpt.media.efinder.model.ResponseInfo;
import vnpt.media.efinder.util.Utils;

/**
 *
 * @author vnpt2
 */
@Controller
// Cần thiết cho Hibernate Transaction.
@Transactional
// Cần thiết để sử dụng RedirectAttributes
@EnableWebMvc
public class GameCategoryController {

    @Autowired
    private GameCategoryDAO gameCategoryDAO;

    @InitBinder
    public void myInitBinder(WebDataBinder dataBinder) {
        Object target = dataBinder.getTarget();
        if (target == null) {
            return;
        }
        System.out.println("Target=" + target);

    }

//    @RequestMapping(value = {"/gameCategoryList"}, method = RequestMethod.POST)
//    public String gameCategory(Model model, @RequestParam(value = "gameCateId", defaultValue = "0") long id) {
//        GameCategoryInfo gameCategoryInfo = null;
//
//        System.out.println("GameCateId: " + id);
//
//        if (id > 0) {
//            gameCategoryInfo = gameCategoryDAO.findGameCategoryInfo(id);
//        }
//        if (gameCategoryInfo == null) {
//            gameCategoryInfo = new GameCategoryInfo();
//            gameCategoryInfo.setNewGameCate(true);
//        }
//        model.addAttribute("gameCategoryForm", gameCategoryInfo);
//
//        if (gameCategoryInfo.getGameCateId() == 0) {
//            model.addAttribute("formTitle", "Thêm thể loại Game");
//        } else {
//            model.addAttribute("formTitle", "Cập nhật thể loại Game");
//        }
//
//        return "gamecate/gameCategory";
//    }
    // POST: Save gameCategory
    // 
    @RequestMapping(value = {"/gameCategory"}, method = RequestMethod.POST, produces = "application/json; charset=utf-8")
    // Avoid UnexpectedRollbackException (See more explanations)
    // Tránh ngoại lệ: UnexpectedRollbackException (Xem giải thích thêm).
    @Transactional(propagation = Propagation.NEVER)
    public @ResponseBody
    String gameCategorySave(Model model, //
            @RequestBody GameCategoryInfo gameCategoryInfo, //
            BindingResult result, //
            final RedirectAttributes redirectAttributes) {

        System.out.println("getDescription: " + gameCategoryInfo.getDescription());
        System.out.println("getGameCateId: " + gameCategoryInfo.getGameCateId());
        System.out.println("getGameCateName: " + gameCategoryInfo.getGameCateName());

        if (result.hasErrors()) {
            System.out.println("Có lỗi binding ");
            return "Có lỗi xảy ra trong quá trình lưu dữ liệu!";
        }
        try {
            gameCategoryDAO.save(gameCategoryInfo);
            System.out.println("Luu thanh cong du lieu ------>");
        } catch (Exception e) {
            System.out.println("Loi Try catch");
            return "Có lỗi xảy ra trong quá trình lưu dữ liệu!";
        }
        if (gameCategoryInfo.getGameCateId() == 0) {
            return "Thêm mới dữ liệu thành công. |success";
        } else {
            return "Cập nhật dữ liệu thành công. |success";
        }
    }

    // Danh sách gameCate
    @RequestMapping({"/gameCategoryList"})
    public String listGameCategoryHandler(Model model, //
            @RequestParam(value = "name", defaultValue = "") String likeName,
            @RequestParam(value = "page", defaultValue = "1") int page, HttpServletRequest request) {
//        final int maxResult = 5;
//        final int maxNavigationPage = 10;
//
//        ResponseInfo customerInfoList =  Utils.getCustomerListInSession(request);
//        if (customerInfoList.getData() == null) {
//            return "/forms/login";
//        }
        
        List<GameCategoryInfo> result = gameCategoryDAO.queryGameCategorys();

        model.addAttribute("listGameCategorys", result);
        return "/gamecate/gameCategoryList";
    }

}
