from my_utils.helper import add_numbers

def lambda_handler(event, context):
    result = add_numbers(3, 4)
    return {
        "statusCode": 200,
        "body": f"3 + 4 = {result}"
    }
