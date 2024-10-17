package me.aimpugn.backend.controller

import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.RestController

@RestController
class HomeController {
    @GetMapping("/")
    fun index(@RequestParam(name = "name", required = false, defaultValue = "World") name: String) = "Hello, $name!"
}