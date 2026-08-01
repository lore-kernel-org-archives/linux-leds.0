Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5A9293B75;
	Sat,  1 Aug 2026 17:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785605364; cv=pass; b=tJP7S/32l7c0MOR1bLMrQU5YSp6pSI1VjRnlPCAFNoH8xj8fYvgN6oyZEVJUiCqJk8uBUIqvGQzkmcVRwCPXNeUEPuuXBMn6HLRiSFIhivyCAs8SyMLHJaNjJtCdbVAWe5rx2hJRk4Afv6t9y1u8xfR3gNfa224Yx+haCL7eTUw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785605364; c=relaxed/simple;
	bh=X9foO89JV8OGyX1PRKtcqc93ExKcnfUD0n2o9In4eWM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g3hM5AH1VWKYhhKRCU/zXdGpD9OycXe0v5lzjlYPipqQLh9mLJCESa2s4VGG3BXLexHPD17z1fpKoH9iMwM8wq2mz9RlOjIHS3XueXd0ts/9uf1rkIsnXIaqzAyou4Xczzi4XMcedwSJprSwp/BhX6d4AAzbCWahhTPD0wMNF+E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=q7N7e9/o; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="q7N7e9/o"
ARC-Seal: i=1; a=rsa-sha256; t=1785605311; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MIFoDsdL+VdczIzsdt9wIlbJkTgRA52gnhbqiWLGMjycNJ2XkDf98mXgRqFcm/nh93Bv50a+oGpU2yaoiy+ccVXYs+R6sA6AA3azcmuTFccXeOi+EJqCnGPwJeO2vbsscyyJ+Bf+n/42YPLmUzIDpoymB1Y4sk0sGBpA5hWX4EY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785605311; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=QVl4+M4/9Wz+ooVoO++Gqv0osQsXIMyFgRbac2TUkaU=; 
	b=HqGpJv+kZmwVTDXhjnydeYl23wDOCDvpSdjhitzc08J2rTD4inxYMo69UGGW/OTgnScG9PttLXTTqKr3y35QItMUroTrnhDPuo0B6vZIrkKdq7wI5eQpgsmRAF+08gPge8agBm4LFAs7DKfcgQAkoLKthrp3860YSyeqQb4/RgU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785605311;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=QVl4+M4/9Wz+ooVoO++Gqv0osQsXIMyFgRbac2TUkaU=;
	b=q7N7e9/onYvVJOe6/0lHbWrSS1mVzsgTkGS4SVQoNX/gKidr6hBJZR896kxfjtIQ
	kdZyPm8yQK4PESh9DPPsSyu14yr/qAaznaG2YeU0cLDNTjyY2QM+g7oqyhW8zHWSjB4
	5YMn5pDIf9ENf12LYF5gBWjQGEDnTDBjewQAqw/Mt1ArPAgyt+W/cHIbhFbL1zNn6xh
	vOId82DDFSfD19SC4ItKpjHg72RPZ23bWN3j7hvWZaXht+e9SFfgEYHyPsRRH7JuyNs
	nVb0lEZ9Gn39pxDm7jhlZjmXTyqbTf07Qd5/JzV1Lv9WezQXnHgOGXWhlzkaUjbMfB7
	vACsb487PQ==
Received: by mx.zohomail.com with SMTPS id 1785605311182977.5349330435339;
	Sat, 1 Aug 2026 10:28:31 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Sun, 02 Aug 2026 01:26:49 +0800
Subject: [PATCH v4 05/12] leds: turris-omnia: Implement offloaded() trigger
 callback and declare hw_control_trigger
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-leds-trigger-hw-changed-v4-5-f97e2ca976fe@rong.moe>
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

"omnia-mcu" is a private hardware control trigger which always stays in
hardware control mode. Implement offloaded() callback with its return
value to be always true to reflect this.

Meanwhile, declare it as a hardware control trigger as it's forgotten
before.

Signed-off-by: Rong Zhang <i@rong.moe>
---
 drivers/leds/leds-turris-omnia.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
index ed6a47bbb44f..32d40d176d3f 100644
--- a/drivers/leds/leds-turris-omnia.c
+++ b/drivers/leds/leds-turris-omnia.c
@@ -195,10 +195,16 @@ static void omnia_hwtrig_deactivate(struct led_classdev *cdev)
 			err);
 }
 
+static bool omnia_hwtrig_offloaded(struct led_classdev *cdev)
+{
+	return true;
+}
+
 static struct led_trigger omnia_hw_trigger = {
 	.name		= "omnia-mcu",
 	.activate	= omnia_hwtrig_activate,
 	.deactivate	= omnia_hwtrig_deactivate,
+	.offloaded	= omnia_hwtrig_offloaded,
 	.trigger_type	= &omnia_hw_trigger_type,
 };
 
@@ -251,6 +257,7 @@ static int omnia_led_register(struct i2c_client *client, struct omnia_led *led,
 	 * by LED class from the linux,default-trigger property.
 	 */
 	cdev->default_trigger = omnia_hw_trigger.name;
+	cdev->hw_control_trigger = omnia_hw_trigger.name;
 
 	/* Put the LED into software mode */
 	ret = omnia_cmd_write_u8(client, OMNIA_CMD_LED_MODE, OMNIA_CMD_LED_MODE_LED(led->reg) |

-- 
2.53.0

