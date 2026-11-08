Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.149
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794174583;
	b=eIY0ZfOxDKd6uF4/+F+qFkioKhJwy4xZso1syptpFpQJtRqvfcqhsS8ea5YnpglMsYg4
	 u6KMPBZgM+CoLd3TJ3QTa+1VhKXKzYct4lR7cfzWxrQwlynOOGhxYb6kvTf4KwEJU5aEg
	 nf1wZg8Nr8YqCg20igLrIlj8y+3TQJQA99arAtIm9DICg6+vYCrI/WAH6o6DHNvuku/+p
	 pnHb0NLuGaIYB88qTY2uJn1WNZ3wpxRzj9aeool+qqX5s7OU4PccS5npNTneMsEE+yNpC
	 Kz7O7D1WMmdFicScnwTYBYefD1yOPJqhGWGNZ9NNv76yi83GPRl75oTGAGmUQ7Ytk7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794174583;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=3gRAP1YxlQCWGPap37hqUthvPeiuImlF2tdnQbsDgtg=;
	b=Xs0ia2rpRJeNk7W9AHZHTDTrNRfuqaVtng+/G7Duo0Wj2AJznQpnTMtfiZQ44GPb8VC9
	 mH0p9TK23DdVisgriBIxIsDtc5D3+ENTihedcXhk/1NAi7IX9/Tjn2U7RxoBCyoa7c2gh
	 DntifIgjB3VgkJAeE4NF4zT1Yk+NLC33qVoPMyTyx6emvEuRi6YJed0JPD4vpK4K9CTNB
	 aFxKRfdPHVZrjKUviYqrE5zc9MKOmPNW7Unanf15N4+T2b/eibB7WNeWIsHeI0/Zpgdk2
	 SrFGZQkZ27BsTpcOcxkGCuctaWFNSW+0zCAt4JizcXQ0ZUCb8Zz94piwwSA5C0PG6kQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=postmarketos.org;
	spf=pass smtp.mailfrom=postmarketos.org;
	arc=none smtp.remote-ip=95.215.58.149
Received: from mta1.migadu.com (out-149.mta1.migadu.com [95.215.58.149])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D458606A332
	for <linux-leds@vger.kernel.org>; Sun,  8 Nov 2026 21:49:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D458606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Envelope-To: linux-leds@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=w/6qEc2cwOI6T/xUHNJh3OifoyGO3FRpW1FATx28UoM=;
 c=simple/simple; d=postmarketos.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794174577; v=1; x=1794779377;
 b=DPmEstMtjRJP75XGK0jU3H99b/kwySRpXknVFtHp0iwYU1/ABZ8uFcX514b/8cPt3sbvcmjr
 9KXWN7+ImblWVjXeAocUzJDgXApCjvsQVna4S3QT+VgyEk4J9pHMOeK4bBjEAmx5Xb4Sz25HWzu
 TszyeNrVFw2tf3w9MIgnpzaIK2y69AvywMhXQ1u04p1hZYfTxFrKywoehlggBMWLBR6llbwbyM2
 PuvSofRBvazxzZObKx1Eio1AH+kYw0tVt9grKv2Dma1FhYyIGE1OJujNOnGAVV7tRiTqGgmW9Xc
 okbkwOWz2YIIvwn76oNOB3inT2J+ZJiRMBh/CINjaOz3Q==
X-Envelope-To: linux-leds@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7783f211d67b9856;
	Sun, 08 Nov 2026 21:49:37 +0000
X-Mizu-Trace-ID: 7783f211d67b9856
X-Migadu-Flow: FLOW_OUT
From: Paul Sajna <sajattack@postmarketos.org>
Date: Sun, 08 Nov 2026 14:49:12 -0700
Subject: [PATCH v4 1/4] dt-bindings: leds: aw2013: Add awinic,aw2027
 compatible
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-aw2013-aw20xx-rename-v4-1-826529beeb52@postmarketos.org>
References: <20261108-aw2013-aw20xx-rename-v4-0-826529beeb52@postmarketos.org>
In-Reply-To: <20261108-aw2013-aw20xx-rename-v4-0-826529beeb52@postmarketos.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nikita Travkin <nikitos.tr@gmail.com>, 
 Alexey Min <alexeymin@minlexx.ru>, David Heidelberg <david@ixit.cz>, 
 Griffin Kroah-Hartman <griffin@kroah.com>
Cc: Nikita Travkin <nikita@trvn.ru>, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Paul Sajna <sajattack@postmarketos.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794174570; l=1313;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=w/6qEc2cwOI6T/xUHNJh3OifoyGO3FRpW1FATx28UoM=;
 b=vzfsl081FbFIiyzZnvCW2wCOy36hSI8+MO79cCOflVhL6CE5/pRgzXh4IO3i1Y+5/fQzRJZNi
 QJ7aOlLaHCJCDAcNdRM+kj/0an2Ikp5AFWwAbhSEQqb7PcSt/S+wyTS
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=

The aw2027 is largely the same as the aw2013, with the
exception of the way the max current is written to registers.
This exception makes it different enough to not work without
driver modifications, but similar enough to fall under the
umbrella of the same driver.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 Documentation/devicetree/bindings/leds/leds-aw2013.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-aw2013.yaml b/Documentation/devicetree/bindings/leds/leds-aw2013.yaml
index 26238446f2bd..1ad165cfe34a 100644
--- a/Documentation/devicetree/bindings/leds/leds-aw2013.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-aw2013.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/leds/leds-aw2013.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: AWINIC AW2013 3-channel LED Driver
+title: AWINIC AW2013/AW2027 3-channel LED Driver
 
 maintainers:
   - Nikita Travkin <nikitos.tr@gmail.com>
@@ -15,7 +15,9 @@ description: |
 
 properties:
   compatible:
-    const: awinic,aw2013
+    enum:
+      - awinic,aw2013
+      - awinic,aw2027
 
   reg:
     maxItems: 1

-- 
2.56.0

