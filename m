Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B945187F7;
	Mon, 21 Sep 2026 23:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790033250; cv=none; b=je06hffngQLFa8fMDH3oOjBzzeNjFyOTS7oIj71qh9l/u84MsQn03U8570FQq2kDhMIdkVdUCMiT4fPi3zMEuOxlzhOzyqYHNM8iXQZZfjwjb0gtYlIjCCAATPSZakdRu+cT2JAiH6tclqS0586kpNb/umtLEf5LK55vU+Z0C54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790033250; c=relaxed/simple;
	bh=bQOedCxJb/XNc9Mz0htXekbe+PaR7qwlI4PxMY3+23Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MYb0/0S3s9V9t4VU0+c8dqR2V64eh6vHdaAjGgAexgomKJIIKpxximlQT0tGQKxnG6yJTTGgSderEddg1xBcsgT/IYwWbaTA63iaAnDtOtn353M23OCeaT5Rz3hdebfpCyx+r5lYHLTBjldTXhRe1APW3irOiuPU2H8yWXUtxQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ij42+aZ7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ij42+aZ7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43C9D1F00899;
	Mon, 21 Sep 2026 23:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790033233;
	bh=uxXal4BuxZjsR7ORVLalPyz6SAW1u6gLZgcBu9mnplU=;
	h=From:To:Cc:Subject:Date;
	b=Ij42+aZ7SEHNoxFDGCFF8X+rLwkm5cR9wX+ZKmXTSp7ptnQGSJeA8X8CVXSE+gPl7
	 p1WN8LzXCQDu7GrXkxtP7p3PPIeEW14xhnI5gh7d+G0sTTmsKJeTR4b9hxJGEXEGnF
	 R8sJZDOGD7V5LRGcP5vQo5mVdaH0YR7N9q1dzrtZPbybYc0y/iqyyq0sK2rs2qX4FP
	 uyYjc9kz8e2nQad3JwooHuIbu1A0qLiMwDuDZNTGNA0DKoBAmC06hnkJFaIIpue0rZ
	 S8quBlXN5bmo3E//kJQeuIRlZm9lO88jiS3bd1pIPRFwjB58Uh5oJ9RcsM03J7dWQC
	 ZjaBMiyl8wbDw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: leds: Allow PHY RX triggers
Date: Mon, 21 Sep 2026 18:27:08 -0500
Message-ID: <20260921232709.3133716-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ZynqMP ZCU100 revC DTS uses separate phy0tx and phy0rx triggers for
its WLAN activity LEDs. Allow the RX form alongside the existing TX
form.

Assisted-by: LLM
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/leds/common.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
index a0ef2f2f0724..2502e6f221f8 100644
--- a/Documentation/devicetree/bindings/leds/common.yaml
+++ b/Documentation/devicetree/bindings/leds/common.yaml
@@ -147,7 +147,7 @@ properties:
         # LED is triggered by SD/MMC activity
       - pattern: "^mmc[0-9]+$"
         # LED is triggered by WLAN activity
-      - pattern: "^phy[0-9]+tx$"
+      - pattern: "^phy[0-9]+(rx|tx)$"
 
   led-pattern:
     description: |
-- 
2.53.0

