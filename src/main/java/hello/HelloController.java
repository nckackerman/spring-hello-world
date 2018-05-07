package hello;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/")
public class HelloController {


    @RequestMapping(method = RequestMethod.GET)
    public String hello(Model model) {
        model.addAttribute("message", "Message passed from api to template. If this text is green, css is working");
        return "hello";
    }
}