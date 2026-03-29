Received: from szelinsky.de (szelinsky.de [85.214.127.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025D237AA9D;
	Sun, 29 Mar 2026 15:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.127.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774798328; cv=none; b=aqZQ2679Y2G+mTyClnNEZKWQ8z2q70JwZJWy5tLC+W2LjjI42j6neDoAO2Kf8igjYJ9pHTCi3+EkAX1JCBTqEQ/TDNIuJL1QHaugHm1U96+k90QepPUmNlvES6F20/vTFj6z2uKF6MoQMzdc5lYyQFNtRl7oNH377suRCccU714=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774798328; c=relaxed/simple;
	bh=pQEl61Ld355JdFpBhzD7t5kMB8wSVfZ7RjLG69EOToE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pUPlVy+w3xsAdMTp80DyQ73zBlbhQbmMArt5DdLJOq2A8j+MX1FK7M7FlGxN0juNBhwA8ST27wCeIdw0bsPKheccx1PmphM3ub1WPPkwRCyNoU+Ot79JWJfNJIRaFrDoN/PvnlC7nqDeBOYRnpmQDFEWyQLp4a/iS85T4UcWLYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szelinsky.de; spf=pass smtp.mailfrom=szelinsky.de; dkim=temperror (0-bit key) header.d=szelinsky.de header.i=@szelinsky.de header.b=SJ8oniBE; arc=none smtp.client-ip=85.214.127.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szelinsky.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szelinsky.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=szelinsky.de header.i=@szelinsky.de header.b="SJ8oniBE"
Received: from localhost (localhost [127.0.0.1])
	by szelinsky.de (Postfix) with ESMTP id 2E003E83AA4;
	Sun, 29 Mar 2026 17:32:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szelinsky.de;
	s=mail; t=1774798325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4K6WqSAjwh3NL8zDobckyek5utyu1AveOlGlUj/60rk=;
	b=SJ8oniBEkVa3PRsapaiilYUXhiNQda9jf/ruaEi0njEOdKzBvKJ/JThPd+kiHkgE3KVfdb
	v8pL02NtDyWP/gDWb3T0RkAxa7xeBtTjqd4ymCffWzEkErB4OYrzSNjMuKNKDDLlQTjWpu
	k5RkOY8mYlpCmgiSL3usiMblRzYIl7rFXPD27cLSyC+hiZQFueXJ94ZhGpO60aN/Xstb8q
	5xmQHGD72UNjjtNJ2Fq40r0XcAAMrAK1bcQSzYXcsq8OqLiRuSlxylreQzWe+7pKOdshx8
	tK1bqcpkc8LlAfPV2U1dos3NqKpW2iXu+51NopIrA2otJ2qyQfkjmaYIC7S1MA==
X-Virus-Scanned: Debian amavisd-new at szelinsky.de
Received: from szelinsky.de ([127.0.0.1])
	by localhost (szelinsky.de [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id Kjin04ifB6pW; Sun, 29 Mar 2026 17:32:05 +0200 (CEST)
Received: from p14sgen5.fritz.box (dslb-002-205-089-102.002.205.pools.vodafone-ip.de [2.205.89.102])
	by szelinsky.de (Postfix) with ESMTPSA;
	Sun, 29 Mar 2026 17:32:04 +0200 (CEST)
From: Carlo Szelinsky <github@szelinsky.de>
To: Oleksij Rempel <o.rempel@pengutronix.de>,
	Kory Maincent <kory.maincent@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	Carlo Szelinsky <github@szelinsky.de>
Subject: [PATCH net-next v3 1/3] dt-bindings: net: pse-pd: add poll-interval-ms property
Date: Sun, 29 Mar 2026 17:31:22 +0200
Message-ID: <20260329153124.2823980-2-github@szelinsky.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260329153124.2823980-1-github@szelinsky.de>
References: <20260329153124.2823980-1-github@szelinsky.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the optional poll-interval-ms property for PSE controllers that
use poll-based event detection instead of interrupts. Defaults to
500ms if not specified.

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Carlo Szelinsky <github@szelinsky.de>
---
 .../devicetree/bindings/net/pse-pd/pse-controller.yaml    | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/pse-pd/pse-controller.yaml b/Documentation/devicetree/bindings/net/pse-pd/pse-controller.yaml
index cd09560e0aea..329d020f054c 100644
--- a/Documentation/devicetree/bindings/net/pse-pd/pse-controller.yaml
+++ b/Documentation/devicetree/bindings/net/pse-pd/pse-controller.yaml
@@ -27,6 +27,14 @@ properties:
       subnode. This property is deprecated, please use pse-pis instead.
     enum: [0, 1]
 
+  poll-interval-ms:
+    description:
+      Polling interval in milliseconds for PSE controllers using
+      poll-based event detection instead of interrupts. Used when the
+      controller lacks IRQ support or the IRQ line is not wired.
+    default: 500
+    minimum: 50
+
   pse-pis:
     type: object
     description:
-- 
2.43.0

