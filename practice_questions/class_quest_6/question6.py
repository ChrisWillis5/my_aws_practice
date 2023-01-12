import pandas as pd
import numpy as np
import random

product_name = ['iphone11','iphone12','iphone13','iphoneSE','IpadMax',
'IpadMini','laptop256','Macbook512','galaxy10','galaxy11','galaxy12',
'galaxy13','watch320','watch340','Nk320','Nk400','Nk500']

prod_name_and_price = {'iphone11':500,'iphone12':600,'iphone13':700,'iphoneSE':650,'IpadMax':900,
'IpadMini':700,'laptop256':300,'Macbook512':950,'galaxy10':600,'galaxy11':700,'galaxy12':800,
'galaxy13':900,'watch320':320,'watch340':340,'Nk320':150,'Nk400':250,'Nk500':350}

def main():
    createData(30)
    pass


def createData(row_amt): 
    row = ""
    db_file = open("question_6_data.csv", "w")
    for i in range(row_amt):
        prod_name = random.choice(product_name)
        prod_price = (prod_name_and_price[prod_name])
        row = f"{prod_name}, {prod_price} \n"

        db_file.write(row)


if __name__ == "__main__":
    main()