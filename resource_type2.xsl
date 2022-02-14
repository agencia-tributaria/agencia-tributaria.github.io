<stylesheet version="1.0" xmlns="http://www.w3.org/1999/XSL/Transform" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:wald="http://wadl.dev.java.net/2009/02">
  <output method="html"/>
  <template match="/">
    <text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;&#xA;</text>
    <html lang="es" xmlns="http://www.w3.org/1999/xhtml">
      <head>
        <title><xsl:value-of select="wadl:doc/@title" /></title>
        <script>resource_type = '<xsl:apply-templates />'</script>
        <script src="../resource_type.js"></script>
      </head>
      <body>Hello, World</body>
    </html>
  </template>
</stylesheet>
