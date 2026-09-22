Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D9A3921E7;
	Tue, 22 Sep 2026 14:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790088516; cv=none; b=RM89cfws4CMAj0mxulyn0+CXLIAtM5uO2Ddct281+DDVTRQa5VC/ll8kHpr0EmHeOjqKQMx2vkqsvaQvR3svKZXBgcqxPjqVwZHb344YVg3osf9rYnxJ1kiLWNiECfNQ7+l05SMf/f80qq58zMGP6383Fp1k3XTLPIfIsov1AQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790088516; c=relaxed/simple;
	bh=vJi86saIr1/40Et3dWwomOxIHMaM63R74DUM9jlg4H4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uilPegz2G4VFAF2nnIlvuGaujFepE0eF+T8Yof5vzFtIUGcM2lbQ1ZFE2K4vZHdr5bQQ8sCzyVs0IdkFEHLZJlucpAVtl032z5pfTGwuoomFupK4l2iF4DXc3W96x4f6VcGdKiXYjIJLC6YdHxsVg//P3I0iEwztpdH5nQ3iE1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=cCml8eyS; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="cCml8eyS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=vhXDYtyGCDRT+cNiO1bVxa+AteKhhtDcHPRBs2AsmQk=; b=cCml8eySAlApMpD0KTjYUcuYPr
	L73SVWMwl7FsDa3kovNDvjitRp6IyThIdc8cndkRMDcwk0mc1l4UoKtUIZNtgBt9n/P6G6tqvFaWd
	1fCrjJ9ifml/NnVIlJVojfWEZTZq1IA7FARdiZLn8YjapwWF+4nUh3AftCSCg0D1FBnUTnRla/I6i
	S+d1wgdxj2G1iM5hMzfguCcP2bsbQKpyZBrvy+UbZRTchTUgj9Ewy/+6j7yl/cUq4/0XGEQWzl1UT
	z4URebESyfcPXt6PSH4fY3LXvAQ5m5iDHxgYmLI7wu0v0f74Adr7KuNMSuAfkaX93DK15662Une7n
	TOpaIeeA==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1x91nF-000MgO-1L;
	Tue, 22 Sep 2026 16:48:25 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1x91nE-000PP0-2n;
	Tue, 22 Sep 2026 16:48:24 +0200
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Isai Gaspar <isaiezequiel.gaspar@nxp.com>,
	Marek Vasut <marex@denx.de>,
	Pieterjan Camerlynck <pieterjanca@gmail.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	linux@ew.tq-group.com,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nora Schiffer <nora.schiffer@ew.tq-group.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 01/10] dt-bindings: leds: pca995x: Describe reset-gpios property
Date: Tue, 22 Sep 2026 16:47:48 +0200
Message-ID: <3e6c859ffad2543243a9d55183e3bfbb9c5afe43.1790087890.git.nora.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790087890.git.nora.schiffer@ew.tq-group.com>
References: <cover.1790087890.git.nora.schiffer@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28131/Tue Sep 22 08:27:06 2026)

The PCA9952/PCA9955B/PCA9956B have a reset pin. Allow describing it in
the Device Tree.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
---
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

