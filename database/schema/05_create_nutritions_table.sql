CREATE TABLE product_nutritions (
    id INT NOT NULL AUTO_INCREMENT,
    product_id INT NOT NULL,
    caffein FLOAT NULL,
    fat FLOAT NULL,
    sugar FLOAT NULL,
    sodium FLOAT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id),
    CONSTRAINT product_nutritions_products_id_fkey FOREIGN KEY (product_id) REFERENCES products(id)
)