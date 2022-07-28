package io.github.gotooooo.app;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import io.github.gotooooo.lib.Lib;

@SpringBootApplication
public class AppApplication {

  public static void main(String[] args) {
    SpringApplication.run(AppApplication.class, args);
    System.out.println(Lib.hello());
  }

}
