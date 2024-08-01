use sapataria;

db.clientes.insertMany([
    {
        cpf: '01234567890',
        nome: 'Fernanda Ramos',
        endereco: 'Avenida Atlântica, 707, Apartamento 45',
        cep: '22021010',
        email: 'fernanda.ramos@r7.com',
        telefones: '11987654330'
    },
    {
        cpf: '12345678901',
        nome: 'João Silva',
        endereco: 'Avenida Paulista, 123, Apartamento 45',
        cep: '01311000',
        email: 'joao.silva@dominiobr.com',
        telefones: '11987654321'
    },
    {
        cpf: '23456789012',
        nome: 'Maria Souza',
        endereco: 'Rua das Flores, 456, Casa 2',
        cep: '04038000',
        email: 'maria.souza@gmail.com',
        telefones: '11987654322'
    },
    {
        cpf: '34567890123',
        nome: 'Carlos Lima',
        endereco: 'Avenida Rio Branco, 789, Sala 301',
        cep: '20090003',
        email: 'carlos.lima@yahoo.com',
        telefones: '11987654323'
    },
    {
        cpf: '45678901234',
        nome: 'Ana Oliveira',
        endereco: 'Rua XV de Novembro, 101, Bloco B',
        cep: '80020200',
        email: 'ana.oliveira@outlook.com',
        telefones: '11987654324'
    },
    {
        cpf: '56789012345',
        nome: 'Pedro Santos',
        endereco: 'Rua Amazonas, 202, Casa 10',
        cep: '69005300',
        email: 'pedro.santos@hotmail.com',
        telefones: '11987654325'
    },
    {
        cpf: '67890123456',
        nome: 'Beatriz Costa',
        endereco: 'Rua das Palmeiras, 303, Apartamento 15',
        cep: '29140018',
        email: 'beatriz.costa@uol.com.br',
        telefones: '11987654326'
    },
    {
        cpf: '78901234567',
        nome: 'Marcos Pereira',
        endereco: 'Avenida Brasil, 404, Apartamento 1102',
        cep: '30140071',
        email: 'marcos.pereira@terra.com.br',
        telefones: '11987654327'
    },
    {
        cpf: '89012345678',
        nome: 'Paula Almeida',
        endereco: 'Rua dos Andradas, 505, Cobertura',
        cep: '90020002',
        email: 'paula.almeida@bol.com.br',
        telefones: '11987654328'
    },
    {
        cpf: '90123456789',
        nome: 'Ricardo Barbosa',
        endereco: 'Rua da Praia, 606, Casa 3',
        cep: '29010110',
        email: 'ricardo.barbosa@globo.com',
        telefones: '11987654329'
    }
]);

db.produtos.insertMany([
    {
        codigo: new ObjectId(),
        nome: 'Tênis Esportivo',
        modelo: 'Running X',
        fabricante: 'Nike',
        cor: ['preto', 'branco', 'azul'],
        tam: ['42', '43', '44', '45', '46']
    },
    {
        codigo: new ObjectId(),
        nome: 'Sapato Social',
        modelo: 'Elegant',
        fabricante: 'Ferracini',
        cor: ['marrom', 'preto', 'cinza'],
        tam: ['40', '41', '42', '43']
    },
    {
        codigo: new ObjectId(),
        nome: 'Sapatilha',
        modelo: 'Ballet',
        fabricante: 'Pampili',
        cor: ['rosa', 'branco', 'prata'],
        tam: ['36', '37', '38', '39']
    },
    {
        codigo: new ObjectId(),
        nome: 'Sandália',
        modelo: 'Summer Breeze',
        fabricante: 'Havaianas',
        cor: ['azul', 'verde', 'amarelo', 'branco'],
        tam: ['38', '39', '40', '41', '42']
    },
    {
        codigo: new ObjectId(),
        nome: 'Bota',
        modelo: 'Adventure',
        fabricante: 'Timberland',
        cor: ['marrom', 'preto', 'verde'],
        tam: ['43', '44', '45', '46', '47']
    },
    {
        codigo: new ObjectId(),
        nome: 'Chinelo',
        modelo: 'Beach',
        fabricante: 'Havaianas',
        cor: ['amarelo', 'laranja', 'azul', 'verde'],
        tam: ['39', '40', '41', '42', '43']
    },
    {
        codigo: new ObjectId(),
        nome: 'Tênis Casual',
        modelo: 'Street',
        fabricante: 'Adidas',
        cor: ['branco', 'preto', 'cinza', 'vermelho'],
        tam: ['41', '42', '43', '44', '45']
    },
    {
        codigo: new ObjectId(),
        nome: 'Mocassim',
        modelo: 'Comfort',
        fabricante: 'Moleca',
        cor: ['preto', 'marrom', 'cinza', 'roxo'],
        tam: ['37', '38', '39', '40', '41']
    },
    {
        codigo: new ObjectId(),
        nome: 'Tênis Esportivo',
        modelo: 'Active',
        fabricante: 'Asics',
        cor: ['vermelho', 'branco', 'azul', 'prata'],
        tam: ['44', '45', '46', '47', '48']
    },
    {
        codigo: new ObjectId(),
        nome: 'Sapato Social',
        modelo: 'Classic',
        fabricante: 'Vizzano',
        cor: ['preto', 'marrom', 'cinza', 'dourado'],
        tam: ['40', '41', '42', '43', '44', '45']
    }
]);

db.pedidos.insertMany([
    {
        codigo: new ObjectId(),
        cpf_cliente: '12345678901',
        codigo_produto: db.produtos.findOne({ nome: 'Tênis Esportivo' })._id,
        itens: 'Tênis Esportivo',
        qtdes: 1,
        valor_pago: 299.90
    },
    {
        codigo: new ObjectId(),
        cpf_cliente: '23456789012',
        codigo_produto: db.produtos.findOne({ nome: 'Sapato Social' })._id,
        itens: 'Sapato Social',
        qtdes: 1,
        valor_pago: 199.90
    },
    {
        codigo: new ObjectId(),
        cpf_cliente: '34567890123',
        codigo_produto: db.produtos.findOne({ nome: 'Sapatilha' })._id,
        itens: 'Sapatilha',
        qtdes: 1,
        valor_pago: 149.90
    },
    {
        codigo: new ObjectId(),
        cpf_cliente: '45678901234',
        codigo_produto: db.produtos.findOne({ nome: 'Sandália' })._id,
        itens: 'Sandália',
        qtdes: 2,
        valor_pago: 79.90
    },
    {
        codigo: new ObjectId(),
        cpf_cliente: '56789012345',
        codigo_produto: db.produtos.findOne({ nome: 'Bota' })._id,
        itens: 'Bota',
        qtdes: 1,
        valor_pago: 499.90
    },
    {
        codigo: new ObjectId(),
        cpf_cliente: '67890123456',
        codigo_produto: db.produtos.findOne({ nome: 'Chinelo' })._id,
        itens: 'Chinelo',
        qtdes: 3,
        valor_pago: 39.90
    },
    {
        codigo: new ObjectId(),
        cpf_cliente: '78901234567',
        codigo_produto: db.produtos.findOne({ nome: 'Tênis Casual' })._id,
        itens: 'Tênis Casual',
        qtdes: 1,
        valor_pago: 259.90
    },
    {
        codigo: new ObjectId(),
        cpf_cliente: '89012345678',
        codigo_produto: db.produtos.findOne({ nome: 'Mocassim' })._id,
        itens: 'Mocassim',
        qtdes: 1,
        valor_pago: 189.90
    },
    {
        codigo: new ObjectId(),
        cpf_cliente: '90123456789',
        codigo_produto: db.produtos.findOne({ nome: 'Tênis Esportivo' })._id,
        itens: 'Tênis Esportivo',
        qtdes: 1,
        valor_pago: 349.90
    },
    {
        codigo: new ObjectId(),
        cpf_cliente: '01234567890',
        codigo_produto: db.produtos.findOne({ nome: 'Sapato Social' })._id,
        itens: 'Sapato Social',
        qtdes: 1,
        valor_pago: 179.90
    }
]);
