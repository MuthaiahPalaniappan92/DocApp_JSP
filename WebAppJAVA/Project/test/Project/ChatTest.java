/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Project;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Assert;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author c0652674
 */
public class ChatTest {
    
    public ChatTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    @Test
    public void testSomeMethod() {
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }
    
    @Test
    public void testGetSender(){
        Chat c=new Chat();
        c.setSender("x");
        Assert.assertEquals("x", c.getSender());
    }
    
    @Test
    public void testGetReceiver(){
        Chat c=new Chat();
        c.setReceiver("y");
        Assert.assertEquals("y", c.getReceiver());
    }
    
    @Test
    public void testGetMessage(){
        Chat c=new Chat();
        c.setMessage("message");
        Assert.assertEquals("message", c.getMessage());
    }
    
}
