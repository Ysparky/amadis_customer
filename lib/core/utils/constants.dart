import 'package:dio/dio.dart';

const emailRegex =
    r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?";

const BASE_URL = 'https://amadis-backend.herokuapp.com/api';

final dioOptions = Options(validateStatus: (status) {
  return status < 500;
});

final TERMS_AND_CONDITIONS = '''
El presente documento desarrolla los Términos y Condiciones Generales y las Políticas de Privacidad aplicables al acceso y uso de los servicios ofrecidos por Unión de Cervecerías Peruanas Backus & Johnston S.A.A (en adelante “La Empresa”) dentro del aplicativo y plataforma web en donde estos Términos y Condiciones se encuentren establecidos.
Todos aquellos clientes que deseen acceder a esta plataforma deberán leer, entender y aceptar las condiciones señaladas en el presente documento junto con todas las demás políticas principios que rigen en La Empresa y que son incorporados al presente directamente o por referencia, previo a su registro y verificación de Usuario de Tienda en Línea Backus. Caso contrario, cualquier persona que no acepte estos Términos y Condiciones Generales y las Políticas de Privacidad, los cuales tienen un carácter obligatorio y vinculante, deberá abstenerse de utilizar el aplicativo y plataforma web y/o los servicios.
El presente documento, forma parte integral de todas aquellas transacciones que se ejecuten o celebren mediante la solicitud y venta de productos de La Empresa comprendidos en el aplicativo y plataforma web entre los usuarios de este sitio y La Empresa. Queda claro que todos los actos y/o transacciones realizados en la presente plataforma así como sus efectos jurídicos, quedarán regidos por estas reglas y sometidos a la legislación aplicable al Perú.

I. Condiciones generales

El solo uso del aplicativo y plataforma web constituye la aceptación de todas las condiciones establecidas a continuación:

1. Al momento que el cliente realice operaciones en Tienda en Línea Backus se está comunicando de manera virtual con La Empresa, por ende, el cliente está brindando su consentimiento para recibir las comunicaciones y/o notificaciones de la empresa respecto de la entrega o confirmación de la operación realizada a través del correo electrónico registro .

2. El uso de este aplicativo y plataforma web estará disponible para los clientes que tengan capacidad legal para contratar, esto es todos aquellos clientes que se encuentren debidamente registradas en el aplicativo y plataforma web, acorde a los términos señalados en el acápite III del presente documento. Caso contrario la Empresa se reserva el derecho de retirar y/o suspender el carácter de participante a cualquier cliente que por sus acciones no sea merecedor de este título.

3. La información contenida y procesada en este sistema de información es propiedad de la Empresa y está protegida por derechos de propiedad intelectual. Cualquier actividad dentro de este sistema puede ser monitoreada por la empresa.

4. La Empresa se reserva el derecho de cambiar en cualquier momento la estructura y/o condiciones del programa, así como de modificar o cancelar los beneficios, términos y/o condiciones del mismo, sin previo aviso. Todos los términos modificados entrarán en vigencia al 01 día hábil después de su publicación. En caso de terminación del programa, la Empresa informará a sus clientes oportunamente.

5. Esta aplicativo y plataforma web se acoge a las políticas de la Empresa, referidas a la Compañía de consumo responsable de alcohol, la cual el cliente manifiesta conocer, aceptar y acatar.

6. Una vez aceptadas los Términos y Condiciones Generales y las políticas de Privacidad, se entiende que se han leído, entendido y que está de acuerdo con las normas. Corresponde al cliente hacer uso responsable de los beneficios otorgados por el programa.

II. Generalidades del programa

El programa consta de dos módulos: solicitud de producto y (ii) compra de producto, los cuales se pueden adquirir a través del aplicativo y la plataforma web. La disponibilidad de productos y/o presentaciones varían dependiendo de la localidad y necesidades especiales.
Sobre la inscripción e ingreso a la aplicación

1. Los clientes participantes tienen la posibilidad de ingresar al aplicativo y la plataforma web y están inscritos de forma automática. La Empresa podrá utilizar diversos medios para identificar a sus miembros, pero no se hace responsable por la certeza de los datos personales provistos por los clientes. Los clientes garantizan y responden, en cualquier caso, de la veracidad, vigencia y autenticidad de los Datos Personales ingresados.

2. Cada cliente tiene una cuenta individual que se activa la primera vez que ingresa.

3. Los clientes pueden ingresar al aplicativo y la plataforma web a través de un correo y contraseña que se encuentras asociados a su código de cliente. Ningún cliente podrá ingresar a éste con un correo diferente al propio.

Sobre el manejo de la cuenta individual en el aplicativo y la plataforma web

1. La Empresa informará los pasos que deberá seguir para el procedimiento de registro así como de acceso a el aplicativo y la plataforma web.

2. La Empresa podrá realizar los controles que crea conveniente para verificar la veracidad de la información dada por los clientes.

3. Es responsabilidad del cliente el manejo y monitoreo de su cuenta para asegurar que ninguna otra persona ingrese, realice consultas o transacciones.

4. Corresponde al cliente reportar cualquier actividad irregular registrada en su cuenta, que sea de su conocimiento y que no haya sido realizada directamente por él.

5. El cliente debe garantizar que los datos suministrados en el momento de solicitar sus pedidos están actualizados.

6. La Empresa presume la buena fe y el carácter honesto de cada uno de sus clientes. Si se verifica o sospecha algún uso fraudulento y/o malintencionado y/o contrario a esto Términos y Condiciones y/o contrarios a la buena fe, la Empresa tendrá el derecho de dar de baja y tomar las acciones respectivas.

Sobre compra de producto.

1. Toda solicitud del pedido será aceptada a través de la aceptación vía electrónica y utilizando los mecanismos que el aplicativo y la plataforma web ofrece para ello.

2. Los pedidos deben ser solicitados dentro de los plazos establecidos para que sean entregados el día de despacho respectivo.

3. Los Clientes tienen la posibilidad de realizar sus pedidos de compra siempre y cuando acepte los términos y condiciones establecidos - incluye entrega en el hogar.

4. Cuando el cliente realiza pedidos de compra de producto, la forma de pago puede ser de dos formas señaladas a continuación:

Directamente al camión de reparto que entrega su pedido.
A las cuentas bancarias de la compañía

5. El cliente se encuentra obligado sa revisar cuidadosamente las solicitudes del producto solicitado (, características y cantidades).

6. Los precios señalados en la plataforma corresponden exclusivamente al valor del bien ofrecido y no incluyen gastos transporte, manejo y envío que no se describan expresamente ni ningún otro ítem adicional o cobro de intereses bancarios por el método de pago utilizado.

7. Para validar la transacción, la empresa debe verificar lo siguiente:

Que se haya acreditado el pago.
Que los datos del producto solicitado por el cliente coincidan con los proporcionados al efectuar la compra.
Que el medio de pago registrado por el cliente sea válido
Que exista stock disponible del producto solicitado
Sobre la entrega de producto

1. Los productos solicitados a través de el aplicativo y la plataforma web se sujetarán a las condiciones de despacho y entrega elegidas por el cliente y disponibles en la misma plataforma.

2. Las fechas de entrega se ejecutarán acorde a la frecuencia de visita programada con anticipación.

3. Es responsabilidad del cliente diligenciar de manera clara y completa sus datos personales con la dirección de entrega, distrito y cuidad, así como un número de celular, teléfono y mail de contacto en el momento de la solicitud para proceder con la entrega correcta y oportuna de los productos.

4. Sin excepciones, en el momento de recibir el producto, este debe ser revisado y verificado. No se aceptan reclamos posteriores de no ser por condiciones de calidad del producto. Recuerde que por tratarse de una venta virtual, las devoluciones sólo se aceptan por errores de envío o calidad del material.

III. Política de tratamiento de Datos Personales

Recopilación y utilización de información personal

La información personal que usted proporcionará en forma libre a LA EMPRESA incluye su nombre, dirección, número telefónico, fecha de nacimiento y dirección electrónica. LA EMPRESA usará su información personal proporcionada para identificarlo, contactarlo y enviarle la información y/o productos solicitados, Asimismo, LA EMPRESA podrá usar su información para enviarle anuncios o invitaciones, información publicitaria sobre los productos comercializados por LA EMPRESA. Brindar su información personal a LA EMPRESA es completamente voluntario, sin embargo, si no desea suministrar tu información personal LA EMPRESA no podrá brindarle la información requerida por usted.

El acceso a ciertas secciones de nuestro aplicativo y plataforma web, está limitado a personas mayores de 18 años o a cualesquiera que tenga la mayoría de edad para comprar y consumir alcohol en el país, estado, departamento, municipio o territorio desde donde se esté accediendo a nuestro aplicativo y plataforma web. En tales casos, no tenemos la intención de reunir información personal de menores de 18 años o de la edad mínima legal (cuando es superior a los 18 años). Si nos enteramos de haber obtenido información personal de menores de edad, borraremos tal información de inmediato.

Transferencia y almacenamiento de su información personal

LA EMPRESA podrá transferir y usar su información personal a nivel transfronterizo para los propósitos señalados en este documento. Por lo tanto usted está de acuerdo con que su información personal pueda ser almacenada, transferida y sea accesible a LA EMPRESA y a sus empresas vinculadas para dichos propósitos. La información personal que suministrará será tratada de acuerdo a las leyes de protección de datos personales y privacidad.

Si es necesario LA EMPRESA podrá revelar su información personal para los propósitos descritos anteriormente a: otras empresas vinculadas a LA EMPRESA, y/o unidades de negocio pertenecientes a AB Inbev; (ii) subcontratistas, vendedores o proveedores que prestan servicios a nuestra empresa o en nuestro nombre; (iv) una organización adquirente en caso LA EMPRESA se encuentre involucrada en una venta o transferencia de algunos o todos sus negocios o se produzca un cambio de control; o (v) LA EMPRESA se encuentre obligada a hacerlo porque alguna autoridad o la ley lo ordena.

La información personal que entregue a LA EMPRESA en el marco del proceso de selección ingresará y permanecerá almacenada en las bases de datos de LA EMPRESA, ubicadas en [●]. Su información personal será almacenada en soportes tanto físicos como virtuales.

Seguridad y derechos del titular de datos personales

Consideramos importante la precisión y seguridad de sus datos personales y hemos establecido procedimientos físicos y electrónicos para conservar la seguridad de su información personal de conformidad con la legislación aplicable en materia de protección de datos personales. Por lo tanto, solamente el personal administrativo autorizado tendrá acceso a esta información.

Usted siempre puede acceder, actualizar, rectificar, incluir o eliminar su información personal de nuestra base de datos.

IV. Consentimiento y Autorización

Al utilizar el presente aplicativo y la plataforma web e ingresar su información personal, autorizo a La Empresa para almacenar mi información personal en una base de datos mantenida por la empresa y/o por un tercero encargado y para procesar, transferir, usar, divulgar y dar tratamiento de la manera más amplia posible a mi información personal para los fines descritos en este aviso.

V. Propiedad Intelectual

Todo el contenido incluido o puesto a disposición del cliente que se encuentre en el aplicativo y la página web, incluyendo textos, gráficas, logos, íconos, imágenes, archivos de audios; asimismo, las marcas, denominativas o figurativas, marcas de servicio, diseños industriales y cualquier otro elemento de propiedad intelectual que haga parte del contenido, son de propiedad de La Empresa o ha sido licenciada ésta por las empresas proveedoras.

En ese sentido, el cliente debe abstenerse de extraer y/o reutilizar partes del contenido del aplicativo y la página web sin el consentimiento precio y expreso de la empresa. El uso indebido y la reproducción total o parcial de dichos contenidos quedan prohibidos, salvo autorización expresa y escrita por La Empresa.

VI. Responsabilidad e indemnización

La Empresa, hará lo posible dentro de sus capacidades para que las solicitudes de pedidos sea ininterrumpida y libre de errores; sin embargo, dada la naturaleza del Internet, dichas condiciones no pueden ser garantizadas. En el mismo sentido, el acceso del cliente a la cuenta puede ser ocasionalmente restringido o suspendido con el objeto de efectuar reparaciones, mantenimiento o introducir nuevos servicios. Queda claro que, La Empresa no se hará responsable por pérdidas que no hayan sido causados por el incumplimiento de sus obligaciones, y/o cualquier daño indirecto.

VII. Jurisdicción y Ley Aplicable

Estos Términos y Condiciones Generales y las Políticas de Privacidad estará regido en todos sus puntos por las leyes vigentes en la República del Perú.
''';
