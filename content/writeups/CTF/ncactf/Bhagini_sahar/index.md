---
title: "Bhagini Sahar"
date: 2024-09-24
draft: false
Tags:
- CTF
- Bhagini Sahar
- NCA CTF
- cybercena
- OSINT
---

Bhagini Sahar is the CTF challenge related to OSINT hosted by [NCA@Nepal](https://ncateam.xyz/about/). NCA@Nepal is an active CTF and cybersecurity community in Nepal. A short description and image are provided in the challenge.
![description ](description.png)
![image of challenge](chall.png)

Whenever we need to find the geolocation of an image, we can use Google Image Search, Yandex, or Bing. I used Google Images to gather information about the above image, and I discovered that it is located in Chongqing, China

![image of challenge](googlelens1.png)
![chonging](chonging.png)

Now we need to find out the sister city of Chongqing, which is located in Nepal, and the name of its mayor.
![bharatpur city](bharatpur.png)
![mayor of bharatpur](mayor.png)

After gathering all the info we need , we finally got the flag:
```nca{chongqing_bharatpur_renu_dahal}```
