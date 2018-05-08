package exampleapi;

import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/")
@RequiredArgsConstructor
public class ExampleApiController {

    @NonNull private final ExampleService exampleService;

    @RequestMapping(method = RequestMethod.GET)
    public String exampleAPI() {
        return exampleService.exampleService();
    }
}