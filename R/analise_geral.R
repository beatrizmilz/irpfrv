#' Analise geral dos seus ativos
#'
#' Essa funcao calcula o preço medio, o custo de aquisicao e a quantidade de cada ativo que a pessoa possui em carteria
#'
#' @param arquivo_b3 tabela xlsx contendo o extrato de negociação dos ativos de renda variavel gerada pelo site da B3
#' @param classe qual classe de ativo deve ser analisado (acoes, etfs ou fiis), sem aspas
#'
#' @return uma tibble
#' @export
#'
#' @examples
analise_geral <- function(arquivo_b3 = arquivo_b3,
                        classe = acoes) {
  readxl::read_excel(arquivo_b3) %>%
    janitor::clean_names() %>%
    dplyr::select(codigo_de_negociacao, tipo_de_movimentacao,
                  data_do_negocio, quantidade, valor, preco) %>%
    dplyr::mutate(
      valor = dplyr::case_when(tipo_de_movimentacao == "Venda" ~ valor*(-1),
                               TRUE ~ valor),
      quantidade = dplyr::case_when(tipo_de_movimentacao == "Venda" ~ quantidade*(-1),
                                    TRUE ~ quantidade)) %>%
    dplyr::group_by(codigo_de_negociacao) %>%
    dplyr::summarise(preco_medio = mean(preco),
                     numero_ativos = sum(quantidade),
                     custo_aquisicao = preco_medio * numero_ativos) %>%
    dplyr::mutate(codigo = stringr::str_replace(codigo_de_negociacao,
                                                "F", "")) %>%
    dplyr::select(codigo_de_negociacao, codigo,
                  preco_medio, custo_aquisicao, numero_ativos) %>%
    dplyr::inner_join(classe, by = "codigo")

}


