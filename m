Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81D9293B75;
	Sat,  1 Aug 2026 17:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785605400; cv=pass; b=Ap+/vQOyr0ZIMGd2M2Ky/xO1e0YuddsRTqoPO3WaJESdC611ynfhs5XJJ3MpdEdk0u58PMKCk1Er4EcGgt5a0Gdi+EH855yRDLD6ycI4AyaMyLxBhHy8eBWVhMffYIr3Wph7kW1iiRY6UyO9IPQ9mXkwECd5FcxVudC+2BQXhgc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785605400; c=relaxed/simple;
	bh=4D+18ZROuGmeK14Tw4JlJFEkndEtz+19UrpXHpaF/R0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bkDZnZg7pU476uPfFmQjMI8pfExEIVhk3mbb5gGM/UMn4sswN/Ol9l/Q98cRp2aZ8AmSs5JYAx8CbcH6kFSm7G0DYbnyqrXTziXcDOZpTqbdut/St0rJGtD2trky4fsymcqDjOBotpIWuN0EjFcBKDcaOEEvSNTHwD3EU+lDb7M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=PSv/3Jyg; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="PSv/3Jyg"
ARC-Seal: i=1; a=rsa-sha256; t=1785605348; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hzxxrchAl/7E3B1oV9Yq79ZHM7xHc81XfzWkvKkAJFzpVX461i6cIPSflS8bqrgFG+pFFnckFSP1yibKqlLOE1izApwj9H9ft4fi3hysmyN/oDfz1JOX9uHMkjhQSuD3Mf2RNJzOXOtNZUQGRobUjjASidPzdploLk2CfPTvqjo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785605348; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Um/mh8KrpM5Yn3yxxdW3fUVG+u/Ifxf8OQJLklUQ794=; 
	b=AJ9r5JQ6G9UYR3Ji2w6FmDn6OEYxf2jUA9Aa2ptLrWe6hwU0sKBSqWkovykXUe6O2E0+7PUuzi+nfwxcvJAAR1AHkK9CMfwc+RjQHMXMvfoWjMGgWW+bFE9eGkcAA61tE+A6/LL8x2eexPn37KGQgn9D7XrOwGLmOxxONGdO7KM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785605348;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=Um/mh8KrpM5Yn3yxxdW3fUVG+u/Ifxf8OQJLklUQ794=;
	b=PSv/3JygS1b2FbIkCqDQPGPibxKEA70x1VwTY0Te19Q4jFS3KGehDHeWKi83QQcD
	ZH5MEckYigeFZAThbBZLuL+shKrPmCyw73Gifdi01/VL0P+ThsbK5sVxzr6FjtYCa74
	fO1z54lG4YMnjU0fnjRLdm01kg7D7LTFozM/LBaHNVopMLjnnzOpXnmbDgHOh5BW9Zm
	G4r5FBf+elWtiySUCwHfxdpxWoHC6pff7ll9HPQ8UxbG0PA+07ijwAvJU4x6KByCq1N
	gsiruRtQVbifVulew/00bHJ877yrApc/6gbWKViycIGgrP5g0qKHnSVy59R/iCjm4xN
	J6s83Y6ZkQ==
Received: by mx.zohomail.com with SMTPS id 1785605346267866.3435646254295;
	Sat, 1 Aug 2026 10:29:06 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Sun, 02 Aug 2026 01:26:51 +0800
Subject: [PATCH v4 07/12] leds: trigger: Enforce strict checks in
 led_trigger_is_hw_controlled()
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260802-leds-trigger-hw-changed-v4-7-f97e2ca976fe@rong.moe>
References: <20260802-leds-trigger-hw-changed-v4-0-f97e2ca976fe@rong.moe>
In-Reply-To: <20260802-leds-trigger-hw-changed-v4-0-f97e2ca976fe@rong.moe>
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
X-Mailer: b4 0.16-dev-2f6f2
X-ZohoMailClient: External

With all existing triggers adopting the new interface, strict checks
could be enforced to make the semantics of hardware control triggers
clearer.

In detail, a hardware control trigger should:

- Implement offloaded() callback to indicate hardware control
- Associate with the LED classdev's hw_control_trigger string

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
2.53.0

