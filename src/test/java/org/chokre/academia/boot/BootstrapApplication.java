package org.chokre.academia.boot;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

/**
 * @author    Academia<devs@chorke.org>
 * @version   1.0.00.GA
 * @since     1.0.00.GA
 */
@SpringBootApplication
@ComponentScan({"org.chorke.academia.config"})
public class BootstrapApplication {
    
    @SuppressWarnings("unused")
    private static final Logger log = LoggerFactory.getLogger(BootstrapApplication.class);
    
    public static void main(String[] args) throws Exception {
        SpringApplication.run(BootstrapApplication.class, args);
    }
    
}
