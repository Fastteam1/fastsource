/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vnpt.media.efinder.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import vnpt.media.efinder.dao.GameCategoryDAO;
import vnpt.media.efinder.dao.GameTemplateDAO;
import vnpt.media.efinder.model.GameCategoryInfo;
import vnpt.media.efinder.model.GameTemplateInfo;

/**
 *
 * @author vnpt2
 */
@Controller
// Cần thiết cho Hibernate Transaction.
@Transactional
// Cần thiết để sử dụng RedirectAttributes
@EnableWebMvc
public class GameTemplateController {

    @Autowired
    private GameTemplateDAO gameTemplateDAO;
    @Autowired
    private GameCategoryDAO gameCategoryDAO;

    @InitBinder
    public void myInitBinder(WebDataBinder dataBinder) {
        Object target = dataBinder.getTarget();
        if (target == null) {
            return;
        }
        System.out.println("Target=" + target);

        DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
        CustomDateEditor orderDateEditor = new CustomDateEditor(dateFormat, true);
        dataBinder.registerCustomEditor(Date.class, orderDateEditor);

    }


    @RequestMapping(value = {"/gameTemplate"}, method = RequestMethod.POST, produces = "application/json; charset=utf-8")
    @Transactional(propagation = Propagation.NEVER)
    public @ResponseBody
    String gameTemplateSave(Model model, //
            @RequestBody GameTemplateInfo gameTemplateInfo, //
            BindingResult result, //
            final RedirectAttributes redirectAttributes) {

        System.out.println("GameTemplateInfo1" + gameTemplateInfo);
        System.out.println("getGameTempId" + gameTemplateInfo.getGameTempId());
        System.out.println("getGameTempName" + gameTemplateInfo.getGameTempName());
        System.out.println("getDescription" + gameTemplateInfo.getDescription());
        System.out.println("Ststuas" + gameTemplateInfo.isStatus());
        System.out.println("isIsQuestion" + gameTemplateInfo.isIsQuestion());
        System.out.println("getGameCateId" + gameTemplateInfo.getGameCateId());
        if (result.hasErrors()) {
            System.out.println("Có lỗi binding ");
            return "Có lỗi xảy ra trong quá trình lưu dữ liệu!";
        }
        try {
            gameTemplateDAO.save(gameTemplateInfo);
            System.out.println("Luu thanh cong du lieu ------>");
        } catch (Exception e) {
            System.out.println("Loi Try catch");
            return "Có lỗi xảy ra trong quá trình lưu dữ liệu!";
        }
        if (gameTemplateInfo.getGameTempId() == 0) {
            return "Thêm mới dữ liệu thành công. |success";
        } else {
            return "Cập nhật dữ liệu thành công. |success";
        }
    }

    
    @RequestMapping({"/gameTemplateList"})
    public String listGameTemplateHandler(Model model, //
            @RequestParam(value = "name", defaultValue = "") String likeName,
            @RequestParam(value = "page", defaultValue = "1") int page) {
        List<GameTemplateInfo> result = gameTemplateDAO.queryGameTemplates();
        model.addAttribute("listGameTemplates", result);
        List<GameCategoryInfo> listObject = gameCategoryDAO.queryGameCategorys();
        JSONArray jsonObject = JSONArray.fromObject(listObject);
        String jsonStr = jsonObject.toString();
        model.addAttribute("listName", jsonStr);
        System.out.println("jsonStr: " + jsonStr);
        return "/gameTemp/gameTemplateList";
    }

//    @Secured("ROLE_PARTNER")
//    @RequestMapping(value = "/addPerson",
//            method = RequestMethod.POST,
//            headers = {"Content-type=application/json"})
//    @ResponseBody
//    public JsonResponse addPerson(@RequestBody Person person) {
//        
//        return new JsonResponse("OK", "");
//    }
    //    @RequestMapping(value = {"/gameTemplate1"}, method = RequestMethod.POST)
//    public @ResponseBody
//    GameTemplateInfo1 gameTemplateSave(@RequestBody GameTemplateInfo1 gameTemplateInfo, HttpServletRequest request,
//            HttpServletResponse reponses) {
//        System.out.println("GameTemplateInfo1" + gameTemplateInfo);
//        System.out.println("getGameTempId" + gameTemplateInfo.getGameTempId());
//        System.out.println("getGameTempName" + gameTemplateInfo.getGameTempName());
//        System.out.println("getDescription" + gameTemplateInfo.getDescription());
//        System.out.println("getGameCateId" + gameTemplateInfo.getGameCateId());
//
//        try {
//            //gameTemplateDAO.save(gameTemplateInfo);
//            System.out.println("Luu thanh cong du lieu ------>");
//        } catch (Exception e) {
//            System.out.println("Loi Try catch");
//            return gameTemplateInfo;
//
//        }
//        return gameTemplateInfo;
//    }
//    @RequestMapping(value = "/PostService", method = RequestMethod.POST)
//    public @ResponseBody
//    String PostService(@RequestBody Person person) {
//        System.out.println("getName: " + person.getName());
//        System.out.println("getLocation: " + person.getLocation());
//        System.out.println("getPhone: " + person.getPhone());
//        StringBuilder reponseData = new StringBuilder();
//        reponseData.append("Name: " + person.getName() + " ");
//        reponseData.append("Location: " + person.getLocation() + " ");
//        reponseData.append("Phone: " + person.getPhone());
//
//        return reponseData.toString();
//    }
    
    
    //    private String formGameTemp(Model model, GameTemplateInfo gameTemplateInfo) {
//        List<GameCategoryInfo> listObject = gameCategoryDAO.queryGameCategorys();
//
//        model.addAttribute("listName", listObject);
//        model.addAttribute("gameTemplateForm", gameTemplateInfo);
//
//        if (gameTemplateInfo.getGameTempId() == 0) {
//            model.addAttribute("formTitle", "Thêm mẫu Game");
//        } else {
//            model.addAttribute("formTitle", "Cập nhật mẫu Game");
//        }
//        return "gameTemp/gameTemplate";
//    }
    // POST: Save gameTemplate
    // 
}
