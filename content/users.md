---
Title: User Report
Description: This description will go in the meta description tag
Author: Jerome
Date: 2020-05-30
Robots: noindex,nofollow
Template: index
---

# Nouveaux utilisateurs

[db_source query="select count(*) as nb_user from coa_user where date_signin = CURDATE()" db="coach" row="{nb_user} nouveaux utilisateurs aujourd'hui " ]
[db_source query="select count(*) as nb_user from coa_user where date_signin = CURDATE() and is_android= 0" db="coach" row="{nb_user} nouveaux utilisateurs aujourd'hui -- IOS" ]
[db_source query="select count(*) as nb_user from coa_user where date_signin = CURDATE() and join_game =1" db="coach" row="{nb_user} utilisateurs rejoignant une partie" ]
[db_source query="select count(*) as nb_user from coa_user where date_signin = CURDATE() and is_android= 0 and join_game = 1" db="coach" row="{nb_user} utilisateurs rejoignant une partie -- IOS" ]

# Connexion

## Aujourd'hui

[db_source query="select count(*) as nb_user from coa_user where last_login >= DATE_SUB(NOW(), INTERVAL 1 DAY)" db="coach" row="{nb_user} utilisateurs connectés sur la dernière journée" ]
[db_source query="select count(*) as nb_user from coa_user where last_login >= DATE_SUB(NOW(), INTERVAL 1 DAY) and is_android= 0" db="coach" row="{nb_user} utilisateurs connectés sur la dernière journée -- IOS" ]

## Semaine dernière

[db_source query="select count(*) as nb_user from coa_user where last_login >= DATE_SUB(NOW(), INTERVAL 1 WEEK)" db="coach" row="{nb_user} utilisateurs connectés sur la semaine dernière" ]
[db_source query="select count(*) as nb_user from coa_user where last_login >= DATE_SUB(NOW(), INTERVAL 1 WEEK) and is_android= 0" db="coach" row="{nb_user} utilisateurs connectés sur la semaine dernière -- IOS" ]

## Mois dernier

[db_source query="select count(*) as nb_user from coa_user where last_login >= DATE_SUB(NOW(), INTERVAL 1 MONTH)" db="coach" row="{nb_user} utilisateurs connectés sur le dernier mois" ]
[db_source query="select count(*) as nb_user from coa_user where last_login >= DATE_SUB(NOW(), INTERVAL 1 MONTH) and is_android= 0" db="coach" row="{nb_user} utilisateurs connectés sur le dernier mois -- IOS" ]
