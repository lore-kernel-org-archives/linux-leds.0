Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9770848EC9C;
	Mon,  5 Oct 2026 13:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791208483; cv=none; b=Q2q8+bxTIdWGDQEWv0vCVjzWXmWiUKABD62BKLEf1b2jHKlqjGfiV5vcZUtDGDhdmIMnd3u4S4OoO71cTfH384pLMis+/XSrndrQG9qfJwC7uoZBHlZJ//Xm0azzgnzAFM4UrkVZmn4J3QLEH9ayu6aYSAyzkvL5t0gICsPEzKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791208483; c=relaxed/simple;
	bh=dJQ/OjPO0d9VUJKeS9tCzL5uaO+w57R42kmzt6s02us=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hdSCdA7RwICFWikmGkCbqqWTwbSncudThBpKMak4YIXTavra7/LkADsNQFRrqV+VZGL+3lXWqq1vffKNPVOxlZs0708e9xaiiIbiK9Ar0b2V+4w5d0zbeK4jihx0dFL8wcnHGJfBrDIP3Pi38ar+Zz6Pukw1zgW/MEbm4tc8X8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=em+HarII; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="em+HarII"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=i7k5IvRMGds1MAPqGTDkTv6/b7coFgJ33EfhbQAkbc4=; b=em+HarIIj+OxJUMk2atzbp1ywL
	l0IHP5qnXSX66so6a7QlTbxhPwAdIc6ZkTz9xCWi1zFHQN8aKh2rA11lx46eerSHUPFZVyPhpkRF8
	ANNwp++WDnkr0H0yU3sIKQXolWLaS8k1FC4dtUw/hMdZDLo+CE4kdUuKBpMDaK1/BBsCgzR1lg7/j
	LeChSn59DmB476Xn6uhk1GRhzkT237u9ooyysh8o9G+rYNNA6fHruMNd3c8cnWmrmuk9yQfGM6/am
	B2h9VVZhqJz/N7J4ReKwdO09CzABFFlNF9eYQg9A+utEelY83QPhmQkqGp/SfidsxD5wzajQ4jF3B
	aYtRAnAg==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1xDj9F-000Oxa-1u;
	Mon, 05 Oct 2026 15:54:33 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1xDj9E-000HEr-29;
	Mon, 05 Oct 2026 15:54:32 +0200
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
Subject: [PATCH v5 02/11] dt-bindings: leds: pca995x: Describe nxp,output-gain property
Date: Mon,  5 Oct 2026 15:53:26 +0200
Message-ID: <fd684ef359fb96fd24371922eef64bb7685dbb6b.1791207391.git.nora.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791207391.git.nora.schiffer@ew.tq-group.com>
References: <cover.1791207391.git.nora.schiffer@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28144/Mon Oct  5 08:24:24 2026)

Allow configuring the output current to adjust for different hardware
designs.

The output gain relates the output current with an external resistor
connected to the LED driver. It does not directly correspond to a
meaningful physical unit of measurement, so we refer to the datasheet
for information on its calculation.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
---
 Documentation/devicetree/bindings/leds/nxp,pca995x.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/nxp,pca995x.yaml b/Documentation/devicetree/bindings/leds/nxp,pca995x.yaml
index 201f32f1b8139..372ecd18043e0 100644
--- a/Documentation/devicetree/bindings/leds/nxp,pca995x.yaml
+++ b/Documentation/devicetree/bindings/leds/nxp,pca995x.yaml
@@ -39,6 +39,14 @@ properties:
   reset-gpios:
     maxItems: 1
 
+  nxp,output-gain:
+    description:
+      Set the output gain controlling the LED current as described in the
+      PCA995x datasheets.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 127
+    maximum: 255
+
 patternProperties:
   "^led@[0-9a-f]+$":
     type: object
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/

