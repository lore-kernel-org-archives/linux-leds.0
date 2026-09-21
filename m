Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD7F48F008
	for <linux-leds@vger.kernel.org>; Mon, 21 Sep 2026 09:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.65.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789983194; cv=none; b=tmJUTJkQ5mx+2LC3zMvIWaiEq5OFwOfxz8M3JVmKF0HCa3aOML/Cf8Y5/DiocgThVHRRvO2+lCQ+4utP5ahDyeCUd0AcVozN/ubVoF9+khim4cQg24BiGNXKREJmg5Nv17ffGC2caGs/2ckt2M+Nk+dbi23Eaof9uZubo5djNO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789983194; c=relaxed/simple;
	bh=gMf0QnEAvG317ZeS8cIWL36N+Amo54q81cABkOl+g+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cy8k011wc5/7QedDaTN2/ea2qLdeG3oa0VjsHN7ReuKkVslui0RRYeV8SZofRcLfqo37YCjNlTY6fNhJ8+TM6a3vQbRGaXx0A4TMoA8qIga36sAX6zsuM4HC9cRoswOGgBJfxBxbyPAY4YDi09Hq+JLpwNyD2d9ELFXppQVE0YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b=NLhWIuJN; arc=none smtp.client-ip=185.136.65.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b="NLhWIuJN"
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2026092109330077cc51e26000020708
        for <linux-leds@vger.kernel.org>;
        Mon, 21 Sep 2026 11:33:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=LFOdAIVED2gslTxZEL+Hdn0nPZWraS5nMXKYCet66bo=;
 b=NLhWIuJNE6DqWJtU08UoNQzaOHBiCdAKM4V7362lw55aYjDNbd1kiYubRgRaIxCdgdiZ5j
 oTwtuqC/bV3vBgSXBLY5tjsNNFhIxvPtg8vHaEwbr7eJALlddfg/Hyog9KwdN/fJQ25wb/Xl
 tqb4Szg8L/Z5GB+4LjJ2LvB6NjY1vWeeh82dwaZyjV1Hpe2B9LWWFLrL2P3ihSmD0m2N0aRb
 HQOafLd+U4tgZTAZ1O4WRTWaEwfMWKH5o7CG66q6dQQeOQLdAKDiUiW5OlTIRmi5dp7/9eNc
 v8li9MTomWJYfQm5InnnijLnL2VUDZYVI0MCN/vve2FQtvchteBSYq0A==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: linux-leds@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	"Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Kees Cook <kees@kernel.org>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 2/4] leds: trigger: netdev: Access net_dev under trigger_data->lock in the worker
Date: Mon, 21 Sep 2026 11:32:44 +0200
Message-ID: <20260921093249.3481413-3-alexander.sverdlin@siemens.com>
In-Reply-To: <20260921093249.3481413-1-alexander.sverdlin@siemens.com>
References: <20260921093249.3481413-1-alexander.sverdlin@siemens.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

netdev_trig_work() dereferences trigger_data->net_dev without the lock,
while set_device_name() and netdev_trig_notify() dev_put() and replace it
under trigger_data->lock.  On NETDEV_UNREGISTER the worker can run
dev_get_stats() on a netdev being freed (UAF).

Take trigger_data->lock in the worker.  cancel_delayed_work_sync() must
then never run under that lock.

Cc: stable@vger.kernel.org
Closes: https://lore.kernel.org/all/20260914142116.6DAC51F000FF@smtp.kernel.org/
Fixes: 06f502f57d0d ("leds: trigger: Introduce a NETDEV trigger")
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
Changelog:
v2:
- new patch

 drivers/leds/trigger/ledtrig-netdev.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
index c65df91c4f6dc..8b807451b642d 100644
--- a/drivers/leds/trigger/ledtrig-netdev.c
+++ b/drivers/leds/trigger/ledtrig-netdev.c
@@ -679,6 +679,8 @@ static void netdev_trig_work(struct work_struct *work)
 	unsigned long interval;
 	int invert;
 
+	guard(mutex)(&trigger_data->lock);
+
 	/* If we dont have a device, insure we are off */
 	if (!trigger_data->net_dev) {
 		led_set_brightness(trigger_data->led_cdev, LED_OFF);
-- 
2.55.0

