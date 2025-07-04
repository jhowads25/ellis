# Use uma imagem oficial do Python como imagem base.
# python:3.10-slim é uma boa escolha por ser leve.
FROM python:3.10-slim

# Define o diretório de trabalho dentro do contêiner.
WORKDIR /app

# Copia o arquivo de dependências para o diretório de trabalho.
COPY requirements.txt .

# Instala as dependências.
# --no-cache-dir: Desabilita o cache do pip para reduzir o tamanho da imagem.
# --upgrade pip: Garante que estamos usando a versão mais recente do pip.
RUN pip install --no-cache-dir --upgrade pip -r requirements.txt

# Copia o restante do código da aplicação para o diretório de trabalho.
COPY . .

# Expõe a porta 8000 para que a aplicação possa ser acessada de fora do contêiner.
EXPOSE 8000

# Comando para executar a aplicação quando o contêiner for iniciado.
# Usamos --host 0.0.0.0 para tornar a aplicação acessível externamente.
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]