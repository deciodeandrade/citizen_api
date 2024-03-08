## Iniciando o Projeto

Após clonar o projeto em sua máquina, navegue até o diretório do projeto no terminal e siga as etapas abaixo:

1. Execute: `bundle install`
2. Execute: `rails db:create`
3. Execute: `rails db:migrate`
4. Execute: `rails s`

Para parar o servidor, pressione `Ctrl + C` no terminal.

---

## Executando o Sidekiq Manualmente

Para executar o Sidekiq manualmente, use o comando:

```bash
bundle exec sidekiq --environment development --config config/sidekiq.yml
