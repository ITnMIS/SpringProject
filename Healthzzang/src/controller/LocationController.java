package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/Location")
public class LocationController {

   @RequestMapping("/seoul.do")
   public String seoulHome(){
      return "/Location/seoul";
   }
  
   @RequestMapping("/gyeonggi.do")
   public String geunggiHome(){
      return "/Location/gyeonggi";
   }
   
   @RequestMapping("/yongin.do")
   public String yoonginHome(){
      return "/Location/yongin";
   }
   
   @RequestMapping("/gangbook.do")
   public String gangbookHome(){
      return "/Location/gangbook";
   }
   
   

}