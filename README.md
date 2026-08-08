# Nevolus Zabbix Installer (NZI)

Automatize a instalação e configuração do **Zabbix Agent2** em distribuições Linux de forma simples, rápida e padronizada.

---

## Funcionalidades

- Instalação automática do Zabbix Agent2
- Configuração automática do Agent2
- Instalação dos plugins oficiais
- Configuração automática do Firewall
- Inicialização e habilitação do serviço
- Detecção automática do Sistema Operacional
- Detecção automática do Hostname
- Seleção automática da versão do Zabbix
- Catálogo centralizado de repositórios
- Estrutura modular para facilitar manutenção

---

## Sistemas Operacionais Suportados

| Sistema | Versão do Zabbix |
|---------|------------------|
| AlmaLinux 8 | 7.4 |
| AlmaLinux 9 | 7.4 |
| AlmaLinux 10 | 7.4 |
| Rocky Linux 8 | 7.4 |
| Rocky Linux 9 | 7.4 |
| Rocky Linux 10 | 7.4 |
| Red Hat Enterprise Linux 8 | 7.4 |
| Red Hat Enterprise Linux 9 | 7.4 |
| Red Hat Enterprise Linux 10 | 7.4 |
| Oracle Linux 8 | 7.4 |
| Oracle Linux 9 | 7.4 |
| CloudLinux 7 | 6.0 LTS |
| CloudLinux 8 | 7.4 |
| CloudLinux 9 | 7.4 |
| CentOS 7 | 6.0 LTS |
| Ubuntu 22.04 | 7.4 |
| Ubuntu 24.04 | 7.4 |
| Debian 11 | 7.4 |
| Debian 12 | 7.4 |

---

# Estrutura do Projeto

```
nzi
├── conf
│   ├── config.sh
│   └── repos.sh
│
├── lib
│   ├── banner.sh
│   ├── colors.sh
│   ├── configure.sh
│   ├── firewall.sh
│   ├── functions.sh
│   ├── installer.sh
│   ├── menus.sh
│   ├── plugins.sh
│   ├── service.sh
│   └── summary.sh
│
├── install.sh
├── LICENSE
└── README.md
```

---

# Como utilizar

Clone o projeto:

```bash
git clone https://github.com/bryandecarvalho/nzi.git
```

Entre na pasta:

```bash
cd nzi
```

Dê permissão de execução:

```bash
chmod +x install.sh
```

Execute como root:

```bash
sudo ./install.sh
```

---

# Fluxo de Instalação

O NZI executa automaticamente as seguintes etapas:

1. Detecta o Sistema Operacional
2. Detecta a versão do Sistema
3. Detecta o Hostname
4. Permite alterar o Hostname (opcional)
5. Seleciona automaticamente a versão do Zabbix
6. Obtém o repositório adequado
7. Instala o repositório oficial
8. Instala o Zabbix Agent2
9. Instala os plugins oficiais
10. Configura o Agent2
11. Configura o Firewall
12. Habilita e inicia o serviço
13. Exibe o resumo da instalação

---

# Arquitetura

O projeto é dividido em módulos independentes.

| Arquivo | Responsabilidade |
|----------|------------------|
| config.sh | Configurações gerais |
| repos.sh | Catálogo de repositórios oficiais |
| menus.sh | Menus e interação com usuário |
| installer.sh | Instalação do Agent2 |
| configure.sh | Configuração do Agent2 |
| plugins.sh | Instalação dos plugins |
| firewall.sh | Configuração do Firewall |
| service.sh | Inicialização do serviço |
| summary.sh | Resumo da instalação |

---

# Repositórios

O NZI utiliza apenas os repositórios oficiais do Zabbix.

Todos os links ficam centralizados em:

```
conf/repos.sh
```

Isso facilita futuras atualizações de versões e inclusão de novos sistemas operacionais.

---

# Roadmap

## v1.0.0

- Instalação automática
- Configuração automática
- Plugins oficiais
- Firewall
- Detecção do Sistema Operacional
- Detecção do Hostname
- Catálogo centralizado de repositórios

## v1.1.0

- Menu Ferramentas
- Reconfiguração do Agent2
- Atualização automática
- Reinstalação de plugins
- Reinício de serviços

## v1.2.0

- Instalação silenciosa (Silent Mode)
- Parâmetros via linha de comando
- Arquivo de resposta

---

# Licença

Este projeto está licenciado sob a licença MIT.

---

# Autor

**Bryan Carvalho**

Administrador de Sistemas

Nevolus

---

# Contribuição

Contribuições são bem-vindas.

Caso encontre algum problema, abra uma Issue ou envie um Pull Request.

---

# Status

🚧 Em desenvolvimento

Versão atual:

```
v1.0.0
```