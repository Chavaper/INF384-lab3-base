# Etapa 1: instalar dependencias de producción desde el lock file
FROM public.ecr.aws/lambda/nodejs:22 AS build
WORKDIR ${LAMBDA_TASK_ROOT}
COPY package.json package-lock.json ./
RUN npm ci --omit=dev

# Etapa 2: imagen final, solo lo que se ejecuta
FROM public.ecr.aws/lambda/nodejs:22 AS runtime
WORKDIR ${LAMBDA_TASK_ROOT}
COPY --from=build ${LAMBDA_TASK_ROOT}/node_modules ./node_modules
COPY src ./src

CMD ["src/handler.handler"]