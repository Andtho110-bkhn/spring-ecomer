package vn.t3h.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Map;

@Controller
@RequestMapping("/auth")
public class AuthController extends BaseController {

    private static final Logger LOGGER = LoggerFactory.getLogger(AuthController.class);

    @RequestMapping(value={"/login"}, method = RequestMethod.GET)
    public String login(@RequestParam(value = "error", required = false, defaultValue = "false") boolean error,
                        Map<String, Object> model,
                        HttpServletRequest httpServletRequest) throws IOException {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if(authentication instanceof UsernamePasswordAuthenticationToken) {
            return home(httpServletRequest);
        }
        if(error) {
            model.put("message", "Login failed. Please check username and password.");
        }
        return "pages/login";
    }

    @RequestMapping(value={"/auto-redirect"}, method = RequestMethod.GET)
    public String home(HttpServletRequest request) throws IOException {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        LOGGER.info(authentication.getName());
        if(request.isUserInRole("BACKEND")) {
            return "admin/index";
        } else {
            return "/";
        }
    }

    @RequestMapping(value={"/accessdenied"}, method = RequestMethod.GET)
    public String accessdenied() throws IOException {
        return "access_denied";
    }
}