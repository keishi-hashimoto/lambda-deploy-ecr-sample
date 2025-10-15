FROM public.ecr.aws/lambda/python:3.13

ARG REQUIREMENTS_FILE

COPY ${REQUIREMENTS_FILE} ${LAMBDA_TASK_ROOT}

RUN pip install -r ${REQUIREMENTS_FILE}

COPY src/* ${LAMBDA_TASK_ROOT}

CMD [ "my_func.my_handler" ]