package exampleapi;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/")
public class ExampleApiController {

    @RequestMapping(method = RequestMethod.GET)
    public String exampleAPI() {
        return "Working api endpoint";
    }
}