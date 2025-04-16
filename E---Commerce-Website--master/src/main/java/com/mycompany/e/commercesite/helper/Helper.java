
package com.mycompany.e.commercesite.helper;


public class Helper {
    
    
    public static String get10Words (String descp){
        
        String [] strs = descp.split(" ");
        
        if(strs.length>10){
            
            String res="";
            for (int i=0; i<10; i++){
                
                res=res+strs[i]+" ";
            }
            return (res+ "...");
            
        }else{
            
            
            return (descp+"...");
        }
    }
}
