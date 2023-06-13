CREATE TABLE `meteora`.`vendedores` (
  `vendedor_id` INT NOT NULL,
  `nome_vendedor` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`vendedor_id`));

INSERT INTO vendedores (vendedor_id, nome_vendedor) VALUES (1, "Ana Duarte");
INSERT INTO vendedores (vendedor_id, nome_vendedor) VALUES (2, "Daniel Siqueira");
INSERT INTO vendedores (vendedor_id, nome_vendedor) VALUES (3, "Nádia Oliveira");
INSERT INTO vendedores (vendedor_id, nome_vendedor) VALUES (4, "Millena Pereira");
INSERT INTO vendedores (vendedor_id, nome_vendedor) VALUES (5, "Paulo Calanca");

ALTER TABLE `meteora`.`pedido` 
ADD INDEX `fk_vendedores_idx` (`vendedor_id` ASC) VISIBLE;
;
ALTER TABLE `meteora`.`pedido` 
ADD CONSTRAINT `fk_vendedores`
  FOREIGN KEY (`vendedor_id`)
  REFERENCES `meteora`.`vendedores` (`vendedor_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

DELETE FROM meteora.itens_pedido WHERE pedido_id IS NULL;
;

ALTER TABLE `meteora`.`itens_pedido` 
CHANGE COLUMN `produto_id` `produto_id` INT NOT NULL ,
CHANGE COLUMN `pedido_id` `pedido_id` INT NOT NULL ,
ADD PRIMARY KEY (`produto_id`, `pedido_id`),
ADD INDEX `fk_pedido_idx` (`pedido_id` ASC) VISIBLE;
;
ALTER TABLE `meteora`.`itens_pedido` 
ADD CONSTRAINT `fk_pedido`
  FOREIGN KEY (`pedido_id`)
  REFERENCES `meteora`.`pedido` (`pedido_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `meteora`.`produto` 
ADD CONSTRAINT `fk_itens_pedido`
  FOREIGN KEY (`produto_id`)
  REFERENCES `meteora`.`itens_pedido` (`produto_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;