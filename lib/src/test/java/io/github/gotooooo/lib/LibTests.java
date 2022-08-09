package io.github.gotooooo.lib;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

/**
 * Tests for {@link Lib} class.
 */
public class LibTests {

  /**
   * The default constructor test.
   */
  @Test
  @DisplayName("Test default constructor.")
  void testDefaultConstructor() {
    final Lib lib = new Lib();
    assertNotNull(lib);
  }

  /**
   * The {@code hello()} method return hello.
   */
  @Test
  @DisplayName("Test hello.")
  void testHello () {
    String result = Lib.hello();
    System.out.println(result);
    assertEquals("hello", result);
  }
}
