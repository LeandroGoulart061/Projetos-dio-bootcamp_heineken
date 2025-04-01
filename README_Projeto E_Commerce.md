
# 🛒 Projeto Lógico: Sistema de E-Commerce

## 📉 Descrição Geral

Este projeto representa o **modelo lógico de dados para um sistema de e-commerce**, com foco na gestão de clientes, fornecedores, vendedores, produtos, estoque, pedidos e entregas. O objetivo é estruturar uma base relacional que suporte as principais operações de um marketplace online, permitindo o rastreamento completo do ciclo de venda — desde a disponibilização de um produto até a entrega ao cliente.

---

## 🗂️ Principais Entidades e Relacionamentos

### **Fornecedor**
Representa os fornecedores que oferecem produtos à plataforma. Cada fornecedor pode disponibilizar diversos produtos.

### **Produto**
Armazena informações dos itens comercializados. Pode estar vinculado a um ou mais fornecedores e vendedores.

### **DisponibilizandoProduto**
Relacionamento entre `Fornecedor` e `Produto`, indicando quais produtos cada fornecedor oferece.

### **Terceiro**
Representa os vendedores cadastrados na plataforma (como terceiros ou lojas parceiras). Cada vendedor pode vender vários produtos com preços e quantidades distintas.

### **ProdutosPorVendedor**
Relaciona os produtos com os vendedores, incluindo o valor e a quantidade disponível em estoque por vendedor.

### **Estoque**
Unidades de armazenamento dos produtos. Cada estoque tem sua localização.

### **ProdutoHasEstoque**
Relaciona produtos com estoques e registra a quantidade de unidades armazenadas em cada local.

### **Cliente**
Representa os usuários que realizam compras. Pode ser uma pessoa física ou jurídica.

### **PessoaFisica** e **PessoaJuridica**
Subtipos de cliente. Armazenam dados específicos de CPF, data de nascimento ou CNPJ e razão social.

### **MeioDePagamento**
Registra os métodos de pagamento utilizados pelos clientes para realizar os pedidos, incluindo tipo, bandeira e validade.

### **Pedido**
Representa uma compra feita por um cliente, associando produtos, pagamento e frete.

### **RelacaoPedidoProduto**
Relaciona pedidos com produtos e define as quantidades compradas por pedido.

### **Entrega**
Registra os dados de entrega de cada pedido, incluindo código de rastreio, status, preço e o estoque de origem.

---

## 🌟 Objetivos do Sistema

- Controlar e consultar produtos disponíveis por fornecedores e vendedores;
- Gerenciar estoques por localização e produto;
- Controlar pedidos com rastreamento de entregas e pagamentos;
- Permitir análises sobre vendas, estoque e comportamento de clientes;
- Suportar a expansão futura para múltiplos vendedores (modelo de marketplace).

---

## 🧹 Normalização

O modelo segue boas práticas de normalização:
- Separacão de entidades por responsabilidades;
- Redução de redundância de dados (ex: cliente separado de pessoa física/jurídica);
- Uso de tabelas associativas para representar relacionamentos muitos-para-muitos;
- Integridade referencial garantida por **chaves estrangeiras**.

---

> Este projeto pode ser utilizado como base para aplicações web, sistemas ERP, plataformas marketplace e estudos acadêmicos. Diagramas e scripts SQL de criação e população estão disponíveis separadamente.
