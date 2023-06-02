package com.myadmin;

import lombok.extern.slf4j.Slf4j;
import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;


//암호화는 가장 나중에 적용하는게?
@Slf4j
@SpringBootTest
class EncTests2 {

    @Autowired
    private BCryptPasswordEncoder encoder;

    @Test
    void contextLoads() {
        StandardPBEStringEncryptor pbeEnc = new StandardPBEStringEncryptor();
        pbeEnc.setAlgorithm("PBEWithMD5AndDES");
        pbeEnc.setPassword("mykey");

        String url = "jdbc:mysql://localhost:3306/toma";
        String cfr_id = "nv41tzmjwg";
        String cfr_key = "TphoNoEwkohejt9FejMArjZmXi7uvIyRMS5lreJP";
        String enc_cfr_id = pbeEnc.encrypt(cfr_id);
        System.out.println("기존  URL :: " + url + " | 변경 URL :: " + pbeEnc.encrypt(url));
        System.out.println("기존  cfr_id :: " + cfr_id + " | 변경 username :: " + enc_cfr_id);
        System.out.println("기존  cfr_key :: " + cfr_key + " | 변경 password :: " + pbeEnc.encrypt(cfr_key));

        System.out.println(pbeEnc.decrypt("KQce/eAYu0kaEv1Lopuz5l/KUhEZQTwL"));

    }

}