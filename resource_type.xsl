<stylesheet version="1.0" xmlns="http://www.w3.org/1999/XSL/Transform" xmlns:write="http://www.w3.org/1999/xhtml" xmlns:wadl="http://wadl.dev.java.net/2009/02" exclude-result-prefixes="wadl">
  <output method="html" indent="yes"/>
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
    <write:html lang="es"/>
      <!--write:head-->
        <!--write:script>resource_type = `<apply-templates />`</write:script-->
        <!--write:script src="../resource_type.js"></write:script-->
      <!--/write:head-->
      <!--write:body onload="transform()"></write:body-->
    <!--/write:html-->
  </template>
  <template match="text()[not(string-length(normalize-space()))]" />
  <template match="text()[string-length(normalize-space()) > 0]">
    <value-of select="translate(., '&#xA;&#x09;&#xD;', ' ')" />
  </template>
</stylesheet>
