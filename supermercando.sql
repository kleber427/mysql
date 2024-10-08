-- Tabela de Clientes
CREATE TABLE tbl_clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    cpf VARCHAR(11),
    endereco VARCHAR(150),
    telefone VARCHAR(15),
    email VARCHAR(100)
);

-- Tabela de Produtos
CREATE TABLE tbl_produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    codigo VARCHAR(50),
    preco DECIMAL(10, 2),
    validade DATE,
    categoria VARCHAR(50),
    quantidade_estoque INT,
    id_fornecedor INT,
    FOREIGN KEY (id_fornecedor) REFERENCES tbl_fornecedores(id_fornecedor)
);

-- Tabela de Colaboradores
CREATE TABLE tbl_colaboradores (
    id_colaborador INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    cpf VARCHAR(11),
    cargo VARCHAR(50),
    data_contratacao DATE,
    salario DECIMAL(10, 2)
);

-- Tabela de Vendas
CREATE TABLE tbl_vendas (
    id_venda INT AUTO_INCREMENT PRIMARY KEY,
    data_venda DATE,
    valor_total DECIMAL(10, 2),
    id_cliente INT,
    id_colaborador INT,
    FOREIGN KEY (id_cliente) REFERENCES tbl_clientes(id_cliente),
    FOREIGN KEY (id_colaborador) REFERENCES tbl_colaboradores(id_colaborador)
);

-- Tabela de Fornecedores
CREATE TABLE tbl_fornecedores (
    id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    cnpj VARCHAR(14),
    telefone VARCHAR(15),
    email VARCHAR(100)
);

-- Tabela de Relação entre Vendas e Produtos
CREATE TABLE tbl_venda_produtos (
    id_venda INT,
    id_produto INT,
    quantidade INT,
    preco_unitario DECIMAL(10, 2),
    desconto_aplicado DECIMAL(10, 2),
    FOREIGN KEY (id_venda) REFERENCES tbl_vendas(id_venda),
    FOREIGN KEY (id_produto) REFERENCES tbl_produtos(id_produto)
);