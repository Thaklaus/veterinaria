-- Criação do banco de dados
CREATE DATABASE feedbackPRIMARYid_clientefornecedoreslaboratoriosid_laboratorioIF NOT EXISTS clinica;
USE clinica;

-- Tabela Cliente
CREATE TABLE tbCliente (
    cod_cliente VARCHAR(14) PRIMARY KEY,
    telefone_1 VARCHAR(14),
    telefone_2 VARCHAR(14),
    email VARCHAR(50),
    cpf DECIMAL(11,0),
    rg DECIMAL(9,0),
    rua VARCHAR(50),
    bairro VARCHAR(50),
    estado VARCHAR(50),
    cidade VARCHAR(50)
);

-- Tabela Paciente
CREATE TABLE tbPaciente (
    id_pet INT AUTO_INCREMENT PRIMARY KEY,
    cod_cliente VARCHAR(14),
    nome VARCHAR(50),
    raca VARCHAR(50),
    cor VARCHAR(50),
    peso DECIMAL(10,2),
    motivo_consulta VARCHAR(50),
    FOREIGN KEY (cod_cliente) REFERENCES tbCliente(cod_cliente)
);

-- Tabela Consulta
CREATE TABLE tbConsulta (
    id_consulta INT AUTO_INCREMENT PRIMARY KEY,
    cod_cliente VARCHAR(14),
    id_paciente INT,
    data_consulta DATE,
    horario TIME,
    periodica VARCHAR(50),
    a_domicilio VARCHAR(50),
    urgencia VARCHAR(50),
    emergencia VARCHAR(50),
    FOREIGN KEY (cod_cliente) REFERENCES tbCliente(cod_cliente),
    FOREIGN KEY (id_paciente) REFERENCES tbPaciente(id_pet)
);

-- Tabela Laboratórios
CREATE TABLE laboratorios (
    id_laboratorio INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(50)
);

-- Tabela Exame
CREATE TABLE tbExame (
    cod_exame INT AUTO_INCREMENT PRIMARY KEY,
    id_consulta INT,
    id_laboratorio INT,
    id_paciente INT,
    data DATE,
    laboratoriais VARCHAR(50),
    imagem VARCHAR(50),
    cirurgia VARCHAR(50),
    FOREIGN KEY (id_consulta) REFERENCES tbConsulta(id_consulta),
    FOREIGN KEY (id_laboratorio) REFERENCES laboratorios(id_laboratorio),
    FOREIGN KEY (id_paciente) REFERENCES tbPaciente(id_pet)
);

-- Tabela Veterinário
CREATE TABLE tbVeterinario (
    id_vet INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    especialidade VARCHAR(50),
    crmv DECIMAL(10,0)
);

-- Tabela Fornecedores
CREATE TABLE fornecedores (
    id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    cnpj DECIMAL(14,0),
    ie DECIMAL(9,0),
    produto VARCHAR(20)
);

-- Tabela Estoque
CREATE TABLE tbEstoque (
    id_produto VARCHAR(10) PRIMARY KEY,
    id_fornecedor INT,
    nome VARCHAR(50),
    marca VARCHAR(50),
    tipo_produto VARCHAR(50),
    validade DATE,
    FOREIGN KEY (id_fornecedor) REFERENCES fornecedores(id_fornecedor)
);

-- Tabela Pagamento
CREATE TABLE pagamento (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    pix DECIMAL(20,2),
    cartao DECIMAL(20,2),
    dinheiro DECIMAL(20,2),
    boleto DECIMAL(20,2)
);

-- Tabela Feedback
CREATE TABLE feedback (
    id_feedback INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente VARCHAR(14),
    data_feedback DATE,
    avaliacao VARCHAR(50),
    FOREIGN KEY (id_cliente) REFERENCES tbCliente(cod_cliente)
);
