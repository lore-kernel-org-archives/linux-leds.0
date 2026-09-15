Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8E745D91C;
	Tue, 15 Sep 2026 13:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789479928; cv=none; b=j3tvJ+Ikzujbw6AkVX5kfiL9sct0sUwmMiJPfP/Ydqt71GQA1Y5WKQ42tNu3uUmxAeVqN72rUlcx25Q13vofYMrFwu7Q2bt5LwTWAFcXMQC8mJHSuHUw3BhzaRrjbMsU5jEpkUnNKfHrtXAo4ip4F6+V5PjDo8stGAhSo9L0XZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789479928; c=relaxed/simple;
	bh=4IitQqI7ba4jtAfNF2zkFM3ozkicT6ADviuknYTAOv8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ORie6DvnT5Oa1WKQcYXnGb2K1OlmKwidTkb36K3NUDX80DUI889BhNQjHi/IsxcI2RyaF0sDzXk8E+504BtEBgkaRSo8NF6eoimrDOFeYw1fFqictMmNlCvJff2zf22wg6iWYfTT5QSSFhoL0OMOQ0sDBbZ+5KGgfwqGOM12tBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=e0+IC8UT; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="e0+IC8UT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=7ybuTRr6DcCsseLWtT9YymOa+tKJfjSwPPrvPjf2DuM=; b=e0+IC8UT+UFCtwmSAxQ5BYnAcr
	f7QVjLa8StEaXCSguhJlUMZl4o6VAnEsotScgMJecFFpQ37fkhBBxQVfsgqhZyDp5W5v05bTVAQED
	0TsYmD1B+a9aK28LLwUMrYlihtucmDwxveobjZAq84EX5jXn2vcwu0a5pYLBTQOsrdRjfkYCSV0nr
	ZFP2K8VHN/47VH3hUz1PxYA+i3aTiA/rA/c5ZIXnEnqDAr69aU87qGP/8jKVQ4krdJVLbzGhgnAVr
	y10twlpmRTWWFeN0meqv1Rm4+6Kx6Mcuq+mF68RM/byIDp0M9dws7RapuZVfuWvblW9QdLKkVHlxa
	zSfPHJOQ==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1x6TTI-0003gd-0u;
	Tue, 15 Sep 2026 15:45:16 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1x6TTH-000FKf-1c;
	Tue, 15 Sep 2026 15:45:15 +0200
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Isai Gaspar <isaiezequiel.gaspar@nxp.com>,
	linux@ew.tq-group.com,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nora Schiffer <nora.schiffer@ew.tq-group.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 1/8] dt-bindings: leds: pca995x: Describe reset-gpios property
Date: Tue, 15 Sep 2026 15:43:49 +0200
Message-ID: <bd687915af26ccdbfc8cc911eee0787fc8145ae1.1789477502.git.nora.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28124/Tue Sep 15 08:27:28 2026)

The PCA9952/PCA9955B/PCA9956B have a reset pin. Allow describing it in
the Device Tree.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
---

v2:
- Use full hardware model names in commit description
- Add Reviewed-by tag

 Documentation/devicetree/bindings/leds/nxp,pca995x.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/nxp,pca995x.yaml b/Documentation/devicetree/bindings/leds/nxp,pca995x.yaml
index ab8c90cbadb5c..201f32f1b8139 100644
--- a/Documentation/devicetree/bindings/leds/nxp,pca995x.yaml
+++ b/Documentation/devicetree/bindings/leds/nxp,pca995x.yaml
@@ -36,6 +36,9 @@ properties:
   "#size-cells":
     const: 0
 
+  reset-gpios:
+    maxItems: 1
+
 patternProperties:
   "^led@[0-9a-f]+$":
     type: object
@@ -54,6 +57,7 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/gpio/gpio.h>
     #include <dt-bindings/leds/common.h>
 
     i2c {
@@ -65,6 +69,7 @@ examples:
             reg = <0x01>;
             #address-cells = <1>;
             #size-cells = <0>;
+            reset-gpios = <&gpio2 5 GPIO_ACTIVE_LOW>;
 
             led@0 {
                 reg = <0x0>;
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/
