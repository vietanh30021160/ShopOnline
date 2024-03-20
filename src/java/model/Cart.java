/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Vector;


/**
 *
 * @author dell
 */
public class Cart {
    private Vector<Item> items;
    
    public Cart(Vector<Item> items) {
        this.items = items;
    }

    public Cart() {
        items= new Vector<>();
    }

    public Vector<Item> getItems() {
        return items;
    }

    public void setItems(Vector<Item> items) {
        this.items = items;
    }
    public Item getItemById(String id){////
        for(Item i : items){
            if(i.getProduct().getId().equals(id)){
                return i;
            }
        }
        return null;
    }
    
    public int getQuantityById(String id){////
        return getItemById(id).getQuantity();
    }
    // add vafo gio
//    public void addItem(Item t){
//        if(getItemById(t.getProduct().getId())!= null){
//            Item i = getItemById(t.getProduct().getId());
//            i.setQuantity(i.getQuantity()+t.getQuantity());
//        }else{
//            items.add(t);
//        }
//    }
    public void addItem(Item newItem) {
    Item existingItem = getItemById(newItem.getProduct().getId());
    if (existingItem != null) {
        existingItem.setQuantity(existingItem.getQuantity() + newItem.getQuantity());
    } else {
        items.add(newItem);
    }
}
    public void removeItem(String i ){///
        if(getItemById(i)!= null){
           items.remove(getItemById(i));
        }
    }
    public int getTotalMoney(){
        int t =0;
        for(Item i : items){
            t+=i.getQuantity()*i.getPrice();
        }
        return t;
    }
}
