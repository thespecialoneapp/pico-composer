---
Title: Transfert Report
Description: This description will go in the meta description tag
Author: Jerome
Date: 2020-05-30
Robots: noindex,nofollow
Template: index
---

Stats sur les transferts sur les **dernières 24 heures**.

# Grosses Perfs

## 5 Plus gros transferts

|    prix   | joueur | club vendeur | mail vendeur | club acheteur | mail acheteur |
|-----------|:--------:|:--------------:|:--------------:|:---------------:|:--------------:|
[db_source query="SELECT round(price_offer/1000000,1) as price, p.last_name as player, cv.lib_club as vendeur_club,if (uv.email IS NULL, 'IA', uv.email) as vendeur_mail,  cb.lib_club as acheteur_club, if( ub.email IS NULL, 'IA',ub.email) as acheteur_mail from coa_offer_transfer tt join coa_instance_club icv on (tt.id_instance_club_seller = icv.id_instance_club)
join coa_instance_club icb on (tt.id_instance_club_buyer = icb.id_instance_club) left join coa_user uv on (icv.id_user = uv.id_user) left join coa_user ub on (icb.id_user = ub.id_user) join coa_club cv on (icv.id_club = cv.id_club) join coa_club cb on (icb.id_club = cb.id_club) join coa_instance_player ip on (ip.id_instance_player = tt.id_instance_player) join coa_player p on (p.id_player = ip.id_player) where date(date_offer) >= DATE_SUB(CURDATE(), INTERVAL 1 DAY) and accept = 1 order by price_offer DESC LIMIT 5" db="coach" row="|{price}|{player}|{vendeur_club}|{vendeur_mail}|{acheteur_club}|{acheteur_mail}| " ]


## 5 Meilleurs ventes

(Maximise le rapport : *prix du transfert/ valeur du joueur* ) 

|    prix   | valeur | joueur | club vendeur | mail vendeur | club acheteur | mail acheteur |
|-----------|--------|:--------:|:--------------:|:--------------:|:---------------:|:--------------:|
[db_source query="SELECT round(price_offer/1000000,1) as price,round(p.value/1000000,1) as valeur, p.last_name as player, cv.lib_club as vendeur_club,if (uv.email IS NULL, 'IA', uv.email) as vendeur_mail,  cb.lib_club as acheteur_club, if( ub.email IS NULL, 'IA',ub.email) as acheteur_mail from coa_offer_transfer tt join coa_instance_club icv on (tt.id_instance_club_seller = icv.id_instance_club)
join coa_instance_club icb on (tt.id_instance_club_buyer = icb.id_instance_club) left join coa_user uv on (icv.id_user = uv.id_user) left join coa_user ub on (icb.id_user = ub.id_user) join coa_club cv on (icv.id_club = cv.id_club) join coa_club cb on (icb.id_club = cb.id_club) join coa_instance_player ip on (ip.id_instance_player = tt.id_instance_player) join coa_player p on (p.id_player = ip.id_player) where date(date_offer) >= DATE_SUB(CURDATE(), INTERVAL 1 DAY) and accept = 1 order by (price_offer/p.value) DESC LIMIT 5" db="coach" row="|{price}|{valeur}|{player}|{vendeur_club}|{vendeur_mail}|{acheteur_club}|{acheteur_mail}| " ]


## 5 Meilleurs achats

(Maximise le rapport : *valeur du joueur/ prix du transfert* ) 

|    prix   | valeur | joueur | club acheteur | mail acheteur | club vendeur | mail vendeur |
|-----------|--------|:--------:|:--------------:|:--------------:|:---------------:|:--------------:|
[db_source query="SELECT round(price_offer/1000000,1) as price, round(p.value/1000000,1) as valeur, p.last_name as player, cv.lib_club as vendeur_club,if (uv.email IS NULL, 'IA', uv.email) as vendeur_mail,  cb.lib_club as acheteur_club, if( ub.email IS NULL, 'IA',ub.email) as acheteur_mail from coa_offer_transfer tt join coa_instance_club icv on (tt.id_instance_club_seller = icv.id_instance_club)
join coa_instance_club icb on (tt.id_instance_club_buyer = icb.id_instance_club) left join coa_user uv on (icv.id_user = uv.id_user) left join coa_user ub on (icb.id_user = ub.id_user) join coa_club cv on (icv.id_club = cv.id_club) join coa_club cb on (icb.id_club = cb.id_club) join coa_instance_player ip on (ip.id_instance_player = tt.id_instance_player) join coa_player p on (p.id_player = ip.id_player) where date(date_offer) >= DATE_SUB(CURDATE(), INTERVAL 1 DAY) and accept = 1 order by (p.value/price_offer) DESC LIMIT 5" db="coach" row="|{price}|{valeur}|{player}|{acheteur_club}|{acheteur_mail}|{vendeur_club}|{vendeur_mail}| " ]


# Résumé

[db_source query="select count(*) as compte from coa_offer_transfer where accept = 1 and date(date_offer) >= date_sub( curdate(), interval 1 day)" db="coach" row="+ {compte} transferts réalisés sur les dernières 24 heures (user et IA confondu)"]
[db_source query="select round(sum(price_offer)/1000000,1)  as somme from coa_offer_transfer tt JOIN coa_instance_club cc on (tt.id_instance_club_buyer = cc.id_instance_club)
where accept = 1 and date(date_offer) >= date_sub( curdate(), interval 1 day) and cc.id_user IS NOT NULL" db="coach" row="	+ {somme} M€ dépensés par les users"]
[db_source query="select round(sum(price_offer)/1000000,1)  as somme from coa_offer_transfer tt JOIN coa_instance_club cc on (tt.id_instance_club_seller = cc.id_instance_club)
where accept = 1 and date(date_offer) >= date_sub( curdate(), interval 1 day) and cc.id_user IS NOT NULL" db="coach" row="	+ {somme} M€ reçus par les users"]

[db_source query="select count(*) as compte from coa_offer_transfer tt JOIN coa_instance_club cc on (tt.id_instance_club_buyer = cc.id_instance_club)
where date(date_offer) >= date_sub( curdate(), interval 1 day) and cc.id_user IS NOT NULL" db="coach" row="+ {compte} offre(s) de transfert(s) proposée(s) par les utilisateurs sur les dernières 24 heures."]

[db_source query="select count(*) as compte from coa_offer_transfer tt JOIN coa_instance_club cc on (tt.id_instance_club_buyer = cc.id_instance_club)
where accept = 1 and date(date_offer) >= date_sub( curdate(), interval 1 day) and cc.id_user IS NOT NULL" db="coach" row="	+ {compte} offre(s) acceptées."]


[db_source query="select count(*) as compte from coa_offer_transfer tt JOIN coa_instance_club cc on (tt.id_instance_club_seller = cc.id_instance_club)
where date(date_offer) >= date_sub( curdate(), interval 1 day) and cc.id_user IS NOT NULL" db="coach" row="+ {compte} offre(s) de transfert(s) reçue(s) par les utilisateurs sur les dernières 24 heures."]

[db_source query="select count(*) as compte from coa_offer_transfer tt JOIN coa_instance_club cc on (tt.id_instance_club_seller = cc.id_instance_club)
where accept = 1 and date(date_offer) >= date_sub( curdate(), interval 1 day) and cc.id_user IS NOT NULL" db="coach" row="	+ {compte} offre(s) acceptées."]




# Les Plus

## Plus gros acheteurs

| Nombre | Somme | user |
|--------|-------|------|
[db_source query="select count(*) as compte , round(SUM(price_offer)/1000000,1) as somme, u.email as user from coa_offer_transfer tt
JOIN coa_instance_club cc on (tt.id_instance_club_buyer = cc.id_instance_club)
JOIN coa_user u on (cc.id_user = u.id_user)
where accept = 1 and date(date_offer) >= date_sub(curdate(),interval 1 day) and cc.id_user IS NOT NULL GROUP BY cc.id_user ORDER BY count(*) DESC
LIMIT 5 " db="coach" "row="|{compte}|{somme}|{user}|"]

## Plus gros vendeurs

| Nombre | Somme | user |
|--------|-------|------|
[db_source query="select count(*) as compte , round(SUM(price_offer)/1000000,1) as somme, u.email as user from coa_offer_transfer tt
JOIN coa_instance_club cc on (tt.id_instance_club_seller = cc.id_instance_club)
JOIN coa_user u on (cc.id_user = u.id_user)
where accept = 1 and date(date_offer) >= date_sub(curdate(),interval 1 day) and cc.id_user IS NOT NULL GROUP BY cc.id_user ORDER BY count(*) DESC
LIMIT 5 " db="coach" "row="|{compte}|{somme}|{user}|"]


## Le plus d'offres proposées

| Nombre | Somme | user |
|--------|-------|------|
[db_source query="select count(*) as compte , round(SUM(price_offer)/1000000,1) as somme, u.email as user from coa_offer_transfer tt
JOIN coa_instance_club cc on (tt.id_instance_club_buyer = cc.id_instance_club)
JOIN coa_user u on (cc.id_user = u.id_user)
where date(date_offer) >= date_sub(curdate(),interval 1 day) and cc.id_user IS NOT NULL GROUP BY cc.id_user ORDER BY count(*) DESC
LIMIT 5 " db="coach" "row="|{compte}|{somme}|{user}|"]



## Le plus d'offres reçues


| Nombre | Somme | user |
|--------|-------|------|
[db_source query="select count(*) as compte , round(SUM(price_offer)/1000000,1) as somme, u.email as user from coa_offer_transfer tt
JOIN coa_instance_club cc on (tt.id_instance_club_seller = cc.id_instance_club)
JOIN coa_user u on (cc.id_user = u.id_user)
where  date(date_offer) >= date_sub(curdate(),interval 1 day) and cc.id_user IS NOT NULL GROUP BY cc.id_user ORDER BY count(*) DESC
LIMIT 5 " db="coach" "row="|{compte}|{somme}|{user}|"]

