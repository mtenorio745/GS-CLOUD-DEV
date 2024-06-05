# Use uma imagem base leve do Alpine Linux
FROM alpine:latest

# Definir variáveis de ambiente
ENV NODE_ENV=production

# Atualizar e instalar dependências
RUN apk update && \
    apk upgrade && \
    apk add --no-cache nodejs npm && \
    npm install -g nodemon

# Definir o diretório de trabalho dentro da imagem
WORKDIR /app

# Copiar os arquivos da aplicação para o diretório de trabalho
COPY package*.json ./
COPY app.js ./

# Instalar dependências da aplicação
RUN npm install

# Expor a porta em que a aplicação será executada
EXPOSE 3000

# Comando padrão para executar a aplicação
CMD ["nodemon", "app.js"]
