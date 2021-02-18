desc user ;
desc user_active ;
desc simple_user ;
desc company_user ;
desc company_contact_person ;
desc contact ;
desc desginer ;
desc category ;
desc product ;
desc product_rating_review ;
desc product_comment ;
desc comment_like ;
desc comment_dislike ;
desc shopping ;
desc shopping_cart ;
desc wishlist ;
desc billing_addr ;
desc credit_card ;
desc credit_card_trim ;
desc payment ;
desc invoice_product;
desc invoice_product_history;
desc order_item;
desc purchase_item;
desc notice;
desc visited_users_count;
desc visited_users_chart;
desc admin;


1. user
+------------------+---------------+------+-----+------------------------------+----------------+
| Field            | Type          | Null | Key | Default                      | Extra          |
+------------------+---------------+------+-----+------------------------------+----------------+
| user_id          | int(11)       | NO   | PRI | NULL                         | auto_increment |
| user_type        | varchar(100)  | YES  |     | NULL                         |                |
| first_name       | varchar(200)  | YES  |     | NULL                         |                |
| surname          | varchar(100)  | YES  |     | NULL                         |                |
| email            | varchar(200)  | YES  | UNI | NULL                         |                |
| password         | varchar(500)  | YES  |     | NULL                         |                |
| re_type_password | varchar(500)  | YES  |     | NULL                         |                |
| picture_url      | varchar(1000) | YES  |     | images/web_icon/ps_small.png |                |
+------------------+---------------+------+-----+------------------------------+----------------+


2. user_active
+------------------+---------------+------+-----+---------+----------------+
| Field            | Type          | Null | Key | Default | Extra          |
+------------------+---------------+------+-----+---------+----------------+
| active_id        | int(11)       | NO   | PRI | NULL    | auto_increment |
| active           | tinyint(1)    | YES  |     | 0       |                |
| enter_datetime   | varchar(1000) | YES  |     | NULL    |                |
| exit_datetime    | varchar(1000) | YES  |     | NULL    |                |
| stay_amount_time | varchar(500)  | YES  |     | NULL    |                |
| user_id          | int(11)       | NO   | MUL | NULL    |                |
+------------------+---------------+------+-----+---------+----------------+



3. simple_user
+----------------+--------------+------+-----+---------+----------------+
| Field          | Type         | Null | Key | Default | Extra          |
+----------------+--------------+------+-----+---------+----------------+
| simple_user_id | int(11)      | NO   | PRI | NULL    | auto_increment |
| dob            | varchar(100) | YES  |     | NULL    |                |
| gender         | varchar(100) | YES  |     | NULL    |                |
| country        | varchar(100) | YES  |     | NULL    |                |
| city           | varchar(100) | YES  |     | NULL    |                |
| state          | varchar(200) | YES  |     | NULL    |                |
| permanent_addr | varchar(500) | YES  |     | NULL    |                |
| current_addr   | varchar(500) | YES  |     | NULL    |                |
| zip            | varchar(100) | YES  |     | NULL    |                |
| user_id        | int(11)      | NO   | MUL | NULL    |                |
+----------------+--------------+------+-----+---------+----------------+


4. company_user
+---------------------+---------------+------+-----+---------+----------------+
| Field               | Type          | Null | Key | Default | Extra          |
+---------------------+---------------+------+-----+---------+----------------+
| company_user_id     | int(11)       | NO   | PRI | NULL    | auto_increment |
| company_name        | varchar(200)  | YES  |     | NULL    |                |
| country             | varchar(100)  | YES  |     | NULL    |                |
| city                | varchar(100)  | YES  |     | NULL    |                |
| company_address     | varchar(500)  | YES  |     | NULL    |                |
| company_type        | varchar(100)  | YES  |     | NULL    |                |
| business_license_no | varchar(200)  | YES  |     | NULL    |                |
| business_descr      | varchar(1000) | YES  |     | NULL    |                |
| website_url         | varchar(1000) | YES  |     | NULL    |                |
| user_id             | int(11)       | NO   | MUL | NULL    |                |
+---------------------+---------------+------+-----+---------+----------------+

5. company_contact_person
+--------------------+--------------+------+-----+---------+----------------+
| Field              | Type         | Null | Key | Default | Extra          |
+--------------------+--------------+------+-----+---------+----------------+
| person_id          | int(11)      | NO   | PRI | NULL    | auto_increment |
| person_name        | varchar(200) | YES  |     | NULL    |                |
| person_email       | varchar(100) | YES  |     | NULL    |                |
| person_designation | varchar(100) | YES  |     | NULL    |                |
| person_mobile      | varchar(100) | YES  |     | NULL    |                |
| company_user_id    | int(11)      | NO   | MUL | NULL    |                |
+--------------------+--------------+------+-----+---------+----------------+

6. contact
+--------------+---------------+------+-----+---------+----------------+
| Field        | Type          | Null | Key | Default | Extra          |
+--------------+---------------+------+-----+---------+----------------+
| contact_id   | int(11)       | NO   | PRI | NULL    | auto_increment |
| fullname     | varchar(200)  | YES  |     | NULL    |                |
| email        | varchar(200)  | YES  |     | NULL    |                |
| msg          | varchar(5000) | YES  |     | NULL    |                |
| msg_datetime | varchar(200)  | YES  |     | NULL    |                |
| active       | tinyint(1)    | YES  |     | 1       |                |
| user_id      | int(11)       | NO   | MUL | NULL    |                |
+--------------+---------------+------+-----+---------+----------------+


7. desginer
+-------------+---------------+------+-----+---------------------------------+----------------+
| Field       | Type          | Null | Key | Default                         | Extra          |
+-------------+---------------+------+-----+---------------------------------+----------------+
| desginer_id | int(11)       | NO   | PRI | NULL                            | auto_increment |
| first_name  | varchar(200)  | YES  |     | NULL                            |                |
| surname     | varchar(100)  | YES  |     | NULL                            |                |
| type        | varchar(100)  | YES  |     | NULL                            |                |
| msg         | varchar(2000) | YES  |     | Hi                              |                |
| phone       | varchar(255)  | YES  |     | 017-xxxxxxxxx                   |                |
| linkedin    | varchar(255)  | YES  |     | https://linkedin.com/in/xxx     |                |
| facebook    | varchar(255)  | YES  |     | https://facebook.com/xxx        |                |
| email       | varchar(255)  | YES  |     | xxx@gmail.com                   |                |
| picture_url | varchar(255)  | YES  |     | images/web_icon/img_avatar2.png |                |
+-------------+---------------+------+-----+---------------------------------+----------------+


8. category
+-------------+--------------+------+-----+---------+----------------+
| Field       | Type         | Null | Key | Default | Extra          |
+-------------+--------------+------+-----+---------+----------------+
| category_id | int(11)      | NO   | PRI | NULL    | auto_increment |
| name        | varchar(100) | YES  |     | NULL    |                |
+-------------+--------------+------+-----+---------+----------------+


9. product
+-----------------+---------------+------+-----+---------+----------------+
| Field           | Type          | Null | Key | Default | Extra          |
+-----------------+---------------+------+-----+---------+----------------+
| product_id      | int(11)       | NO   | PRI | NULL    | auto_increment |
| type            | varchar(100)  | YES  |     | NULL    |                |
| name            | varchar(100)  | YES  |     | NULL    |                |
| uploadDate      | varchar(255)  | YES  |     | NULL    |                |
| total_stock     | int(10)       | YES  |     | NULL    |                |
| current_stock   | int(10)       | YES  |     | NULL    |                |
| keyword         | varchar(5000) | YES  |     | NULL    |                |
| longDescription | text          | YES  |     | NULL    |                |
| unitPrice       | decimal(10,2) | YES  |     | NULL    |                |
| alternatePrice  | decimal(10,2) | YES  |     | NULL    |                |
| saveMoney       | decimal(10,2) | YES  |     | NULL    |                |
| percentRate     | int(5)        | YES  |     | NULL    |                |
| header          | text          | YES  |     | NULL    |                |
| isTaxed         | tinyint(1)    | YES  |     | 0       |                |
| largeImage      | varchar(500)  | YES  |     | NULL    |                |
| desginer_id     | int(11)       | NO   | MUL | NULL    |                |
| category_id     | int(11)       | NO   | MUL | NULL    |                |
+-----------------+---------------+------+-----+---------+----------------+


10. product_rating_review
+------------------+---------------+------+-----+---------+----------------+
| Field            | Type          | Null | Key | Default | Extra          |
+------------------+---------------+------+-----+---------+----------------+
| rating_review_id | int(11)       | NO   | PRI | NULL    | auto_increment |
| ratings          | int(2)        | YES  |     | 0       |                |
| reviews          | int(2)        | YES  |     | 0       |                |
| point            | decimal(10,2) | YES  |     | 0.00    |                |
| oneStar          | int(2)        | YES  |     | 0       |                |
| twoStar          | int(2)        | YES  |     | 0       |                |
| threeStar        | int(2)        | YES  |     | 0       |                |
| fourStar         | int(2)        | YES  |     | 0       |                |
| fiveStar         | int(2)        | YES  |     | 0       |                |
| product_id       | int(11)       | NO   | MUL | NULL    |                |
+------------------+---------------+------+-----+---------+----------------+


11. product_comment
+------------------+--------------+------+-----+---------+----------------+
| Field            | Type         | Null | Key | Default | Extra          |
+------------------+--------------+------+-----+---------+----------------+
| comment_id       | int(11)      | NO   | PRI | NULL    | auto_increment |
| like_count       | int(11)      | YES  |     | 0       |                |
| dislike_count    | int(11)      | YES  |     | 0       |                |
| rating           | int(2)       | YES  |     | 0       |                |
| shortDescription | varchar(700) | YES  |     |         |                |
| longDescription  | text         | YES  |     | NULL    |                |
| commentDate      | varchar(255) | YES  |     |         |                |
| product_id       | int(11)      | NO   | MUL | NULL    |                |
| user_id          | int(11)      | NO   | MUL | NULL    |                |
+------------------+--------------+------+-----+---------+----------------+


12. comment_like
+------------+---------+------+-----+---------+----------------+
| Field      | Type    | Null | Key | Default | Extra          |
+------------+---------+------+-----+---------+----------------+
| like_id    | int(11) | NO   | PRI | NULL    | auto_increment |
| comment_id | int(11) | NO   | MUL | NULL    |                |
| user_id    | int(11) | NO   | MUL | NULL    |                |
+------------+---------+------+-----+---------+----------------+


13. comment_dislike
+------------+---------+------+-----+---------+----------------+
| Field      | Type    | Null | Key | Default | Extra          |
+------------+---------+------+-----+---------+----------------+
| dislike_id | int(11) | NO   | PRI | NULL    | auto_increment |
| comment_id | int(11) | NO   | MUL | NULL    |                |
| user_id    | int(11) | NO   | MUL | NULL    |                |
+------------+---------+------+-----+---------+----------------+



14. shopping
+---------------+---------------+------+-----+---------+----------------+
| Field         | Type          | Null | Key | Default | Extra          |
+---------------+---------------+------+-----+---------+----------------+
| shopping_id   | int(11)       | NO   | PRI | NULL    | auto_increment |
| item_count    | int(5)        | YES  |     | 0       |                |
| totalPrice    | decimal(10,2) | YES  |     | 0.00    |                |
| totalSaveMony | decimal(10,2) | YES  |     | 0.00    |                |
| user_id       | int(11)       | NO   | MUL | NULL    |                |
+---------------+---------------+------+-----+---------+----------------+


15. shopping_cart
+-------------+---------+------+-----+---------+----------------+
| Field       | Type    | Null | Key | Default | Extra          |
+-------------+---------+------+-----+---------+----------------+
| cart_id     | int(11) | NO   | PRI | NULL    | auto_increment |
| quantity    | int(5)  | YES  |     | 1       |                |
| shopping_id | int(11) | NO   | MUL | NULL    |                |
| product_id  | int(11) | NO   | MUL | NULL    |                |
| user_id     | int(11) | NO   | MUL | NULL    |                |
+-------------+---------+------+-----+---------+----------------+



16. wishlist
+-------------+---------+------+-----+---------+----------------+
| Field       | Type    | Null | Key | Default | Extra          |
+-------------+---------+------+-----+---------+----------------+
| wishlist_id | int(11) | NO   | PRI | NULL    | auto_increment |
| product_id  | int(11) | NO   | MUL | NULL    |                |
| user_id     | int(11) | NO   | MUL | NULL    |                |
+-------------+---------+------+-----+---------+----------------+


17. billing_addr
+-----------------+--------------+------+-----+---------+----------------+
| Field           | Type         | Null | Key | Default | Extra          |
+-----------------+--------------+------+-----+---------+----------------+
| billing_addr_id | int(11)      | NO   | PRI | NULL    | auto_increment |
| full_name       | varchar(255) | YES  |     | NULL    |                |
| email           | varchar(255) | YES  |     | NULL    |                |
| address         | varchar(255) | YES  |     | NULL    |                |
| city            | varchar(255) | YES  |     | NULL    |                |
| state           | varchar(255) | YES  |     | NULL    |                |
| zip             | int(11)      | YES  |     | NULL    |                |
| user_id         | int(11)      | NO   | MUL | NULL    |                |
+-----------------+--------------+------+-----+---------+----------------+


18. credit_card
+-----------------+--------------+------+-----+---------+----------------+
| Field           | Type         | Null | Key | Default | Extra          |
+-----------------+--------------+------+-----+---------+----------------+
| credit_card_id  | int(11)      | NO   | PRI | NULL    | auto_increment |
| card_name       | varchar(255) | YES  |     | NULL    |                |
| card_number     | varchar(255) | YES  |     | NULL    |                |
| exp_month       | varchar(255) | YES  |     | NULL    |                |
| exp_year        | int(11)      | YES  |     | NULL    |                |
| cvv             | int(11)      | YES  |     | NULL    |                |
| billing_addr_id | int(11)      | NO   | MUL | NULL    |                |
| user_id         | int(11)      | NO   | MUL | NULL    |                |
+-----------------+--------------+------+-----+---------+----------------+


19. credit_card_trim
+---------------------+--------------+------+-----+---------+----------------+
| Field               | Type         | Null | Key | Default | Extra          |
+---------------------+--------------+------+-----+---------+----------------+
| credit_card_trim_id | int(11)      | NO   | PRI | NULL    | auto_increment |
| card_name           | varchar(255) | YES  |     | NULL    |                |
| card_number         | varchar(255) | YES  |     | NULL    |                |
| exp_month           | varchar(255) | YES  |     | NULL    |                |
| cvv                 | int(11)      | YES  |     | NULL    |                |
| user_id             | int(11)      | NO   | MUL | NULL    |                |
+---------------------+--------------+------+-----+---------+----------------+



20. payment
+----------------+---------------+------+-----+---------+----------------+
| Field          | Type          | Null | Key | Default | Extra          |
+----------------+---------------+------+-----+---------+----------------+
| payment_id     | int(11)       | NO   | PRI | NULL    | auto_increment |
| amount         | decimal(10,2) | YES  |     | NULL    |                |
| credit_card_id | int(11)       | NO   | MUL | NULL    |                |
| user_id        | int(11)       | NO   | MUL | NULL    |                |
+----------------+---------------+------+-----+---------+----------------+


21. invoice_product
+--------------------+---------------+------+-----+---------+----------------+
| Field              | Type          | Null | Key | Default | Extra          |
+--------------------+---------------+------+-----+---------+----------------+
| invoice_product_id | int(11)       | NO   | PRI | NULL    | auto_increment |
| item_count         | int(5)        | YES  |     | 0       |                |
| totalPrice         | decimal(10,2) | YES  |     | 0.00    |                |
| totalSaveMoney     | decimal(10,2) | YES  |     | 0.00    |                |
| credit_card_id     | int(11)       | NO   | MUL | NULL    |                |
| user_id            | int(11)       | NO   | MUL | NULL    |                |
+--------------------+---------------+------+-----+---------+----------------+

22. invoice_product_history
+----------------------------+---------+------+-----+---------+----------------+
| Field                      | Type    | Null | Key | Default | Extra          |
+----------------------------+---------+------+-----+---------+----------------+
| invoice_product_history_id | int(11) | NO   | PRI | NULL    | auto_increment |
| quantity                   | int(5)  | YES  |     | 1       |                |
| product_id                 | int(11) | NO   | MUL | NULL    |                |
| invoice_product_id         | int(11) | NO   | MUL | NULL    |                |
+----------------------------+---------+------+-----+---------+----------------+

23. order_item
+--------------------+---------+------+-----+---------+----------------+
| Field              | Type    | Null | Key | Default | Extra          |
+--------------------+---------+------+-----+---------+----------------+
| order_id           | int(11) | NO   | PRI | NULL    | auto_increment |
| user_id            | int(11) | NO   | MUL | NULL    |                |
| invoice_product_id | int(11) | NO   | MUL | NULL    |                |
| payment_id         | int(11) | NO   | MUL | NULL    |                |
+--------------------+---------+------+-----+---------+----------------+

24. purchase_item
+------------------+---------+------+-----+---------+----------------+
| Field            | Type    | Null | Key | Default | Extra          |
+------------------+---------+------+-----+---------+----------------+
| purchase_item_id | int(11) | NO   | PRI | NULL    | auto_increment |
| order_id         | int(11) | NO   | MUL | NULL    |                |
| product_id       | int(11) | NO   | MUL | NULL    |                |
| user_id          | int(11) | NO   | MUL | NULL    |                |
+------------------+---------+------+-----+---------+----------------+


25. notice
+-------------+---------------+------+-----+---------+----------------+
| Field       | Type          | Null | Key | Default | Extra          |
+-------------+---------------+------+-----+---------+----------------+
| notice_id   | int(11)       | NO   | PRI | NULL    | auto_increment |
| large_msg   | varchar(1000) | YES  |     | NULL    |                |
| small_msg   | varchar(255)  | YES  |     | NULL    |                |
| notice_date | varchar(255)  | YES  |     | NULL    |                |
| active      | tinyint(1)    | YES  |     | 1       |                |
| user_id     | int(11)       | NO   | MUL | NULL    |                |
+-------------+---------------+------+-----+---------+----------------+

26. visited_users_count
+------------------------+---------+------+-----+---------+----------------+
| Field                  | Type    | Null | Key | Default | Extra          |
+------------------------+---------+------+-----+---------+----------------+
| visited_users_count_id | int(11) | NO   | PRI | NULL    | auto_increment |
| user_id                | int(11) | NO   | MUL | NULL    |                |
+------------------------+---------+------+-----+---------+----------------+

27. visited_users_chart
+------------------------+--------------+------+-----+---------+----------------+
| Field                  | Type         | Null | Key | Default | Extra          |
+------------------------+--------------+------+-----+---------+----------------+
| visited_users_chart_id | int(11)      | NO   | PRI | NULL    | auto_increment |
| visited_users_count    | int(11)      | YES  |     | 0       |                |
| date_day               | varchar(255) | YES  |     | NULL    |                |
+------------------------+--------------+------+-----+---------+----------------+

28. admin
+-------------+--------------+------+-----+---------------------------------+----------------+
| Field       | Type         | Null | Key | Default                         | Extra          |
+-------------+--------------+------+-----+---------------------------------+----------------+
| admin_id    | int(11)      | NO   | PRI | NULL                            | auto_increment |
| name        | varchar(100) | YES  |     | NULL                            |                |
| email       | varchar(255) | YES  | UNI | NULL                            |                |
| password    | varchar(500) | YES  |     | NULL                            |                |
| last_login  | varchar(255) | YES  |     |                                 |                |
| isActive    | tinyint(1)   | YES  |     | 0                               |                |
| picture_url | varchar(255) | YES  |     | images/web_icon/img_avatar2.png |                |
+-------------+--------------+------+-----+---------------------------------+----------------+









