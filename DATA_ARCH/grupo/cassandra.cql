CREATE KEYSPACE IF NOT EXISTS sapataria WITH REPLICATION = {'class': 'SimpleStrategy', 'replication_factor': 1};
USE sapataria;

CREATE TABLE clientes (
  cpf TEXT PRIMARY KEY,
  nome TEXT,
  endereco TEXT,
  cep TEXT,
  email TEXT,
  telefones TEXT
);

CREATE TABLE produtos (
  codigo UUID PRIMARY KEY,
  nome TEXT,
  modelo TEXT,
  fabricante TEXT,
  cor SET<TEXT>,
  tam SET<TEXT>
);

CREATE TABLE pedidos (
  codigo UUID PRIMARY KEY,
  cpf_cliente TEXT,
  codigo_produto UUID,
  itens TEXT,
  qtdes INT,
  valor_pago DECIMAL,
  FOREIGN KEY (cpf_cliente) REFERENCES clientes(cpf),
  FOREIGN KEY (codigo_produto) REFERENCES produtos(codigo)
);

INSERT INTO clientes (cpf, nome, endereco, cep, email, telefones) VALUES 
('01234567890', 'Fernanda Ramos', 'Avenida Atlântica, 707, Apartamento 45', '22021010', 'fernanda.ramos@r7.com', '11987654330'),
('12345678901', 'João Silva', 'Avenida Paulista, 123, Apartamento 45', '01311000', 'joao.silva@dominiobr.com', '11987654321'),
('23456789012', 'Maria Souza', 'Rua das Flores, 456, Casa 2', '04038000', 'maria.souza@gmail.com', '11987654322'),
('34567890123', 'Carlos Lima', 'Avenida Rio Branco, 789, Sala 301', '20090003', 'carlos.lima@yahoo.com', '11987654323'),
('45678901234', 'Ana Oliveira', 'Rua XV de Novembro, 101, Bloco B', '80020200', 'ana.oliveira@outlook.com', '11987654324'),
('56789012345', 'Pedro Santos', 'Rua Amazonas, 202, Casa 10', '69005300', 'pedro.santos@hotmail.com', '11987654325'),
('67890123456', 'Beatriz Costa', 'Rua das Palmeiras, 303, Apartamento 15', '29140018', 'beatriz.costa@uol.com.br', '11987654326'),
('78901234567', 'Marcos Pereira', 'Avenida Brasil, 404, Apartamento 1102', '30140071', 'marcos.pereira@terra.com.br', '11987654327'),
('89012345678', 'Paula Almeida', 'Rua dos Andradas, 505, Cobertura', '90020002', 'paula.almeida@bol.com.br', '11987654328'),
('90123456789', 'Ricardo Barbosa', 'Rua da Praia, 606, Casa 3', '29010110', 'ricardo.barbosa@globo.com', '11987654329');

INSERT INTO produtos (codigo, nome, modelo, fabricante, cor, tam) VALUES 
(uuid(), 'Tênis Esportivo', 'Running X', 'Nike', {'preto', 'branco', 'azul'}, {'42', '43', '44', '45', '46'}),
(uuid(), 'Sapato Social', 'Elegant', 'Ferracini', {'marrom', 'preto', 'cinza'}, {'40', '41', '42', '43'}),
(uuid(), 'Sapatilha', 'Ballet', 'Pampili', {'rosa', 'branco', 'prata'}, {'36', '37', '38', '39'}),
(uuid(), 'Sandália', 'Summer Breeze', 'Havaianas', {'azul', 'verde', 'amarelo', 'branco'}, {'38', '39', '40', '41', '42'}),
(uuid(), 'Bota', 'Adventure', 'Timberland', {'marrom', 'preto', 'verde'}, {'43', '44', '45', '46', '47'}),
(uuid(), 'Chinelo', 'Beach', 'Havaianas', {'amarelo', 'laranja', 'azul', 'verde'}, {'39', '40', '41', '42', '43'}),
(uuid(), 'Tênis Casual', 'Street', 'Adidas', {'branco', 'preto', 'cinza', 'vermelho'}, {'41', '42', '43', '44', '45'}),
(uuid(), 'Mocassim', 'Comfort', 'Moleca', {'preto', 'marrom', 'cinza', 'roxo'}, {'37', '38', '39', '40', '41'}),
(uuid(), 'Tênis Esportivo', 'Active', 'Asics', {'vermelho', 'branco', 'azul', 'prata'}, {'44', '45', '46', '47', '48'}),
(uuid(), 'Sapato Social', 'Classic', 'Vizzano', {'preto', 'marrom', 'cinza', 'dourado'}, {'40', '41', '42', '43', '44', '45'});

INSERT INTO pedidos (codigo, cpf_cliente, codigo_produto, itens, qtdes, valor_pago) VALUES 
(uuid(), '12345678901', (SELECT codigo FROM produtos WHERE nome = 'Tênis Esportivo' LIMIT 1), 'Tênis Esportivo', 1, 299.90),
(uuid(), '23456789012', (SELECT codigo FROM produtos WHERE nome = 'Sapato Social' LIMIT 1), 'Sapato Social', 1, 199.90),
(uuid(), '34567890123', (SELECT codigo FROM produtos WHERE nome = 'Sapatilha' LIMIT 1), 'Sapatilha', 1, 149.90),
(uuid(), '45678901234', (SELECT codigo FROM produtos WHERE nome = 'Sandália' LIMIT 1), 'Sandália', 2, 79.90),
(uuid(), '56789012345', (SELECT codigo FROM produtos WHERE nome = 'Bota' LIMIT 1), 'Bota', 1, 499.90),
(uuid(), '67890123456', (SELECT codigo FROM produtos WHERE nome = 'Chinelo' LIMIT 1), 'Chinelo', 3, 39.90),
(uuid(), '78901234567', (SELECT codigo FROM produtos WHERE nome = 'Tênis Casual' LIMIT 1), 'Tênis Casual', 1, 259.90),
(uuid(), '89012345678', (SELECT codigo FROM produtos WHERE nome = 'Mocassim' LIMIT 1), 'Mocassim', 1, 189.90),
(uuid(), '90123456789', (SELECT codigo FROM produtos WHERE nome = 'Tênis Esportivo' LIMIT 1), 'Tênis Esportivo', 1, 349.90),
(uuid(), '01234567890', (SELECT codigo FROM produtos WHERE nome = 'Sapato Social' LIMIT 1), 'Sapato Social', 1, 179.90);
