Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4432D7398;
	Tue,  1 Sep 2026 18:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788286459; cv=pass; b=ThA43cCiG8RQaaJvykB2hnCPXNdPFn7aCC6zvi0szSj94zehc0AX9l3nDB84fZp5tnVcKzgGbaBTPXVJtIpK1VzEhdG0X83nEzfIp0NMH2/7wXCEQNcgASJUyaCERxZ5nBSqY/gG9QGXycpdv9OtAEWJQPlxaCVjH4VCW6eQiO4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788286459; c=relaxed/simple;
	bh=rP1FJCLNCgQ4/odsC5rOyOEqiN+aO/Z0ZBAZXBsiOTg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UJ/yM7ZeE5Ju2MPpZ0OugTI+Zb7DthlJW+3Gcf8cS2YjbgnCC5bDxpV3pc7aVt+MPzrk9cntqZ4jxreZbAtKkTn5oM28dS49w1fHexnEGu8REJNOJC5FjgeSlGGRjFMfPQAxY09yzQVbaChhyudjeRy08TyfX796YsuTf9SsQiE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=cPJm8HgB; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="cPJm8HgB"
ARC-Seal: i=1; a=rsa-sha256; t=1788286294; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nxO5KCjfICE4HdM0HppNRE1SBdlouk0pEp5VDceoMEDtf/2RzPQPKpq/qLBhMsy/akx4QBzrgJPzol4bm5Ql0U10t8qXg0XKnpS2XGlbNCH4v6vseA1/klM1Vaw4VQ/4Xn5DhPVlhyYybSUwqZ1kSkvi+KmtUmXdot6v/k4LNu0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788286294; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=2j5a5rGmXReIsQy66ZTp+dwI3KKvaZ3uYw/Bf/oap+A=; 
	b=n5yaoCjsowne5Fdt1a2PcLVTuBN6LJ1aT6T7R+F+MdUL/jcK8cSIL5IfCo8ze50IPNkcgzhvaEVtJZuFnG7zN66prfMYDD0ff5ewXnshdhu3ZdioPUbiEfbhfAZdcVze2HfRfxn3N51szjHZEzpNBRLioxZytl2HLzd1L0BM5is=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788286293;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=2j5a5rGmXReIsQy66ZTp+dwI3KKvaZ3uYw/Bf/oap+A=;
	b=cPJm8HgBd1DJE7HqNQWGJIzRNxgcd1zZ7cS99Tfjr3lQv6vIQ7repx8sUfWXr30L
	IuUYjRTRGKm6aITKOtBK8YK4UfXlAADYM3j0PpTEtQP3g3+KPNjPMs1If9z+VletRIj
	MA5f81vfPQzQUMklPALqIchSGjNj6RqMVjPnaKZLGXddABRSMcFK7q7LhllnpyXSwPT
	YQMfLoWaQKnl77g6BdHZZs69qrTmr310iEUnApMGFrwBhPs+bFVGuVYpiM3UWtnAZfg
	6W2b647cmifnzn0V/VKwX6XQe736fTjvogzTwjBkYloE78jwcnZal+534KOAvneZSmM
	uEH6HiLZ+Q==
Received: by mx.zohomail.com with SMTPS id 1788286292417197.3370562977443;
	Tue, 1 Sep 2026 11:11:32 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Wed, 02 Sep 2026 02:09:27 +0800
Subject: [PATCH v6 08/12] leds: trigger: Enforce strict checks in
 led_trigger_is_hw_controlled()
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260902-leds-trigger-hw-changed-v6-8-55693cd78877@rong.moe>
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

