<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                version="1.0">
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="/">
        <html lang="es">
        <head>
            <meta charset="UTF-8"/>
            <title>Participantes</title>
            <link rel="stylesheet" href="estilos.css"/>
        </head>
        <body>
            <div class="header">
                <h1>Información del concurso</h1>
            </div>

            <main>
                <h2>Listado de Participantes</h2>
                <ol class="participantes">

                    <xsl:apply-templates select="//participante">
                        <xsl:sort select="apellidos"/>
                    </xsl:apply-templates>
                  
                </ol>

                <h2>5 - Mejores participantes con más de 20 puntos</h2>
                <table class="participantes-t ancho">
                    <thead>
                        <tr>
                            <th>Posición</th>
                            <th>Participante</th>
                            <th>Puntos</th>
                        </tr>
                    </thead>


                    <tbody>
                        <xsl:for-each select="//participante[puntos&gt;=20]">
                            <xsl:if test="position()&lt;=5">
                                <tr>
                                <td><xsl:value-of select="position()"/></td>
                                <td>
                                    <xsl:value-of select="apellidos"/>
                                    <xsl:text>, </xsl:text>

                                    <xsl:value-of select="nombre"/>
                                </td>

                                <td><xsl:value-of select="puntos"/></td>

                            </tr>
                            </xsl:if>
                        </xsl:for-each>
                    </tbody>


                </table>

                
                
            </main>
        </body>
        </html>
    </xsl:template>

    <xsl:template match="participante">
        <li>
            <xsl:value-of select="apellidos"/>
            <xsl:text>, </xsl:text>

            <xsl:value-of select="nombre"/>
            <xsl:text>. (</xsl:text>

            <xsl:value-of select="@codigo"/>
            <xsl:text>) - </xsl:text>

            <xsl:value-of select="puntos"/>
            <xsl:text>puntos</xsl:text>
        </li>
    </xsl:template>

</xsl:stylesheet>