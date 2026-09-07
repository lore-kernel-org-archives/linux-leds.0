Received: from mta0.migadu.com (out-131.mta0.migadu.com [91.218.175.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2A336EAB0
	for <linux-leds@vger.kernel.org>; Mon,  7 Sep 2026 23:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788824911; cv=none; b=kUAKCiKmMuTM6ygN2eAt1bon4YZkjeR/NTmhqQSaluBF/dhAx0gsEXPRA14lKDTmxV6e7TpJnqEL8FNiOpfDv+qxjCW9wfsTAIEsaAza2+ByUg3GjJL5itqfiTHJO7vrEjhQhQfJ2UVvCGmQgQA4atmmHCogMNOF6bsGoj0VTdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788824911; c=relaxed/simple;
	bh=BZR7Oz9W1eIfU2eZigdvpJy6tDjWelmGhahhWjGhe8w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FghqkLtMU2uMV4XqG8qUGvRfngccFyAsdSNb8L4ER2wPIt4ru5fLZ2NsyWY/XFvf8E4f+J3LE14VWxjbl9yYhHLfPkBl7waM7eoqz1tQyy/A86OdmcWcU0O5Y80Rae9Uc2mE8nkGOVAGsRAW4+NAbfzkHCC700FGTZtzuVR352U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=i7V0RKvg; arc=none smtp.client-ip=91.218.175.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="i7V0RKvg"
X-Envelope-To: linux-leds@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=BZR7Oz9W1eIfU2eZigdvpJy6tDjWelmGhahhWjGhe8w=;
 c=simple/simple; d=postmarketos.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788824907; v=1; x=1789429707;
 b=i7V0RKvgr++NrtX2KKyTTvWLSQNmpCYBal/je/RNh50DIA+tQHDn2NDTOI0GWxgz5V6Xl7Ev
 turXgneO8pPL5iMCACG52V6XXELT5Cm9buLnwWbYaBkzIpp6TuzL6uSSzNCwyr0nd46L+C1EkNB
 ZYcL8CvgK4Tdl4VA5F9v8DdaKWQRezjrgdCoOVeQ7fQhzrF5U4FJWZ2L56BsNovNQfV4TSNFlzO
 Wc0H+BBTMjq+d/bHpJKtPGZDEHMs7GrpiV7XgW7UUtjvi56GU7uvUL/61+K5NNJWniuB7i7mIRH
 WbsjDuJ64AdbP40VJBFwXpoBja9Yy7CCD50T4VIZanmgg==
X-Envelope-To: linux-leds@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 59d2ceb2228182b3;
	Mon, 07 Sep 2026 23:48:27 +0000
X-Mizu-Trace-ID: 59d2ceb2228182b3
X-Migadu-Flow: FLOW_OUT
From: Paul Sajna <sajattack@postmarketos.org>
Date: Mon, 07 Sep 2026 16:47:52 -0700
Subject: [PATCH RFC 2/3] leds: aw2013: Rename to aw20xx
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-aw2013-aw20xx-rename-v1-2-c9a7df12a701@postmarketos.org>
References: <20260907-aw2013-aw20xx-rename-v1-0-c9a7df12a701@postmarketos.org>
In-Reply-To: <20260907-aw2013-aw20xx-rename-v1-0-c9a7df12a701@postmarketos.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nikita Travkin <nikitos.tr@gmail.com>, 
 Alexey Min <alexeymin@minlexx.ru>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Paul Sajna <sajattack@postmarketos.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788824891; l=2400;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=BZR7Oz9W1eIfU2eZigdvpJy6tDjWelmGhahhWjGhe8w=;
 b=YCn/b1PL/SM7Hvf05urDQSAE+bLtriO/3OJXSBt2mRMkD63q2PAs+TGM+oZVZ9h712j7mqibM
 09dBbgMEIB9DqAPDCu7rm7wwPlpBKan+mqUDVvmgHYqYCZEpY1FR5wf
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=

I had to split this into a separate commit for git to properly detect
this as a rename rather than remove/add. Next commit will add another
chip to justify the rename.

Includes update of Makefile, Kconfig, Kconfig help, and raw leds-aw2013.c
rename.

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 drivers/leds/Kconfig                          | 14 +++++++++-----
 drivers/leds/Makefile                         |  2 +-
 drivers/leds/{leds-aw2013.c => leds-aw20xx.c} |  0
 3 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index d0d3182236be..7548c320e55c 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -137,16 +137,20 @@ config LEDS_AW200XX
 	  To compile this driver as a module, choose M here: the module
 	  will be called leds-aw200xx.
 
-config LEDS_AW2013
-	tristate "LED support for Awinic AW2013"
+config LEDS_AW20XX
+	tristate "LED support for Awinic AW2013/AW2027"
 	depends on LEDS_CLASS && I2C && OF
 	select REGMAP_I2C
 	help
-	  This option enables support for the AW2013 3-channel
-	  LED driver.
+	  This option enables support for the Awinic AW20XX 3-channel
+	  LED controllers. Devices have a set of individually controlled
+	  LEDs and support individual dimming and blinking patterns via
+	  an I2C interface. Supported devices:
+	  - AW2013
+	  - AW2027
 
 	  To compile this driver as a module, choose M here: the module
-	  will be called leds-aw2013.
+	  will be called leds-aw20xx.
 
 config LEDS_BCM6328
 	tristate "LED Support for Broadcom BCM6328"
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index a68244bd50fb..b20a744065a5 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -17,7 +17,7 @@ obj-$(CONFIG_LEDS_APU)			+= leds-apu.o
 obj-$(CONFIG_LEDS_ARIEL)		+= leds-ariel.o
 obj-$(CONFIG_LEDS_OSRAM_AMS_AS3668)	+= leds-as3668.o
 obj-$(CONFIG_LEDS_AW200XX)		+= leds-aw200xx.o
-obj-$(CONFIG_LEDS_AW2013)		+= leds-aw2013.o
+obj-$(CONFIG_LEDS_AW20XX)		+= leds-aw20xx.o
 obj-$(CONFIG_LEDS_BCM6328)		+= leds-bcm6328.o
 obj-$(CONFIG_LEDS_BCM6358)		+= leds-bcm6358.o
 obj-$(CONFIG_LEDS_BD2606MVV)		+= leds-bd2606mvv.o
diff --git a/drivers/leds/leds-aw2013.c b/drivers/leds/leds-aw20xx.c
similarity index 100%
rename from drivers/leds/leds-aw2013.c
rename to drivers/leds/leds-aw20xx.c

-- 
2.55.0

