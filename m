Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC85D3B52E7
	for <linux-leds@vger.kernel.org>; Mon,  6 Jul 2026 07:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783323227; cv=none; b=Dihz0GEB65tPKAZIbRWdHeV6fYAhdYp8716MyT8+NDm0Wnol8UE3KDq1oG4SqWwtxmLRw9ytheoA5G5Ld2yaoG9xAWmAQ0sr7kqnY4j/5bCwp3QWQO/ijJZMNW9tG6U3AkqLgfokAhl3F+tmvqkaG4HLgAxsJPMbc6PT9LHFqPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783323227; c=relaxed/simple;
	bh=IXOdl84cTugwPj55zjdyTLLGe46XdXULoxKrjlpPzPI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ed5Swmirr/ReyzxnP+XXxcE72Zs+9OkVK7wbdcVCI5HuoNdQhtP8TtFgRvuVTuHYN83mQJiHA6PZM0my+MDYembC23Hl7ASSD7wdV0VkxCrlXuo/QzTnm25H+68X8IZ7v8dtKcxL3HVZBtZdTc3WP4Zs6JcYBcsCi0XA8t6Pveg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qedg4/Yn; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qedg4/Yn"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783323203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gB6sYSLbvHVUh7F5r4zsG9au/6lTVdK57G8fJgTB8VE=;
	b=qedg4/YnW//2bnk6PtAIsEFlNcA0wmSYaahp8ZsYWmAc3dJpdPKRMmIjKvC7orEbsHKf3+
	oVBHhVU5c7u03tgt82KbzN1QrtGVzIi4MIpCu3Wvs9bNfaZjezWB65Kr/Z+fPwnHeBEXuO
	kCt1PsQXejU/AnuxxFlxRu8Gi5SfOfI=
From: Junjie Cao <junjie.cao@linux.dev>
To: lee@kernel.org,
	danielt@kernel.org,
	jingoohan1@gmail.com,
	pavel@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	krzysztof.kozlowski@oss.qualcomm.com,
	junjie.cao@linux.dev
Subject: [PATCH v2] MAINTAINERS: update my email address for the AW99706 backlight driver
Date: Mon,  6 Jul 2026 15:33:07 +0800
Message-ID: <20260706073307.1038430-1-junjie.cao@linux.dev>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Switch my maintainer entry for the Awinic AW99706 WLED backlight
driver from my personal Gmail address to junjie.cao@linux.dev.

Update both MAINTAINERS and the device-tree binding maintainers field.

Signed-off-by: Junjie Cao <junjie.cao@linux.dev>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
v2:
 - Rebase onto the current for-leds-next / linux-next (Lee Jones).
 - Pick up Krzysztof's Ack.

v1: https://lore.kernel.org/all/20260701133533.32585-1-junjie.cao@linux.dev/

 .../devicetree/bindings/leds/backlight/awinic,aw99706.yaml      | 2 +-
 MAINTAINERS                                                     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/backlight/awinic,aw99706.yaml b/Documentation/devicetree/bindings/leds/backlight/awinic,aw99706.yaml
index f48ce7a3434d..60eae50ff742 100644
--- a/Documentation/devicetree/bindings/leds/backlight/awinic,aw99706.yaml
+++ b/Documentation/devicetree/bindings/leds/backlight/awinic,aw99706.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Awinic AW99706 6-channel WLED Backlight Driver
 
 maintainers:
-  - Junjie Cao <caojunjie650@gmail.com>
+  - Junjie Cao <junjie.cao@linux.dev>
 
 allOf:
   - $ref: common.yaml#
diff --git a/MAINTAINERS b/MAINTAINERS
index 15011f5752a9..780f80766780 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4388,7 +4388,7 @@ S:	Maintained
 F:	drivers/media/pci/hws/
 
 AWINIC AW99706 WLED BACKLIGHT DRIVER
-M:	Junjie Cao <caojunjie650@gmail.com>
+M:	Junjie Cao <junjie.cao@linux.dev>
 S:	Maintained
 F:	Documentation/devicetree/bindings/leds/backlight/awinic,aw99706.yaml
 F:	drivers/video/backlight/aw99706.c

base-commit: 7ddc04d1bd08f80ffc1e2fb97f3fc6cacab0ffc0
-- 
2.43.0

