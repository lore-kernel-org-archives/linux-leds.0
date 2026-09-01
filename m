Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58AFF495026;
	Tue,  1 Sep 2026 18:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788286416; cv=pass; b=TBLrxojuRpXM7emrgdyOTCsTXk2IZazTONBc/n86fbRzozPLA9dQo6g4rZXevtlpHQiNDIys1uaHVgyjM2CXYvJnBCbD1YEy8m9Kfu8VWgKSHlG29wmeYqpYLleg4Q7UW8J7L8o2bdAmPoul6xXgX/pW6W98dO1jvA44uz8Ka5g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788286416; c=relaxed/simple;
	bh=TejI76x3eGihmgm22rJqE1YBXJ0JwbqwBL0zLEQgm6E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b6GIPSqv4vNRtPWN2nVEtuwA2+X67Jwry/OrgExEi6xFCj1XipWRj6pICTvHjNIOtf8yuDT5MbF0thqG2BADqEMlmWt3EgSNVQ7krWDz9SDo6rb7Ve8unH2aZr5zcnapg+XGiLZSGxwp/q39R2fD2J33eIaleaCyBMP1OgJ/Qqg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=Euc1559+; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="Euc1559+"
ARC-Seal: i=1; a=rsa-sha256; t=1788286283; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KMqpHPw2flfXpXt+G7bFynvIWo34Zkmo95smhq6AbQbJEAtQ02QH6RXQJwqXkUEfjN6HKI3q9vhmQzc243kXkfi6utl8MdFzg72bjIFPDujvo69FYPLCUcOZ8MNGeixCtgTv76kIP5vyHTA+n4UVTwZ4dWFIhkR/62j92hxVq6g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788286283; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=1NxgZjL+W2/6USuGo83LwA7yJPTHsc/hFLx0S13UrGg=; 
	b=YBQbXjyAwQ4oHHAJs5XZ0sa6XitiMe005tz3+ddjLei+h9DJg2pzReHokKjI8y795crrvnTu43JTg6BB0tn92iedTL4BInk9+CxzIR4fvsfL4TLl23o82IuaSPtDCaqYvWfcgDgtAJNmuTTjPPpCf9t4teypU2g1pMd5YG4gNaA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788286283;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=1NxgZjL+W2/6USuGo83LwA7yJPTHsc/hFLx0S13UrGg=;
	b=Euc1559+r4TVFyfyvNWDzPYjpB2HjrfeQldPgQDrexvL+ctSkMg6WiDdSXOMPR0l
	8O14XPIKgIwBakhG5z74Y1iAosplpvoxPjW5UinctGLMiCi2nmOiw9SsbpifZNQF4Ul
	MCHdB5AmoSGbRdjtLECHujB2w8CKCOXvW5497M/l0x2wsN+aEMRNIwFi/75W2fpWOak
	5ntJ4duE/MUZPWZt+a1DukqwYcfmSnkF2m2VcAdUtZhuT1yonY5ZsxwMdm1gUSsjBWP
	ol/Qr23wUG6lgOa5ECz40AKK7zNGid+Cq2Q1kvShlHRbKohJ+W/oEL9e2lz2ZVSiEdC
	zHO9btbHEQ==
Received: by mx.zohomail.com with SMTPS id 1788286281468437.9544778526488;
	Tue, 1 Sep 2026 11:11:21 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Wed, 02 Sep 2026 02:09:25 +0800
Subject: [PATCH v6 06/12] leds: turris-omnia: Implement offloaded() trigger
 callback and declare hw_control_trigger
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-leds-trigger-hw-changed-v6-6-55693cd78877@rong.moe>
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

"omnia-mcu" is a private hardware control trigger which always stays in
hardware control mode. Implement offloaded() callback with its return
value to be always true to reflect this.

Meanwhile, declare it as a hardware control trigger as it's forgotten
before.

Acked-by: Ike Panhc <ikepanhc@gmail.com>
Signed-off-by: Rong Zhang <i@rong.moe>
---
Sashiko has reported this pre-existing issue in previous revisions:

- [High] The statically allocated `omnia_hw_trigger` object is
  registered multiple times via `devm_led_trigger_register()` on probe
  if multiple driver instances are bound, causing lock and list
  corruption.

The author is aware of it. Since the driver is very platform-specific
and the relevant platforms never have more than one such device, the bug
is never triggered on real devices. If a user manually binds the driver
to other devices, it's their fault. Therefore, fixing it is far beyond
the scope of the series.
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

