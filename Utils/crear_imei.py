import random

def generar_imei():
    return "".join([str(random.randint(0,9)) for _ in range(15)])
