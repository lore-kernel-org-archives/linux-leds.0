Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB351FAC2C
	for <linux-leds@vger.kernel.org>; Thu, 14 Nov 2024 12:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731588284; cv=none; b=EnRyv4d6Cgv7N3OT6RsTte7/P0W0TZNlIm14hCFf4YhmQQK4N4EtYhw9dkXOWPUrl3OnL3+mAJws1k5YZVGm5qocgwC/6njPwoxzAyROclEtjiVk/LeAx/gfA0JgLHF932M16qR43hbHt/zRndrQttY3yBfspdG9WPqd1bGexeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731588284; c=relaxed/simple;
	bh=s/PM/VQ9hwh6iiReNHCWYFkLslOMojWhBx/aZXlmtaA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PZPcUdkXGYNjDyocrDrN5CO6X6Q5+f6Bu0WoYArxGbtE9xdqg+4eteGgUYcjY64QxANqUaXd43LGdP/yBSfl1VCtIO5+p1Imfq7VmACgZW4hWAWBCFRERaE1qdI+gffrGslHnRtmRzTgczRP+xav8FumleSkPICG8QLunXgooPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:ab77:b6e5:88e8:df20])
	by laurent.telenet-ops.be with cmsmtp
	id cckW2D00C0Ss59E01ckWid; Thu, 14 Nov 2024 13:44:33 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tBZCi-0070f8-0n;
	Thu, 14 Nov 2024 13:44:30 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tBZD4-004LPc-6M;
	Thu, 14 Nov 2024 13:44:30 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Davis <afd@ti.com>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Dan Murphy <dmurphy@ti.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: leds: class-multicolor: Fix path to color definitions
Date: Thu, 14 Nov 2024 13:44:29 +0100
Message-Id: <a3c7ea92e90b77032f2e480d46418b087709286d.1731588129.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The LED color definitions have always been in
include/dt-bindings/leds/common.h in upstream.

Fixes: 5c7f8ffe741daae7 ("dt: bindings: Add multicolor class dt bindings documention")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../devicetree/bindings/leds/leds-class-multicolor.yaml         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml b/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
index e850a8894758df1b..bb40bb9e036ee00e 100644
--- a/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
@@ -27,7 +27,7 @@ properties:
     description: |
       For multicolor LED support this property should be defined as either
       LED_COLOR_ID_RGB or LED_COLOR_ID_MULTI which can be found in
-      include/linux/leds/common.h.
+      include/dt-bindings/leds/common.h.
     enum: [ 8, 9 ]
 
 required:
-- 
2.34.1

