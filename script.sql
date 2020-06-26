alter table:
ALTER TABLE baohanh
  MODIFY PK_SEQ int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=600003;
  
  INSERT INTO computer(computername,computermodel,mabaohanh_fk,store_fk)
SELECT 'Acer Abc D34','D34',600003,600001
hoặc
INSERT INTO computer(computername,computermodel,mabaohanh_fk,store_fk)
SELECT 'Dell Alienware 17 R5 2018','6800',(SELECT mabaohanh from baohanh WHERE loaibaohanh ='Kim Cương'),600002
