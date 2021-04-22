=> Fazer a pagina principal de produtos da loja com navbar do usuario
=> Fazer a pagina respectiva do produto com as caracteristicas do produto, imagens, descricao
=> Fazer a pagina do carrinho do usuario
=> Fazer a pagina de perfil do usuario para que ele possa, caso queira editar seus dados


=>
    botoes
            Cadastrar = success
            Cancelar = danger
            Alterar = success
            Editar = warning
            Deletar = danger

    Titulo das telas
        index = respectivo model
        create = Novo + respectivo model
        edit = Editar + respectivo model


=>
    docker run -d --rm --name=mysql-container -v ~/mysql/:/var/lib/mysql mysql-image
        

=> O QUE FALTA FAZER NO SISTEMA EM SEGUNDO PLANO
implementar a api de Cep

=> VALIDACAO DE CPF/CNPJ
https://irias.com.br/blog/como-validar-cpf-cnpj-em-node-js/

=> SEARCH EM NODEJS
https://www.youtube.com/watch?v=6jbrWF3BWM0

=> NODEJS QUERY DE PAGINACAO EM NODEJS
https://www.youtube.com/watch?v=JdFDRtD-h0A

====== BOTAO DO PAINEL DO ADMINISTRADOR
    ADMINISTRADOR - Ok
    PRODUTOS - Ok
    CATEGORIA DE PRODUTO - Ok
    FORCENEDOR - Ok
    USUARIOS - Ok
    BANNERS (CARROSEL) => POR ULTIMO - Ok
    PRODUTOS DE COMPRAS DOS USUARIOS (ordeRS) - Ok

    
let count = 2;
data.forEach((prod, index) => {
    if(index > count){
        console.log('br');
        count += 3;
    }
    console.log(prod.nome);
});



// codigo de paginacao exemplo
let data = [{name: 'flavio'},{name: 'flavio'},{name: 'flavio'},
           {name: 'flavio'},{name: 'flavio'},{name: 'flavio'},
           {name: 'flavio'},];


let header = 'inicio', footer = 'fim';
let array = [];
let posi = 0;

let count = 4;
for (let i = 0; i < data.length; i++) {
  
  if(i == 0){
    console.log('inicio');
  }
  
  if(i > count){
    console.log('fim');
    console.log('inicio');
    count += 5;  
  }
  console.log(data[i]);
  
  if(i == data.length - 1){
    console.log('fim');
  }
  
}

FAZER A TELA DE CARRINHO COM CADA ITEM UM BOTAO X DE EXCLUIR
  => os dados serao
      - foto do produto
      - nome do produto
      - valor unitario
      - quantidade comprada
      - valor total
      - botao de ir para o produto
      - botao de excluir produto
  => NO FINAL DEVE TER UM BOTAO DE FINALIZAR COMPRA



  O QUE FALTA PARA COMPLETAR O SISTEMA
    =>
    => <PRONTO> Criar o banco de dados de banners (Programar o banners)
    => <PRONTO> Fazer o sistema de vizualizacao de produto com categoria
    => <PRONTO> Conferir data de nascimento
    => <PRONTO> Verificar cpf e cnpj de todo o sistema
    => <PRONTO> Programas o Cof. Ref
    => <PRONTO> razao social terminar de programar pois esta faltando*
    => <PRONTO> Verificar se cpf e valido no backend do usuario e do fornecedor
    => <PRONTO> Inserir a mascara de cpf/cnpf em cadastrar e atualizar de todos
    => <NAOFUNCIONA> testar toString no rendenizamento de descricao ao crar o produto
    
    => <PRONTO>CONSERTAR O PRECO POIS ESTA COM MUITAS CADAS DECIMAIS*****
    => <PRONTO>Alterar os precos das telas todas as telas ***
    
  => <PRONTO> SEPARANDO OU PREPARANDO MERCADORIA (PARA ENVIO)
  => <PRONTO> BOTAO PARA MOVIMENTACAO DE HOJE
  => <PRONTO> BUSCA A DATA
  => <PRONTO> RELATORIO POR STATUS

    https://www.w3schools.com/css/css3_flexbox_container.asp
    http://hackerzone.com.br/blog/trabalhar-com-valor-monetario-em-javascript/

  => SOLUCAO PARA A ROTA, PEGAR OS PARAMETROS DA ROTA E CONCATENAR O PARAMETRO &page=1
  ?category=2&order=asc

=> 1) <PRONTO> não deixar digitar valores negativos para quantidades e preços

=> 2) <PRONTO> não deixar digitar datas erradas (por ex: datas futuras para nascimento, dias/meses/anos que não existem, agendar algo em datas passadas)

=> 3) <PRONTO> validar se o CPF é um número verdadeiro

=> 4) <PRONTO> não deixar "vender" quantidade superior ao que tem no estoque

 <PRONTO>  CARRINHO VERIFICACAO PARA VENDA

=> 6) não deixar inserir objetos repetidos (por ex, cadastrar uma coisa duas vezes, a mesma coisa)

    => max de carateres no texto
    =>

=> Alterar o Status de Item do Banco
  somente sera deleteado caso nao possua relacionamento!
  caso deseja deletar e possui relacionamento enviar menssagem falando para deletar
  dependendo dos itens fazer uma listagem de ativos e inativos*

  <PRONTO> Usuario pode desativar a sua conta
  <PRONTO> Administrador pode reativar a conta do usuario
  <PRONTO> A categoria pode ser deletada caso nao esteja em uso
  <PRONTO> A categoria pode ser desativada/ativada
  
  <PRONTO> Desativar Fornecedor em todas as moduncas
  <PRONTO> Tirar da listagem a categoria da home e dos produtos
  <PRONTO> Reativar usuario do sistema
  
  <PRONTO> Status do produto 
  <PRONTO> Status Admin

 =>   Pagiancao
 =>   pagamento

 => <PRONTO> print das compras do usuario
 =>  print de todas as telas com status!
 => print da tela com a pesquisa de produto
 => print com tela de ordens

<PRONTO> mesagem de suporte para caso tenha desativado a conta, mostrar para ele ativar o perfil dele*
<PRONTO> gerar mensagem para uzuario finalizaar compra

ver se esta certo de adicionar produto ao carrinho de modo que nao permina menos que 1
ver se esta esta adicionando produto maior que o do estoque
ver se esta alterando a quantidade correta de um produto no carrnho
