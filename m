Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B8F3DD841;
	Tue, 26 May 2026 10:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779791863; cv=none; b=glh1/qugOPR880AGwikCbdwXkB5u8L087DU2htWg5afW85xW7Q25X5xI2THV0G/MJ3kmV38sHKcRjI8Kvi14x042nLpVW9y6aVbGctri3TZVcGnEzYjEdM8OCSTDOloijSlOsBVdkpRTX7PJz3gh4DEJPGZ8FGQuuIZOfokW+SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779791863; c=relaxed/simple;
	bh=v4pvRoYCI75P667SeKo7lorr8ISiFm1RRvqQUwrLLMk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Q7wdDwEYKyQWLVvfoMbDfxYG6jNwNJ/SAEkyF+U1w1iC8gub0mVxqQRwYXlL+F1DSL2lTVALk9s1hFhRdKA+hSnCgOiW91idXA3/LlDtMbniiLFJ2TcnqYKsm+mT4bGCXL9FmuWrPBEtCQwFl/gg7cex1PXoZ+x7hveMgpDi7QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZQY8KiSV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZQY8KiSV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94C4D1F000E9;
	Tue, 26 May 2026 10:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779791862;
	bh=1mRLfGcgHKv1RhHKkzM8+dn6ccdwSOeS9nxdaHdRUHg=;
	h=From:To:Cc:Subject:Date;
	b=ZQY8KiSVZl6Z/c3S1DglWqhPnzsDDKNi+bg/M4HpZ2/TOwgEZRTjOTSSSe+g1LTZ/
	 EwW0/GVxo7MG84VeLNgxPipLEXRMwx9aNt0nuecikF3G375MAL3wegZAbVz6LG3ALw
	 nAmzqIEDQIQrqOMUPhUyq+d+EcT0BLnIqFfH91Ugivpyvdqoy8auj21dNwFu+/Md1g
	 iCeZV+4lXKpHDZ1LvLtVOu2hoiDL8J/JikUFU3Ugmi0VB0ZiUtx7+gwiX2M74e0So3
	 DfotW0uLYtRwXVJr9BS14wEoyoCCPD7OV4qExx9A4DaLa+Wkewtj8b+tVBNeZMLStl
	 KRpP4cR40gYLA==
From: Arnd Bergmann <arnd@kernel.org>
To: Nam Tran <trannamatk@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] leds: fix CONFIG_OF dependency for LEDS_LP5860_CORE
Date: Tue, 26 May 2026 12:37:32 +0200
Message-Id: <20260526103738.3389272-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Building LEDS_LP5860_SPI wihtout CONFIG_OF leads to a build time warning:

WARNING: unmet direct dependencies detected for LEDS_LP5860_CORE
  Depends on [n]: NEW_LEDS [=y] && LEDS_CLASS_MULTICOLOR [=y] && LEDS_CLASS [=y] && OF [=n]
  Selected by [y]:
  - LEDS_LP5860_SPI [=y] && NEW_LEDS [=y] && LEDS_CLASS_MULTICOLOR [=y] && SPI [=y]

Address this by adding the same dependency here as well.

Fixes: 3daf2c4ef82b ("leds: Add support for TI LP5860 LED driver chip")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
Another option would be to change the 'select LEDS_LP5860_CORE' to
a 'depends on'.
---
 drivers/leds/rgb/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/rgb/Kconfig b/drivers/leds/rgb/Kconfig
index 9a4ba6531cf8..b582ba2363af 100644
--- a/drivers/leds/rgb/Kconfig
+++ b/drivers/leds/rgb/Kconfig
@@ -56,6 +56,7 @@ config LEDS_LP5860_CORE
 config LEDS_LP5860_SPI
 	tristate "LED Support for TI LP5860 SPI LED driver chip"
 	depends on SPI
+	depends on OF
 	select LEDS_LP5860_CORE
 	help
 	  If you say yes here you get support for the Texas Instruments
-- 
2.39.5

