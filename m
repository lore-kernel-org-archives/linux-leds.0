Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA2E47F2FF;
	Thu, 20 Aug 2026 17:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787246735; cv=pass; b=SpNpE/W1EOwz/IL6foFwT4h8zs39R69X8/wxTKrqdd7zmEvElr3x4xslI8PdAhP6Eo5eE/TNolCVDceW9vamK0iyEimicWnAg/XMVtzojzuCyUEQ8zSCsP9hTANbW+KPq+Bef6gvZrKyYX/ZLKAE26RXqW0xT6SfS+oeSnUsyoQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787246735; c=relaxed/simple;
	bh=rP1FJCLNCgQ4/odsC5rOyOEqiN+aO/Z0ZBAZXBsiOTg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mIN1B1dlTAOnlry0aDhdye7e+y9vxHbmOk7m16VYHVSokk3thTQ15fsQ7c95fVC00GHM55Dn/TZkn89AtYRp/C6/A57h1A1AYw4y1Z9xWqChUBxfCxdCoHMmG5VZh8KppjmT+X9y7QvWQZgCnWJTVAPJx6rCXLA5/Br4u5Rv1Gg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=Ap4uB9lu; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="Ap4uB9lu"
ARC-Seal: i=1; a=rsa-sha256; t=1787246639; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bJhRi/3h71IG734cbRiVqnIqyVsekWSdKURpF8UJKZxcDLZmcH9uCjJ6/YQRNgblk0pInz4VimNRm3KmHiT3qCla4uvJsfeqap3cZLgz8Lzl4p/GyU2TSfqxOZmv5t0RoftIzWw/moTkIIkG/UwU0uAGb+6T6MbMX2g9cnjleAs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787246639; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=2j5a5rGmXReIsQy66ZTp+dwI3KKvaZ3uYw/Bf/oap+A=; 
	b=Wh+czJLJIk+KolEsbnXNcDKLxMu5oJQmaEDDJJYjQvW7b/nkaIZqpeJOidTNe761NLDCLKvoGx89ZXdTbdDG0+BKZEuciDQYEEnlzYzakRdlG3LczXSilFUmNs1sT5GejfiSRoncDcV0LyF+aNMsmEaTGeeSq1Fhaj7DnSeBPow=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787246639;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=2j5a5rGmXReIsQy66ZTp+dwI3KKvaZ3uYw/Bf/oap+A=;
	b=Ap4uB9lu0K6HsoM9wmQwAVtzd8sc8lLP0v2+tMr+QVo71izYpPhpXNrE/8K4Vtmf
	U6N/g1LuI9YH7v1TVhqpkIbNZ2FNH+NdybDvOfUMhUciCc4MluFKHBhHJb2r+DhvxPH
	1z6n3lzwQ0a7XUj+C7qJeOhqJVdPPU0rkZlw/uwoAnf6MzSXyYATZrZ+1rbpVeAqCqr
	c7C6cQwHOFweCouLXU7sYJzy8BJq+qWpsNnLci6ogS9EhhXMaVDA6uVCM2yuWKHy1nC
	wA6gFM/rBB3+cVRJdbnvkpm3hvXGb2XNEI3vPJTfgw0bAqLHLPAc1XKchAllcYh/hmI
	LqK3rwE0+g==
Received: by mx.zohomail.com with SMTPS id 1787246638281331.2756470626407;
	Thu, 20 Aug 2026 10:23:58 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Fri, 21 Aug 2026 01:22:02 +0800
Subject: [PATCH v5 07/12] leds: trigger: Enforce strict checks in
 led_trigger_is_hw_controlled()
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260821-leds-trigger-hw-changed-v5-7-3e00d6c4a936@rong.moe>
References: <20260821-leds-trigger-hw-changed-v5-0-3e00d6c4a936@rong.moe>
In-Reply-To: <20260821-leds-trigger-hw-changed-v5-0-3e00d6c4a936@rong.moe>
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

With all existing triggers adopting the new interface, strict checks
could be enforced to make the semantics of hardware control triggers
clearer.

In detail, a hardware control trigger should:

- Implement offloaded() callback to indicate hardware control
- Associate with the LED classdev's hw_control_trigger string

Acked-by: Ike Panhc <ikepanhc@gmail.com>
Signed-off-by: Rong Zhang <i@rong.moe>
---
Changes in v3:
- New patch in the series, splitted from PATCH 3 (thanks Thomas
  Weißschuh)
---
 drivers/leds/led-triggers.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index de17a8bbb4d4..cb49a02a8b3c 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -42,9 +42,16 @@ static bool __led_trigger_is_hw_controlled(struct led_classdev *led_cdev)
 	if (!led_cdev->trigger)
 		return false;
 
+	if (!led_cdev->hw_control_trigger ||
+	    strcmp(led_cdev->hw_control_trigger, led_cdev->trigger->name))
+		return false;
+
 	if (led_cdev->trigger->offloaded)
 		return led_cdev->trigger->offloaded(led_cdev);
 
+	dev_warn_once(led_cdev->dev, "hw control trigger %s doesn't implement offloaded()\n",
+		      led_cdev->trigger->name);
+
 	/* Otherwise assume private triggers as always offloaded. */
 	return led_cdev->trigger->trigger_type;
 }

-- 
2.55.0

