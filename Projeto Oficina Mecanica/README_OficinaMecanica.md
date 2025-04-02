🛠️ Projeto de Banco de Dados: Oficina Mecânica

📋 Descrição

Sistema simples para controle de uma oficina mecânica. Permite gerenciar clientes, veículos, ordens de serviço, serviços prestados, peças utilizadas, equipes e mecânicos.

✅ Funcionalidades

🧑‍💼 Cadastro de clientes e seus veículos

📄 Abertura e controle de ordens de serviço

🛠️ Registro de serviços e peças por ordem

👨‍🔧 Gestão de equipes e mecânicos com especialidade

🗂️ Tabelas Principais

Cliente: nome, CPF, email, telefone

Veiculo: modelo, ano, placa, cliente

OrdemServico: data, valor, status, autorização, previsão, cliente, veículo, equipe

TabelaServicos: descrição, valor

TabelaPecas: descrição, valor

Equipe: especialidade

Mecanicos: nome, endereço, especialidade, equipe

🔄 Relacionamentos

🔗 Uma ordem de serviço pode ter vários serviços e várias peças

🚗 Um cliente pode ter vários veículos

👥 Uma equipe pode ter vários mecânicos


ℹ️ Observação

Este é um projeto educacional, com dados fictícios (e nomes divertidos) para facilitar o aprendizado de modelagem de dados relacionais.
