# Nevolus Zabbix Installer (NZI)

<p align="center">
  <img src="https://img.shields.io/badge/Version-1.0.0-blue.svg">
  <img src="https://img.shields.io/badge/Linux-AlmaLinux%20|%20Ubuntu%20|%20Debian-success">
  <img src="https://img.shields.io/badge/Zabbix-Agent2-red">
  <img src="https://img.shields.io/badge/License-MIT-green">
</p>

---

## 📖 Sobre

O **Nevolus Zabbix Installer (NZI)** é uma ferramenta desenvolvida para automatizar a instalação e configuração do **Zabbix Agent2** em distribuições Linux suportadas.

O objetivo do projeto é padronizar a instalação do agente Zabbix, reduzindo o tempo de implantação e minimizando erros de configuração em ambientes de produção.

---

## ✨ Funcionalidades

- Instalação automática do Zabbix Agent2
- Instalação dos plugins oficiais
- Configuração automática do Agent
- Configuração do Firewall
- Inicialização automática do serviço
- Backup do arquivo de configuração
- Detecção automática do Sistema Operacional
- Detecção automática do Hostname
- Interface interativa em terminal

---

## ✅ Sistemas Operacionais Suportados

| Sistema Operacional | Status |
|---------------------|--------|
| AlmaLinux 8 | ✅ |
| AlmaLinux 9 | ✅ |
| AlmaLinux 10 | ✅ |
| Ubuntu 22.04 LTS | ✅ |
| Ubuntu 24.04 LTS | ✅ |
| Debian 11 | ✅ |
| Debian 12 | ✅ |

---

## 📦 Estrutura do Projeto

```
nzi/
├── conf/
│   └── config.sh
│
├── lib/
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
├── CHANGELOG.md
├── README.md
└── .gitattributes
```

---

## 🚀 Como utilizar

Clone o projeto:

```bash
git clone https://github.com/SEU_USUARIO/nzi.git
```

Acesse o diretório:

```bash
cd nzi
```

Conceda permissão de execução:

```bash
chmod +x install.sh
```

Execute como **root**:

```bash
sudo ./install.sh
```

---

## ⚙️ O instalador realiza automaticamente

- Detecta o Sistema Operacional
- Detecta a versão da distribuição
- Detecta o Hostname da máquina
- Instala o repositório oficial do Zabbix
- Instala o Zabbix Agent2
- Instala os plugins oficiais
- Configura o Agent2
- Configura o Firewall
- Habilita e inicia o serviço
- Exibe um resumo final da instalação

---

## 📁 Arquivos Configurados

Agent2

```
/etc/zabbix/zabbix_agent2.conf
```

Backup automático

```
/etc/zabbix/zabbix_agent2.conf.bak.<DATA>
```

---

## 🔥 Firewall

### firewalld

Libera automaticamente:

```
10050/TCP
```

---

## 🔧 Serviço

Após a instalação:

```bash
systemctl status zabbix-agent2
```

Iniciar manualmente:

```bash
systemctl start zabbix-agent2
```

Reiniciar:

```bash
systemctl restart zabbix-agent2
```

---

## 📋 Roadmap

### v1.0.0

- Instalação automatizada
- Configuração do Agent
- Firewall
- Plugins
- Serviço

### v1.1.0

- Ferramentas de manutenção
- Atualização do Agent2
- Reconfiguração do Agent
- Instalação individual de plugins

### v1.2.0

- Instalação silenciosa (CLI)
- Arquivo de configuração (.env)
- Logs detalhados

---

## 🤝 Contribuição

Contribuições são bem-vindas.

Caso encontre algum problema, abra uma Issue ou envie um Pull Request.

---

## 👨‍💻 Autor

**Bryan Carvalho**

Administrador de Sistemas

Nevolus

---

## 📄 Licença

Este projeto está licenciado sob a licença MIT.

---

# NZI

Nevolus Zabbix Installer

Versão 1.0.0