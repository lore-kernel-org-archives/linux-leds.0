Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3997C37E5E5;
	Thu, 20 Aug 2026 17:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787246691; cv=pass; b=CJclET3kRY6IBtu2ebfiXjmwFuo86qFmVmWKrKOaCOzawnSavDVR4CghoCark4zt6Fs0OwBs5mn5Yn5t6wxXZzJm0104NinDP3W+O+HDdFLzM0aXU+LACtGSYtFO0U1xpPXIEIbllZVB0qs9fLYwGlzYAQD9o/0NQ68M2NyFnRQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787246691; c=relaxed/simple;
	bh=BmSyPGK+p8ozA16m6cqdyh39PPatHBbBoSYGySGOkOc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Up/0DptWX3TkZWaz3wiO3raHa4vR/wm1lxmLPU87rD3igDRYnaUGFwXOgFlgpjm4nfdcVTDSoB6vgbZfRwR4Lnr3geUs/5PvV2MImyXqPOSf1t+EyPb5vO22EDS9etJJNSMfXm3/09cA9YnDxYumOWV1byDbCsyKJS/Ndw/gvZc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=SjZ/wN7j; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="SjZ/wN7j"
ARC-Seal: i=1; a=rsa-sha256; t=1787246611; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PsC1LU6j1r+bp3n3UfSMkR32Fw0bfsvOR5ftU/G/F+ZtFxvt8t1SUX+2lKJw2TY/pJxpk8ShpaAVYl7yQIZxy0s7q4Zo+9y2DnBPE7ImmQ/aUYkFUSxTaQDHwDSlNSAO4HcKezNuYbFIwfBzux5R8CYmft0giUmYECnz5fdIPAo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787246611; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=WpmFjgeso2ehSmHv8Q8N2bLq9/mwyoJWo4V7lw7fleA=; 
	b=YSuF0zOmGcuZUq6SXqgjTIN2Rj2q5TYapEcdoj/Zzw18XHHCKBK+r9XfngFk4a2b+0l0b0NXhg2GF5Dil4Hgbh8mT87cz7jnNTPhvL3j1rPrV94Asgoq3CUr5U8hGdnUkzP3RgDt/Bs/XRt4pLTNgyqotiX7ukZJL8Sajodi9rM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787246611;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=WpmFjgeso2ehSmHv8Q8N2bLq9/mwyoJWo4V7lw7fleA=;
	b=SjZ/wN7jyMBS7RqR6PqXMHzl6EiLJzAq0pqtYb5Dw1v905atmNN0w5r2ts5oCfLF
	0yPTpWWHv3G6bG+oeA3v/t18qk5XSHp+v0WHMZYO85J0G/gvrKIqQrObVmz63O6kdE5
	tAiIJ9pDufiIPcTICZ+LSGX3IRGMLNg7qCQ1es47lvJ69QoA1I25hIJGerf2sqWpv/V
	FnPX+jofx1iyf+M0/3iWzJHxfjgz1xGcvoln6l/zXxVhdhSUFLidKMJTMEh9gG2KgP0
	iNcO9mlbQ24iQBBj89L1MlUUJdi6gutqCVD3efREc30nuqJb+GdoUQSmyP5ENFLajB/
	1QTC1eLngg==
Received: by mx.zohomail.com with SMTPS id 1787246609813224.71415956981025;
	Thu, 20 Aug 2026 10:23:29 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Fri, 21 Aug 2026 01:22:00 +0800
Subject: [PATCH v5 05/12] leds: turris-omnia: Implement offloaded() trigger
 callback and declare hw_control_trigger
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-leds-trigger-hw-changed-v5-5-3e00d6c4a936@rong.moe>
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

"omnia-mcu" is a private hardware control trigger which always stays in
hardware control mode. Implement offloaded() callback with its return
value to be always true to reflect this.

Meanwhile, declare it as a hardware control trigger as it's forgotten
before.

Acked-by: Ike Panhc <ikepanhc@gmail.com>
Signed-off-by: Rong Zhang <i@rong.moe>
---
I am aware of a pre-existing bug on probe, i.e., non-idempotent trigger
registration. Since the driver is very platform-specific and the
relevant platforms never have more than one such device, the bug is
never triggered on real devices. Therefore, fixing it is far beyond the
scope of the series.
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
2.55.0

