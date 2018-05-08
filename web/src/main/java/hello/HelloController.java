package hello;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/")
public class HelloController {

    @RequestMapping(method = RequestMethod.GET)
    public String hello(Model model) {
        model.addAttribute("message", "Hello from streamerContracts-backend! If this text is green, both css and thymeleaf are working.");
        return "hello";
    }
}