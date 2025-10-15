from aws_lambda_powertools import Logger, Tracer
from aws_lambda_powertools.utilities.typing import LambdaContext

logger = Logger()
tracer = Tracer()


@logger.inject_lambda_context
@tracer.capture_lambda_handler
def my_handler(event: dict, context: LambdaContext):
    logger.info({"event": event})
    logger.info("Hello World")
    return {"code": "200", "msg": "OK"}
