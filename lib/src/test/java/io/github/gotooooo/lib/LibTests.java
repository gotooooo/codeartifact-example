package io.github.gotooooo.lib;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

public class LibTests {

  @Test
  @DisplayName("hello test")
  void helloTestSuccessExapmle () {
    String result = Lib.hello();
    System.out.println(result);
    assertEquals("hello", result);
  }
}
