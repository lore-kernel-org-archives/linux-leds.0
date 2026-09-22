Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB38377A8C;
	Tue, 22 Sep 2026 14:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790088516; cv=none; b=IygMJCM/voxayRJX2hBtQsKFLdJYQ7ndENHlYGVtHNVZ80ss+NPQoW40mPV5Mst7hr5MAqAB1CFkFvQl7TcNgap4Zpe9HR4iBPAPr2v9MUXFR5TsmYWribDEIdiB1vCarlEIe0H1T6PCMXs/8As/IgZCYUEr5+gPYJnIQgvvIsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790088516; c=relaxed/simple;
	bh=dJQ/OjPO0d9VUJKeS9tCzL5uaO+w57R42kmzt6s02us=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VzP0f8IykBdt5oNiOfmVBJ8DZ6bs5M82+C7W5y3pr187+UIbEaeg9UGyUNkVmnkmPzaNR45kXEEXT84AGrABSPmiFqIbdTRx02GgAARz58f6htCZfTsv/nKnx2tyiOxv6ZHYNt9su4VjRHeOQHpWjR1qQ3YF4muA+R2VB5tvIWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=F5qaDQ4b; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="F5qaDQ4b"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=i7k5IvRMGds1MAPqGTDkTv6/b7coFgJ33EfhbQAkbc4=; b=F5qaDQ4b59mWLaE2LHg4Oi5Rxc
	Xvgm/2qQnf8ElUH0qLM3g2xOnoPsJB7/3+yVpVJ093TNMfHy3xGCfU+4d7oxEV9iI7Ty8DPJPWWnk
	64Hd3xVR4r5A8genID4Kpj0914fBDisdTPNjw2KvkbuGa1gqPm5rtzNzwBio3T1QAUpK9kIsU+Goe
	U0UVTTrKJJJxyPdybvPEh31i85N/3uvZiWV/Is11O1RApmGN4MWim4quIm+o9WKLokI3n+YLlJbKU
	bpAvQl2rFj9vuFAHhheJtVu3SxJjkhBESD/UK3kH9J3xBtro1l2QNtBzTesQu9Lmdxby4C8YE70Ds
	TzmrFXOQ==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1x91nF-000MgZ-3B;
	Tue, 22 Sep 2026 16:48:26 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1x91nF-000PP0-0w;
	Tue, 22 Sep 2026 16:48:25 +0200
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
Subject: [PATCH v3 02/10] dt-bindings: leds: pca995x: Describe nxp,output-gain property
Date: Tue, 22 Sep 2026 16:47:49 +0200
Message-ID: <86db544bcf3413474bc3fac73e94bdc09af03867.1790087890.git.nora.schiffer@ew.tq-group.com>
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
