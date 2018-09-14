package org.zerock.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;



@Controller
public class SampleController {

   private static final Logger logger = 
         LoggerFactory.getLogger(SampleController.class);
   
   @RequestMapping("index")
   public void doA(){
      
      logger.info("index called...");
      
   }
   
   @RequestMapping("register")
   
   public void da(){
      logger.info("/register called...");
   
   }
   @RequestMapping("list")
      
      public void list(){
         logger.info("/register called...");
   }
   @RequestMapping("saleList")
   
   public void saleList(){
      logger.info("/register  called...");
   }
   
   @RequestMapping("Home")
   
   public void Home(){
      logger.info("/register  called...");
   }
}

