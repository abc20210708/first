package com.shop.first.product.controller;

import com.shop.first.product.domain.Product;
import com.shop.first.product.service.ProductService;
import com.shop.first.productoption.domain.ProductOption;
import com.shop.first.productoption.service.ProductOptionService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

@Controller
@Log4j2
@RequestMapping("/product")
@RequiredArgsConstructor
public class ProductController extends HttpServlet {

    private final ProductService productService;

    private final ProductOptionService productOptionService;

    //상품 상세 조회(화면)
    @GetMapping("/info")
    public String content(int prCode, Model model, HttpSession session) throws Exception{

        log.info("상세조회요청 - (화면)" + prCode + session.getAttribute("loginCustomer") );

        Product product = productService.get(prCode);
        model.addAttribute("p",product);

        List<ProductOption> optionList = productOptionService.getOption(prCode);
        model.addAttribute("opt", optionList);
        log.info("optionList:" +optionList);

        List<Product> productList = productService.getList();
        model.addAttribute("articles", productList);

        return "product/detail_page";
    }

    //상품 검색(화면)
    /*
    @GetMapping("/list")
    public String content(String keyword, Model model, HttpSession session) throws Exception{


    }*/


    //상품 등록 화면 요청(화면)
    @GetMapping("/write")
    public String write(Model model) {
        log.info("/product/write - GET!");

        List<ProductOption> list = productOptionService.getList();
        model.addAttribute("list",list);

        return "product/product_insert";
    }

    //상품 등록 요청 - POST!
    @PostMapping("/write")
    public String fileUpload(MultipartHttpServletRequest request, Product product,
                             @RequestParam("files") MultipartFile[] files) throws Exception  {

        log.info("상픔 등록 요청 - POST!");

        String uploadPath = "C:\\testImg";

        String fileOriginName = "";

        for (int i = 0; i < files.length; i++) {
            fileOriginName = files[i].getOriginalFilename();



            log.info("기존 파일명: "+ fileOriginName);

            SimpleDateFormat formatter = new SimpleDateFormat("YYYYMMDD_HHMMSS_"+i);
            Calendar now = Calendar.getInstance();

            String fileMultiName = "";
            //확장자명
            String extension = fileOriginName.split("\\.")[1];


            fileOriginName = formatter.format(now.getTime())+"."+extension;


            log.info("변경된 파일명 :" +fileOriginName);

            File f = new File(uploadPath+ "\\"+fileOriginName);
            files[i].transferTo(f);

            fileMultiName += fileOriginName;

            if (i == 0) {
                product.setPrThumb(fileMultiName);
                log.info("setPrThumb: " + i + fileMultiName);
            } else if (i == 1) {
                product.setPrImg1(fileMultiName);
                log.info("setPrImg1: " + i + fileMultiName);
            } else if (i == 2) {
                product.setPrImg2(fileMultiName);
                log.info("setPrImg2: " + i + fileMultiName);
            } else if (i == 3) {
                product.setPrImg3(fileMultiName);
                log.info("setPrImg3: " + i + fileMultiName);
            } else if (i == 4) {
                product.setPrImg4(fileMultiName);
                log.info("setPrImg4: " + i + fileMultiName);
            } else if (i == 5) {
                product.setPrImg5(fileMultiName);
                log.info("setPrImg5: " + i + fileMultiName);
            } else {
                fileMultiName += "," + fileOriginName;
            }


            log.info("*"+fileMultiName);
        }

        productService.write(product);
        log.info(product);
        return "redirect:/";
    }











}//
