Received: from sender5-op-o12.zoho.com (sender5-op-o12.zoho.com [165.173.182.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F6036729C;
	Tue,  1 Sep 2026 18:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788286391; cv=pass; b=tisLq/ceV+YvOGBZb6/YUA/D6/TJcrPB9GByRYfv2Bzk406jKbAelx6HlmccrnBNOmZxMndzSa7lr3xNeV6bxzo7AMxKfpLnX8lJTcRHKUpkcEGPXAvizJZ7xIJcZD8PKV3Z0l3JZ18ukCdItvPpX4e1pYLqHLGXhaC+iEDmd4k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788286391; c=relaxed/simple;
	bh=akD2/+LKKQMVagYGejYsZ7sZ39xXmqgdGhdcQCZIxR0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a1oOKGFQ7sxtZPm4lrNQpoVcvididuJhzJSl1FXre5w99HIsTrDxx1i+I7dmYZYUTPuzKXSVplpO+G/eXD18BJ3cbHzsg5QmuBbHTIp80WXZeVgK9p42nl7xbAY169lFHA0Lpa5h9RMyHWBTOysiRiZeCj83+C3uB/vvbMYb0B4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=ID1Jyz6A; arc=pass smtp.client-ip=165.173.182.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="ID1Jyz6A"
ARC-Seal: i=1; a=rsa-sha256; t=1788286277; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=c0n18rirckW4JvY7WJIYnJn6P3HDpeUP9uLniJZhXE+X/UWewekpnYMyGDPXfIMD3NDEDPovuPbvSRSTeCROS8Lq5oq/LuICyiATFDEDOLuovMLScf+ZOHU489bMTRGNhBtQ35uqCFfG0/H6Ko1pMQn4BaAwBnuCKUj279YYQn8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788286277; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=xwd/UBinkWgkOmV0UP/p5sYAbRYiCZgmzMgXpY3kiyA=; 
	b=IFPgTJr47RdR1+BB83m+aJ1MN6EC/HRKqftgHKgKcMZumsuIS2g/FcTqR1gFrC3EZcuEBZtrK727bwuO8vh5lgPPd9wii4Av02ac8t4TaZfpv6pfSgxb9t5tx9s2a0Er1xd007LLsyFUfPX/VcrLOBvtiKHwFxJWe4u8Y3ytanA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788286277;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=xwd/UBinkWgkOmV0UP/p5sYAbRYiCZgmzMgXpY3kiyA=;
	b=ID1Jyz6APJtt66N3CV5axZwe1x3yz/5Dem0BhLOI5Ny0PxS/fEJZZLyVUZXR0Ip8
	p85As917veym+45qpKfUgmwlRwt2H/d9T/E39Zyv8ZObNg67IkpyV6DgKPeM8JJBKUF
	LuAOywiEJTnbf6t/0EnI14C83Nwh9Q77uyQOu+47ud7TeUh8AyrjXYSrgUjbl+GbzVD
	LoPCZMsV2GO1sjLmojpTF8ckin9RBjZRMmUtKcGSh+XEF5eQikcMzGC7yz0vvnemwnr
	OsxZRFPWctehof4FkZMaeOHxWwepAXnImPb0Q50sn57qivCsYDvYIvmDAfW6MvkNP3A
	RVSFDHdNTg==
Received: by mx.zohomail.com with SMTPS id 1788286276014556.0662390402474;
	Tue, 1 Sep 2026 11:11:16 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Wed, 02 Sep 2026 02:09:24 +0800
Subject: [PATCH v6 05/12] leds: cros_ec: Implement offloaded() trigger
 callback
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260902-leds-trigger-hw-changed-v6-5-55693cd78877@rong.moe>
References: <20260902-leds-trigger-hw-changed-v6-0-55693cd78877@rong.moe>
In-Reply-To: <20260902-leds-trigger-hw-changed-v6-0-55693cd78877@rong.moe>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Ike Panhc <ikepanhc@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>, 
 Vishnu Sankar <vishnuocv@gmail.com>, Vishnu Sankar <vsankar@lenovo.com>, 
 linux-leds@vger.kernel.org, netdev@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 chrome-platform@lists.linux.dev, platform-driver-x86@vger.kernel.org, 
 Rong Zhang <i@rong.moe>
X-Mailer: b4 0.17-dev-1f2f7
X-ZohoMailClient: External

"chromeos-auto" is a private hardware control trigger which always stays
in hardware control. Implement offloaded() callback with its return
value to be always true to reflect this.

Reviewed-by: Thomas Weißschuh <linux@weissschuh.net>
Acked-by: Ike Panhc <ikepanhc@gmail.com>
Signed-off-by: Rong Zhang <i@rong.moe>
---
Sashiko has reported this pre-existing issue in previous revisions:

- [High] Registering a global static `led_trigger` structure in a
  driver's probe function causes list corruption and lock re-
  initialization if the driver is probed multiple times.

The author is aware of it. Since the driver is very platform-specific
and the relevant platforms never have more than one such device, the bug
is never triggered on real devices. If a user manually binds the driver
to other devices, it's their fault. Therefore, fixing it is far beyond
the scope of the series.
---
 drivers/leds/leds-cros_ec.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/leds/leds-cros_ec.c b/drivers/leds/leds-cros_ec.c
index 1844d0cd5f52..6db83d015277 100644
--- a/drivers/leds/leds-cros_ec.c
+++ b/drivers/leds/leds-cros_ec.c
@@ -85,12 +85,18 @@ static int cros_ec_led_trigger_activate(struct led_classdev *led_cdev)
 	return cros_ec_led_send_cmd(priv->cros_ec, &arg);
 }
 
+static bool cros_ec_led_trigger_offloaded(struct led_classdev *led_cdev)
+{
+	return true;
+}
+
 static struct led_hw_trigger_type cros_ec_led_trigger_type;
 
 static struct led_trigger cros_ec_led_trigger = {
 	.name = "chromeos-auto",
 	.trigger_type = &cros_ec_led_trigger_type,
 	.activate = cros_ec_led_trigger_activate,
+	.offloaded = cros_ec_led_trigger_offloaded,
 };
 
 static int cros_ec_led_brightness_set_blocking(struct led_classdev *led_cdev,

-- 
2.55.0

