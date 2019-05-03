### Implementação de um Sistema Especialista Fuzzy para Consumo de Combustível
### Lucas Chegatti e Arthur Dalcastagne

### 1 Introdução

<p>
  Esse relatório descreve toda a implementação do Sistema Especialista Fuzzy para Consumo de Combustível utilizando a ferramenta FuzzyClips. O objetivo do sistema é controlar o consumo de combustível do veículo, considerando como variáveis auxiliares a velocidade e o peso do veículo.
</p>
<p align="center">
  As variáveis linguísticas de entrada e saída são mostradas na tabela 1.
  <img src="img/tabela.PNG">
  <br/>
  Tabela 1 Variáveis linguísticas para consumo de combustível
</p>
<p>
A primeira coluna da tabela 1 descreve os valores considerados para o peso do carro, enquanto na primeira linha descreve os valores considerados para a velocidade do veículo, as demais informações são em relação ao consumo de combustível de acordo com o peso e velocidade.
</p>

### 2 Implementações e Testes

<p>
  Para implementar o código foi utilizado um editor de texto Visual Studio Code, e no código foram descritos um template para cada variável linguística, foi utilizado duas funções pré-definidas (Z e S) e uma trapezoide:
</p>

```
(deftemplate Peso
0 1300 kg
    ((leve (z 0 800))
    (medio (700 0)(800 1)(1000 1)(1100 0))
    (pesado (s 1000 1300))
    )
)
```

<p>
  A Figura 1 mostra os valores numéricos possíveis para o peso, leva em consideração as variáveis linguísticas na Tabela 1 e no template em questão.
</p>

<p align="center">
  As variáveis linguísticas de entrada e saída são mostradas na tabela 1.
  <img src="img/exemplo-peso.PNG">
  <br/>
  Figura 1. Plotagem dos Valores numéricos possíveis para a peso
</p>

