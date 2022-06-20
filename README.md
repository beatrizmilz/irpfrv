
<!-- README.md is generated from README.Rmd. Please edit that file -->

# irpfrv

<!-- badges: start -->
<!-- badges: end -->

O objetivo do pacote irpfrv é gerar arquivos importantes para o auxílio
do preenchimento dos dados de renda variável do imposto de renda pessoa
física (IRPF). Ele gera arquivos de discriminação e a situação anual de
cada ativo de renda variável, como ações, fundos de investimento
imobiliário e ETFs.

## Instalação

Você pode instalar a versão em desenvolvimento do irpfrv através do
[GitHub](https://github.com/):

``` r
#install.packages("devtools")
devtools::install.github("lailaviana/irpfrv")
```

## Exemplo

Esse é um exemplo básico de como carregar o pacote:

``` r
library(irpfrv)
```

## Adquirindo seus dados:

1.  Para obter os seus dados de negociação em bolsa de valores, entre no
    site da [B3](https://www.investidor.b3.com.br/) e acesse sua conta.
2.  Ao entrar, clique em **Menu** e logo depois em **Extrato**. No canto
    superior esquerdo, selecionar **Negociação**.
3.  Nessa tela, já haverá as últimas movimentações feitas pelo usuário.
    Porém para baixar os dados, é necessário clicar no canto superior
    direito em **Filtrar** e selecionar a Data Inicial e Data Final que
    quer recuperar. É importante ressaltar que a B3 só disponibiliza a
    visualização no site ou realização do download de um período igual
    ou inferior a 12 meses (por consulta), com data inicial a partir de
    01/11/2019.
4.  Feito isso, clicar em **Filtrar**. Abrirá uma nova página e no
    rodapé terá a opção de **Baixar o Extrato**, seleciona-se então o
    formato **Excel**. Esse é o arquivo necessário para que o pacote
    consiga fazer os cálculos e gere os arquivos auxiliares para o
    preenchimento do IRPF.
