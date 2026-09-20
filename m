Received: from sender5-op-o15.zoho.com (sender5-op-o15.zoho.com [165.173.182.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01694718FC;
	Sun, 20 Sep 2026 19:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789933427; cv=pass; b=i2qTTguBsWl804Hw06kslpDgQEsMEpG1jAHXARH5wxp1wyIfQbf77Y2cxh6pSqpRCrLzqnECAQUT7yCsNbnpNiXJOMXN84PL5zSpPXe/qY7tTI2J5AKu5+wjV4rKqtVqPyXoPNqnQlJLKx5KRvJW2U54ojd/0A5TrTpYK5T5LGc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789933427; c=relaxed/simple;
	bh=8whFkDT3q2FBkk4KXznACO6L9PWdgSvBZxlEza4pSeA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pOtUmGnBIRSy+a/nFp0eHgjG8SS+6opgV9jdoletaT+iOIkLyzffqpq0MPQrUay5zUTT1lBJG/kMjt+JsZiQCdqBwhe+JFMSWEZQ4AMfezKce7PJcHtp4pswEK0Ukqj8XPmiNYCp6OU3YWIv7AkLWgn3Cfm6AQiyZDBC9rU86NI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=EeAg+Ixy; arc=pass smtp.client-ip=165.173.182.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="EeAg+Ixy"
ARC-Seal: i=1; a=rsa-sha256; t=1789933258; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=l9noJ/QGs8nPo2nfYWeJXAY5pSyWKXEPSrmBHh02z9ACFiwrlsBG8v26o98aWP98KZHhDYEEzS+LqqjJguEi9MC/dxkygfpno9GrP/JThAVCCDKPAD5cPY2zTS+xxp5PW/HsJ6gcOgSD8y/vOHGZwDVjKtKbZcjTbO8Iomy1IAc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789933258; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=WYe+gEZ9YtZFO0g7tdDS+u0u2ekHnDyCAIRMeQPpZow=; 
	b=J/CWunS+fUh9Yn5+QGrD+jaflyM4RG3+3uR82AXf6Bp1Jx1KRDNwEDEC7xrdMuuCkXfTil+xNrgygjRcAaD43x6OVCoFlllcwDXPp2yhhi+HCUwKySXym/jPbL8C7l735rT5Gx7SsTjTlZJES7CArC3Ag3thUDtiHWrdrzQKhAY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789933258;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=WYe+gEZ9YtZFO0g7tdDS+u0u2ekHnDyCAIRMeQPpZow=;
	b=EeAg+IxyqICM+4WfaRZZq4EJJ8ky63+dM2tZ5pHG7ABmBOUCbXQ29GyR0B9yLVtF
	HtHkv3k51H5hqPznKoV3bdh+jbJGIyChc4A1ygkn/g3AMiNO2xGW/l0wTT+dK2/I3BA
	TyTiGAUmikUmff+KRm7Jqx/PBNI9XdnuBv7WNvBS1Isi5FD7o0PgsYsRTUpGlyJm31b
	cBPbI28WxXV+n/nJOm/KSUwKidSjvmX3QzwC2ZX/aX0DRSEY3Adm1MvMk3YM3+UmFqU
	g7NR0+eYVggW9h3vTSgJzyxH4DVT9x/EOyl2A0uzjBygTDMjE+mR/UbehVcCTvWkdab
	S19OoIR/gA==
Received: by smtp.zohomail.com with SMTPS id 1789933258322869.2728040975137;
	Sun, 20 Sep 2026 12:40:58 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Mon, 21 Sep 2026 03:40:21 +0800
Subject: [PATCH v7 07/13] leds: turris-omnia: Implement hw_offloaded()
 trigger callback and declare hw_control_trigger
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-leds-trigger-hw-changed-v7-7-fe3cdb6dec51@rong.moe>
References: <20260921-leds-trigger-hw-changed-v7-0-fe3cdb6dec51@rong.moe>
In-Reply-To: <20260921-leds-trigger-hw-changed-v7-0-fe3cdb6dec51@rong.moe>
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
hardware control mode. Implement hw_offloaded() callback with its return
value to be always true to reflect this.

Meanwhile, declare it as a hardware control trigger as it's forgotten
before.

Acked-by: Ike Panhc <ikepanhc@gmail.com>
Signed-off-by: Rong Zhang <i@rong.moe>
---
Changes in v7:
- Rename the offloaded() callback to hw_offloaded() (thanks Lee Jones)
---
 drivers/leds/leds-turris-omnia.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
index ed6a47bbb44f..57128ae7e8fd 100644
--- a/drivers/leds/leds-turris-omnia.c
+++ b/drivers/leds/leds-turris-omnia.c
@@ -195,10 +195,16 @@ static void omnia_hwtrig_deactivate(struct led_classdev *cdev)
 			err);
 }
 
+static bool omnia_hwtrig_hw_offloaded(struct led_classdev *cdev)
+{
+	return true;
+}
+
 static struct led_trigger omnia_hw_trigger = {
 	.name		= "omnia-mcu",
 	.activate	= omnia_hwtrig_activate,
 	.deactivate	= omnia_hwtrig_deactivate,
+	.hw_offloaded	= omnia_hwtrig_hw_offloaded,
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

