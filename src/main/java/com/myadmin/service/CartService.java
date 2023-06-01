package com.myadmin.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.myadmin.dto.Anc;
import com.myadmin.dto.Cart;
import com.myadmin.frame.MyAdminService;
import com.myadmin.mapper.AncMapper;
import com.myadmin.mapper.CartMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class CartService implements MyAdminService<Integer, Cart> {

    @Autowired
    CartMapper mapper;

    public CartService(CartMapper mapper) {
        this.mapper = mapper;
    }


    @Override
    public void register(Cart cart) throws Exception {
        mapper.insert(cart);
    }

    @Override
    public void remove(Integer integer) throws Exception {
        mapper.delete(integer);
    }

    @Override
    public void modify(Cart cart) throws Exception {
        mapper.update(cart);
    }

    @Override
    public Cart get(Integer integer) throws Exception {
        return mapper.select(integer);
    }

    @Override
    public List<Cart> get() throws Exception {
        return mapper.selectall();
    }
}
