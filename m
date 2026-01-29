Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF1637FF7F
	for <linux-leds@vger.kernel.org>; Thu, 29 Jan 2026 09:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769679991; cv=none; b=ErKgkdo1Qb8sZWk4pSJ8i1HghHlgEWJHkc6+yCs5s/yT/s5AVYoXvrs7DsPpLK03yKWBiqk4UTbh4Ez4xSywXCaZp5eKmS7y8UgQwpjDlu0f2aCOOHc5k73WrNmYrwUUPy0ZljaRTBQdNsxhOS77cMtpdtdlpG/3Yu1vMxY9q6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769679991; c=relaxed/simple;
	bh=wy3aNi/TX/XbnJPo6AxbyvKB5q6BiMPQ96mPvMg9sMs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iwH+iqtuzCmeyd/Y4SumgmmnfDjhrMSrOpIeAMbmZsFvz0fjUIKox8WEiU8oMWmVwzjpK0qZi6x5askcHEZ/C4IB8K5RGx4dBWYjqU6Nc/XATTcadIs3GZXKHNCpL701Za1JumOEQNzG9Wj0pNaucPoTUGclxIJFeVnb/UsSRc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1vlObY-0000zg-Af; Thu, 29 Jan 2026 10:46:24 +0100
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Thu, 29 Jan 2026 10:45:56 +0100
Subject: [PATCH 2/2] leds: lp5860: Remove useless select
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-v6-19-topic-ti-lp5860-fixes-v1-2-635ab524ebbd@pengutronix.de>
References: <20260129-v6-19-topic-ti-lp5860-fixes-v1-0-635ab524ebbd@pengutronix.de>
In-Reply-To: <20260129-v6-19-topic-ti-lp5860-fixes-v1-0-635ab524ebbd@pengutronix.de>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
X-Mailer: b4 0.14.3
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org

The lp5860-core driver selects FW_LOADER and _USER_HELPER.
These are not needed, remove them.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
 drivers/leds/rgb/Kconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/leds/rgb/Kconfig b/drivers/leds/rgb/Kconfig
index d362d15320969..e83f62038be4a 100644
--- a/drivers/leds/rgb/Kconfig
+++ b/drivers/leds/rgb/Kconfig
@@ -30,8 +30,6 @@ config LEDS_LP5860_CORE
 	tristate "Core Driver for TI LP5860"
 	depends on LEDS_CLASS
 	depends on OF
-	select FW_LOADER
-	select FW_LOADER_USER_HELPER
 	select REGMAP
 	help
 	  This option supports common operations for LP5860 devices.

-- 
2.51.0

