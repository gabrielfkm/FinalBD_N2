CREATE DATABASE ECOMMERCE;
USE ECOMMERCE;

-- TABELA CATEGORIA
CREATE TABLE CATEGORIA (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT
);

-- TABELA USUARIO
CREATE TABLE USUARIO (
    cpf VARCHAR(14) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha_hash VARCHAR(255) NOT NULL,
    telefone VARCHAR(20),
    datahora_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- TABELA ENDERECO
CREATE TABLE ENDERECO (
    id_endereco INT AUTO_INCREMENT PRIMARY KEY,
    cpf_cliente VARCHAR(14),
    logradouro VARCHAR(255) NOT NULL,
    numero VARCHAR(10),
    complemento VARCHAR(50),
    bairro VARCHAR(100),
    cidade VARCHAR(100),
    estado VARCHAR(2),
    cep VARCHAR(10),
    tipo VARCHAR(20),
    FOREIGN KEY (cpf_cliente) REFERENCES USUARIO(cpf)
);

-- TABELA PRODUTO
CREATE TABLE PRODUTO (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10,2) NOT NULL,
    estoque INT DEFAULT 0,
    id_categoria INT,
    marca VARCHAR(100),
    codigo_barras VARCHAR(20),
    imagem_url VARCHAR(255),
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP,
    ativo BOOLEAN DEFAULT TRUE NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES CATEGORIA(id_categoria)
);

-- TABELA PEDIDO
CREATE TABLE PEDIDO (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    cpf_cliente VARCHAR(14),
    data_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(30) DEFAULT 'Em processamento',
    valor_total DECIMAL(10,2),
    endereco_entrega_id INT,
    FOREIGN KEY (cpf_cliente) REFERENCES USUARIO(cpf),
    FOREIGN KEY (endereco_entrega_id) REFERENCES ENDERECO(id_endereco)
);

-- NOVA TABELA ITEM_PEDIDO
CREATE TABLE ITEM_PEDIDO (
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES PEDIDO(id_pedido),
    FOREIGN KEY (id_produto) REFERENCES PRODUTO(id_produto)
);

-- TABELA PAGAMENTO
CREATE TABLE PAGAMENTO (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT,
    data_pagamento DATETIME DEFAULT CURRENT_TIMESTAMP,
    valor DECIMAL(10,2),
    forma_pagamento VARCHAR(30),
    status VARCHAR(20),
    FOREIGN KEY (id_pedido) REFERENCES PEDIDO(id_pedido)
);

-- TABELA ENVIO
CREATE TABLE ENVIO (
    id_envio INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT,
    data_envio DATETIME,
    transportadora VARCHAR(100),
    codigo_rastreamento VARCHAR(50),
    status_envio VARCHAR(30),
    FOREIGN KEY (id_pedido) REFERENCES PEDIDO(id_pedido)
);

-- Inserção de dados 
-- TABELA CATEGORIA
INSERT INTO CATEGORIA (nome, descricao) VALUES
('Smartphones', 'Aparelhos celulares e smartphones de diversas marcas'),
('Notebooks e Ultrabooks', 'Computadores portáteis para uso pessoal ou profissional'),
('Tablets', 'Dispositivos portáteis com tela sensível ao toque'),
('Smartwatches', 'Relógios inteligentes com funcionalidades integradas'),
('e-Readers', 'Leitores digitais como o Kindle'),

('PCs e Desktops', 'Computadores de mesa para uso pessoal ou profissional'),
('Monitores', 'Telas para computadores com diferentes resoluções e tamanhos'),
('Teclados e Mouses', 'Periféricos de entrada essenciais para navegação e digitação'),
('Webcams e Microfones', 'Dispositivos para comunicação e gravação de vídeo/áudio'),
('Headsets e Fones de Ouvido', 'Acessórios de áudio para chamadas, jogos e música'),

('Placas de Vídeo (GPU)', 'Unidades de processamento gráfico para jogos e edição'),
('Memória RAM', 'Módulos de memória para desempenho do sistema'),
('Processadores (CPU)', 'Unidades centrais de processamento de computadores'),
('SSDs e HDs', 'Armazenamento interno rápido e de alta capacidade'),
('Placas-mãe', 'Componentes principais para conexão de hardware'),
('Fontes e Gabinetes', 'Alimentação e estrutura para montagem de PCs'),

('Consoles', 'Videogames como PS5, Xbox e Nintendo Switch'),
('Controles Gamer', 'Gamepads, volantes e joysticks para jogos'),
('Cadeiras Gamer', 'Cadeiras ergonômicas para longas sessões de jogo'),
('Jogos Digitais ou Físicos', 'Títulos disponíveis para PC e consoles'),

('Roteadores e Modens', 'Equipamentos de rede para acesso à internet'),
('Switches e Hubs', 'Distribuidores de rede para conexões locais'),
('Adaptadores e Cabos de Rede', 'Componentes de conectividade cabeada'),

('Impressoras e Scanners', 'Dispositivos para impressão e digitalização'),
('Armazenamento Externo', 'HDs externos, SSDs portáteis e pen drives'),
('Acessórios e Cabos', 'Itens diversos como suportes, cases, hubs e cabos'),

('Câmeras Digitais', 'Câmeras profissionais e semiprofissionais'),
('Drones', 'Dispositivos voadores com câmera integrada'),
('Estabilizadores e Gimbals', 'Equipamentos para vídeos mais suaves'),
('Iluminação para Estúdio', 'Softboxes, LEDs e acessórios de luz'),

('Casa Inteligente', 'Produtos para automação e controle residencial'),
('Assistentes Virtuais', 'Dispositivos como Alexa e Google Home'),
('Segurança Residencial', 'Fechaduras eletrônicas, câmeras IP e sensores'),

('Energia e Carregamento', 'Power banks, carregadores, no-breaks e estabilizadores');

-- TABELA ENDERECO



-- TABELA PRODUTO 



-- TABELA USUARIO
INSERT INTO USUARIO (cpf, nome, email, senha_hash, telefone) VALUES
('403.691.852-42', 'Luna Silveira', 'luna.silveira1@email.com', '92f20dafc5e5ac1c66820903c492cc04', '31996897807'),
('478.653.902-38', 'Alícia Nunes', 'alicia.nunes2@email.com', '34ae07655b9a94e90556aff79bfd60b0', '41938005924'),
('418.367.950-84', 'Guilherme Santos', 'guilherme.santos3@email.com', 'f940608acd624f8092bc86353052e734', '21932781276'),
('035.146.879-00', 'Dra. Manuela Ramos', 'dra..manuela.ramos4@email.com', 'f98494438eca6d421a8f9b5b3f02ed83', '41934393324'),
('680.957.432-83', 'Rafael Gonçalves', 'rafael.goncalves5@email.com', '4003ad34bf5fe5b88e5f393ff15ad623', '51940930966'),
('986.107.524-02', 'Srta. Alana Pires', 'srta..alana.pires6@email.com', '8cfda3366bb6ce9772d9f6a023c3fb40', '31910785786'),
('402.135.698-33', 'Guilherme da Rosa', 'guilherme.da.rosa7@email.com', 'ab5b5cda7b7457ed9dd7c5a2006476ea', '21901528514'),
('403.176.928-87', 'Vitor Porto', 'vitor.porto8@email.com', '2f4a94669df7f385b1d7602ac96af39c', '81943277415'),
('041.392.657-52', 'Luiza Araújo', 'luiza.araújo9@email.com', '2541a530f0ad09af4f0952fd266743dd', '84939633029'),
('105.863.279-59', 'Dr. Igor Carvalho', 'dr..igor.carvalho10@email.com', '5b94ff970f4595351bcb850426e56fcd', '31997748641'),
('370.589.461-75', 'Sr. Bryan Nascimento', 'sr..bryan.nascimento11@email.com', 'b6e4ab6ead69a920f6c32f09d564f9f5', '84983895587'),
('617.498.503-20', 'Fernando Ribeiro', 'fernando.ribeiro12@email.com', 'ed765fed3aa3e071ea71207f77410a89', '61956522328'),
('948.672.531-46', 'Breno Pinto', 'breno.pinto13@email.com', 'd54fe59aedc24448fbd79e259575fdea', '41997842372'),
('318.047.952-32', 'Dr. Vitor Hugo Nascimento', 'dr..vitor.hugo.nascimento14@email.com', '278f4da290af2663e972e27015107a1f', '71970014245'),
('780.641.925-01', 'Laura Gomes', 'laura.gomes15@email.com', '9e047f59d477701b312df1cbfeb99d8b', '11940844981'),
('604.713.295-25', 'Sophia Araújo', 'sophia.araújo16@email.com', '9b4667cc87901956490f2b4bb53fc081', '31922153190'),
('954.260.137-99', 'Pedro Henrique Nunes', 'pedro.henrique.nunes17@email.com', '1c7f8c4b0deb8531236793378f891fc8', '21992799370'),
('271.650.489-01', 'Marcelo da Paz', 'marcelo.da.paz18@email.com', 'e24595e0a8c9964c51555e609573aded', '61921087977'),
('814.972.053-79', 'Clara Martins', 'clara.martins19@email.com', 'ce39f9c48d0d461e3714151dcfa34a06', '31910355788'),
('165.478.023-53', 'Srta. Ana Lívia Ferreira', 'srta..ana.livia.ferreira20@email.com', 'b982818b36a43810859ca82ebb33ac55', '71953714937'),
('921.856.430-70', 'João Lucas da Cunha', 'joao.lucas.da.cunha21@email.com', 'a330be869ca17106c4e942b9a402b0eb', '84974012562'),
('705.631.428-71', 'Breno Porto', 'breno.porto22@email.com', 'd8db3b3b25c7ea4922aedf5b7c91561e', '31960407198'),
('490.712.835-50', 'Alexandre Fogaça', 'alexandre.fogaca23@email.com', 'd28cda3bc5a7b7b4c8f760e3400161ee', '81929988061'),
('321.867.045-44', 'Lara Moura', 'lara.moura24@email.com', '61bacd9a32cc7c2d937e147a2b512be3', '31961509219'),
('627.349.508-47', 'Matheus das Neves', 'matheus.das.neves25@email.com', 'ba1294b592ab0991c8287cc8b44c093f', '71905318180'),
('643.129.850-06', 'Luna Peixoto', 'luna.peixoto26@email.com', '9c261c8907e52fb98176a0edfc6c9096', '21966496893'),
('452.360.798-29', 'Laís da Conceição', 'lais.da.conceicao27@email.com', '485d9b077ab6432ace94d3a0afd29a70', '61977328371'),
('017.986.435-10', 'Bianca Melo', 'bianca.melo28@email.com', '661fdbfd6c3f79426c480d542dff912f', '61946080475'),
('612.870.439-50', 'Bianca da Paz', 'bianca.da.paz29@email.com', '63223a6b2f1c2b263cdf12768c1f255f', '31930158481'),
('063.518.974-75', 'Luana da Cunha', 'luana.da.cunha30@email.com', '4ef2f941188ae9e068a193a4d3e521b3', '84971417993'),
('279.106.354-43', 'Marcos Vinicius da Paz', 'marcos.vinicius.da.paz31@email.com', '19b134a9f1d2e1926231042f29d00084', '51916233707'),
('569.203.481-60', 'Letícia Rezende', 'leticia.rezende32@email.com', '7e4c4a971a5ff2c0e9be17c395e7db47', '31973424291'),
('796.315.482-28', 'Carlos Eduardo Fogaça', 'carlos.eduardo.fogaca33@email.com', 'a12f4dcff604e602132e9f6a2a4e5a22', '84929048770'),
('640.923.178-40', 'Maria Vitória Vieira', 'maria.vitória.vieira34@email.com', 'a54c340aae1dbd922cae59773ac5da9a', '41990887499'),
('280.396.715-40', 'Cecília Alves', 'cecilia.alves35@email.com', '2a15a1927f5aa7d67d8cbd31c8e2fa86', '31972608774'),
('915.036.827-30', 'Dr. Davi Lucas da Conceição', 'dr..davi.lucas.da.conceicao36@email.com', 'ef19968adaaa01223287bbc322a77ec0', '84926037152'),
('063.412.798-50', 'Erick Sales', 'erick.sales37@email.com', '7b7b1e11546bd9dad18305ecda483872', '51931005954'),
('176.028.943-40', 'Diego Nascimento', 'diego.nascimento38@email.com', '618c6393ff1ebd552d7c339f66c5140c', '81908068124'),
('623.914.705-25', 'André Aragão', 'andre.aragao39@email.com', 'eab4f3240338875ef5028e0b7cc01812', '21979545711'),
('639.157.840-01', 'Bárbara Carvalho', 'barbara.carvalho40@email.com', 'e6872a948f93791423a2d4e7bb1a94a3', '61903751628'),
('706.129.534-16', 'Luiz Fernando da Luz', 'luiz.fernando.da.luz41@email.com', '1334b424f5d0ad6208b769ced5a0287d', '84971465289'),
('137.825.406-62', 'Clarice Cavalcanti', 'clarice.cavalcanti42@email.com', '25b22b155f22da9c515856ca2ff97252', '81939738840'),
('263.487.150-35', 'Dra. Maysa Costela', 'dra..maysa.costela43@email.com', 'bae46668491ec0e1d85c4e4387d55194', '31966866390'),
('954.263.710-16', 'Eloah Rocha', 'eloah.rocha44@email.com', '8ec2d153efc89397ad3312558fe8b2d9', '31975352384'),
('512.076.934-99', 'Valentina da Rosa', 'valentina.da.rosa45@email.com', '5159830829f660962844db1692d541d3', '11986581618'),
('692.438.015-89', 'Isaac Nascimento', 'isaac.nascimento46@email.com', 'f52cefb90626a66c3f07e16140ac2c55', '61919200729'),
('283.591.674-19', 'Murilo Rodrigues', 'murilo.rodrigues47@email.com', '4ba6d69fc85d5eb0cf4f379bfdb930cd', '41933264048'),
('463.801.927-78', 'Carlos Eduardo da Paz', 'carlos.eduardo.da.paz48@email.com', '4d0b9e14c77872a2357c81895d6e2662', '21974841163'),
('384.019.275-79', 'Augusto Melo', 'augusto.melo49@email.com', '4f4dda38fb8225d3dc46060bf6c69a5e', '61905205469'),
('516.803.249-42', 'Agatha Ferreira', 'agatha.ferreira50@email.com', 'a9ee0eec2bbab8c14860b7b6d9f6f608', '51931753805'),
('835.029.417-50', 'Rodrigo Freitas', 'rodrigo.freitas51@email.com', '6f9f3703044047990da9fc3a8650a5c4', '41919526689'),
('094.512.837-14', 'Noah Pinto', 'noah.pinto52@email.com', '11fe30a0a5bb1f185d87b983556ce858', '11934775382'),
('912.746.085-11', 'Srta. Mirella da Cruz', 'srta..mirella.da.cruz53@email.com', '0e5a21c2cf9a15f4693cdfdb8db7b135', '11906404829'),
('589.413.267-37', 'Nathan Martins', 'nathan.martins54@email.com', 'f057a88b77affc92bbf87f2a406eb389', '31987297674'),
('970.635.218-02', 'Dra. Nina Almeida', 'dra..nina.almeida55@email.com', '0467b26e72bf613d80b326742ba32b94', '71929638874'),
('903.671.852-02', 'Kaique Silva', 'kaique.silva56@email.com', '8c6f953b056d3f91ada85778bdb7f2b9', '11999107258'),
('587.130.296-30', 'Bryan Moreira', 'bryan.moreira57@email.com', '04e54f9419d4b31e885fc73fc751d20c', '51975641480'),
('735.018.429-88', 'Nicolas Monteiro', 'nicolas.monteiro58@email.com', 'bfcc6abf9845352aa0a7ff126ace4e5e', '21915074840'),
('189.570.624-67', 'Heitor Costela', 'heitor.costela59@email.com', 'ce9e5faa642b8f5ec98023f7af4a0461', '71990530593'),
('984.153.720-60', 'Srta. Lara Mendes', 'srta..lara.mendes60@email.com', 'ec7bdd198590410d5d451df486e7fa26', '84911353162'),
('581.324.967-28', 'Luiza Cunha', 'luiza.cunha61@email.com', '4855a4cc2b89d37d71c6b982cb94d5f1', '41992008754'),
('247.560.813-71', 'Sophie da Cunha', 'sophie.da.cunha62@email.com', '39062428918e9f384e9ad59371b67c78', '51905806483'),
('942.506.371-07', 'João Felipe Dias', 'joao.felipe.dias63@email.com', '6055f2433f7e5deff189918d8d763e7a', '21924462016'),
('507.368.149-57', 'Marcelo Cavalcanti', 'marcelo.cavalcanti64@email.com', 'b241d77ffc533a496675264054c47f7b', '31961378699'),
('382.506.714-90', 'Sabrina Nunes', 'sabrina.nunes65@email.com', 'dfd680bdb90d3bd9e333d23a098ac1da', '41949659123'),
('341.970.562-06', 'Sr. Benício Souza', 'sr..benicio.souza66@email.com', 'f964df3de0fd17391013c696971c1607', '61910779383'),
('627.841.305-17', 'Pietra Silva', 'pietra.silva67@email.com', 'ddc698c01c41650ab335bee638ff1627', '51964254119'),
('391.208.564-15', 'Ryan Almeida', 'ryan.almeida68@email.com', '4eb1a7bcd8294754337311d3f0b71539', '81915828302'),
('362.954.018-05', 'Isabelly Barros', 'isabelly.barros69@email.com', '4631244f141af3c8d0fbe444ab8e04e4', '41908430256'),
('341.089.576-01', 'Luiz Gustavo Fernandes', 'luiz.gustavo.fernandes70@email.com', 'b9ab5c3e09ebcf50b42a5a602fa669de', '11999437738'),
('194.530.782-04', 'Camila Caldeira', 'camila.caldeira71@email.com', '488c631ab95f136b624c398560fe9d4a', '61999166766'),
('645.893.720-29', 'Marcela da Cruz', 'marcela.da.cruz72@email.com', '5536fed90940ee40a8e80255eec648fe', '61909607638'),
('013.425.798-79', 'Camila Oliveira', 'camila.oliveira73@email.com', 'cc4f57a06589486bd68ece5ebaf54392', '81936950449'),
('459.782.301-88', 'Davi Luiz Pires', 'davi.luiz.pires74@email.com', '6606f03ec9ccc39ceed273c458fd3355', '71982957925'),
('098.652.371-21', 'Ian Rezende', 'ian.rezende75@email.com', 'e971a1a7db99a5aeb14df53933b48f77', '51917466018'),
('751.049.326-99', 'João Guilherme Novaes', 'joao.guilherme.novaes76@email.com', '5b427913775eca72283ded9a2ea6fefe', '41986518769'),
('814.072.596-01', 'Maria Clara Sales', 'maria.clara.sales77@email.com', 'f1b0222e35f5f1bcc1c696acda441bba', '41980122861'),
('502.874.391-60', 'João Felipe da Rosa', 'joao.felipe.da.rosa78@email.com', '840f76ada221b259fe51035c395d814e', '51914015308'),
('651.938.027-02', 'Otávio Rodrigues', 'otavio.rodrigues79@email.com', 'b92a346bd58bf4eabbdd61362a555675', '11991866106'),
('071.564.892-67', 'Eduardo Mendes', 'eduardo.mendes80@email.com', 'f1439a6f8fd142190f08c6aa7b2e15be', '31988819405'),
('716.943.805-48', 'Ana Lívia da Rocha', 'ana.livia.da.rocha81@email.com', 'a1d03106ca7aa1d9e0b8a40bb83d0cc1', '81963760038'),
('897.450.126-02', 'Valentina Nunes', 'valentina.nunes82@email.com', '52e9812434e29e081eb24cb206dcec48', '21957391772'),
('615.837.024-07', 'Gabriel Vieira', 'gabriel.vieira83@email.com', 'd66d3cd111bd31cc669b81968dd2af9e', '81981566143'),
('421.687.053-80', 'Srta. Isabella Pereira', 'srta..isabella.pereira84@email.com', '2a24aa201a89a3148e72966c121778ff', '84920188961'),
('419.370.826-87', 'Lorenzo Silva', 'lorenzo.silva85@email.com', 'e0a4fa78e2d65b0e2ddf24c2f167e547', '11943763612'),
('542.871.639-82', 'Maria Clara Pires', 'maria.clara.pires86@email.com', '4938131bbc4fa26465723ae361a1b0f0', '84908242435'),
('427.680.539-29', 'Ana Luiza Pires', 'ana.luiza.pires87@email.com', '3b67d09d3ecc325cb9251ed7f1de0631', '31953914448'),
('520.683.794-65', 'André da Rocha', 'andre.da.rocha88@email.com', 'ac9e174c512a5c10ea285dd82d73936b', '51974363263'),
('897.263.410-78', 'Emanuel Monteiro', 'emanuel.monteiro89@email.com', '33faf0b830ee2f447c6c11b66ef53d85', '41935044665'),
('193.654.807-01', 'Igor da Mota', 'igor.da.mota90@email.com', '2fa7cedc642e1e94bb9e83beb9a69770', '51911144153'),
('615.403.897-66', 'Ana Beatriz Gonçalves', 'ana.beatriz.goncalves91@email.com', 'ad275327159ad4d40e97330c0e2a7afb', '31962177570'),
('529.671.840-20', 'Luana Jesus', 'luana.jesus92@email.com', '17143517ab68777764d871d3712c45c6', '61971422299'),
('162.538.470-07', 'Vinicius da Rocha', 'vinicius.da.rocha93@email.com', 'a56fbac38a0ede1e5cbe956e0cda6d5b', '84914701108'),
('750.943.826-83', 'Luiz Henrique Freitas', 'luiz.henrique.freitas94@email.com', 'e4749ec777ab4592ef9be114fd63bc58', '41944748915'),
('185.327.406-26', 'Maria Vitória da Rosa', 'maria.vitória.da.rosa95@email.com', '18af0c87bb72254e34735a7c3b04c031', '61990860107'),
('154.620.379-61', 'Sabrina da Rosa', 'sabrina.da.rosa96@email.com', 'c0ba780b35abe0fdc8dcce3693852cda', '71913884401'),
('390.472.851-23', 'Sr. Leonardo Barros', 'sr..leonardo.barros97@email.com', 'b330ae6e951bf00ded05df1b48ebf7fa', '11947933716'),
('590.768.423-29', 'Paulo Rodrigues', 'paulo.rodrigues98@email.com', '474bf8298dc2d037cbc75032cf57c71a', '51988652347'),
('793.128.054-79', 'Caio Porto', 'caio.porto99@email.com', '678459c97d965540c58734d45d78dbaa', '31968046534'),
('126.857.034-62', 'Cecília Sales', 'cecilia.sales100@email.com', '8675fa74d32903cfc9a8657a269119e5', '21933859185');
    


-- Views


-- Triggers


-- Procedures

