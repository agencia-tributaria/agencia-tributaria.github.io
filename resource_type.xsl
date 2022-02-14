<stylesheet version="1.0" xmlns="http://www.w3.org/1999/XSL/Transform" xmlns:wadl="http://wadl.dev.java.net/2009/02">
  <output method="html"/>
  <template match="@*|node()">
    <choose>
      <when test="self::wadl:*[@href]">
        <apply-templates select="document(@href)/node"/>
      </when>
      <otherwise>
        <if test="not(self::processing-instruction())">
          <copy>
            <apply-templates select="@*|node()" />
          </copy>
        </if>
      </otherwise>
    </choose>
  </template>
  <template match="/">
    <text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;&#xA;</text>
    <html lang="es" xmlns="http://www.w3.org/1999/xhtml">
      <head>
        <title><choose xmlns="http://www.w3.org/1999/XSL/Transform">
          <when test="wadl:doc/@title">
            <value-of select="wadl:doc/@title" />
          </when>
          <otherwise>
            <text>REST Interface</text>
          </otherwise>
          </choose></title>
        <script>resource_type = `<apply-templates xmlns="http://www.w3.org/1999/XSL/Transform" />`</script>
        <script src="../resource_type.js"></script>
      </head>
      <body onload="transform()"></body>
    </html>
  </template>
  <template match="text()[not(string-length(normalize-space()))]" />
  <template match="text()[string-length(normalize-space()) > 0]">
    <value-of select="translate(., '&#xA;&#x09;&#xD;', ' ')" />
  </template>
</stylesheet>
