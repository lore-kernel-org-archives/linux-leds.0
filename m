Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4FB2F3C13;
	Sat, 18 Jul 2026 17:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784394658; cv=pass; b=c5gRC7FdUyOPHuEo25QAV3s9/XFTxX7+XkjiVaZUbLjlFgtEWPfWhbyU5MUR5I3Tj68ytKuckBi6t86VGJwQnvUtw1JvRT04ZjD4YxlGf+watHrWcTLxvKUPtU5UETsKGwFxx47sSUl4Wj7fpmJy+UIxhCj6Zdz3JAx7artiNJM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784394658; c=relaxed/simple;
	bh=X9foO89JV8OGyX1PRKtcqc93ExKcnfUD0n2o9In4eWM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TfaC+kC9deZoRMq8nanDRuOE6cavhFeWN22s3YgXXct1mFJR9JlKk5c8bD/cUTDkpAv8kN0CpKuwQ4tzpF1deQ6sdJ3mFQxfBpxzC9jPJJbb1AqklnSmUgIB7V/8ZmznNaRpTPfUYDyEQzrhnaABcuMjIYuaOOrqKcM0gxi1b/I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=BY77sVza; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="BY77sVza"
ARC-Seal: i=1; a=rsa-sha256; t=1784394550; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=L7qq3LLzAzoK+5JNpFDE9QccxYd6h5NyWcTfiZOfdt+0tqX8fA5qm7seaKjefsXbQbpJ0NihdyKTEQxfzVYs/LKJffX6l91SsMImrOioBXgPqNFspE6A/6qXzVePvuLwGuOyIjDyCQx1I0y/5WqWVSAqDWiqRPX867AHTRcSf0U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784394550; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=QVl4+M4/9Wz+ooVoO++Gqv0osQsXIMyFgRbac2TUkaU=; 
	b=nTJULNeo/GlZX7reZ5UOARcUj0cKeyUVAzjRIitF7dgEoXVuPrFqfNHenCZ0b6mpbOqzvg9WaomLLxSZ0BuFWyIOTogOGL+6tYO77uLp2wYyEzmt4tsChvw4mK9e6z6eqfCl1HUk9dD8UjbhuYQXODqvEjv1V1WpB0fElqqmM4M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784394550;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=QVl4+M4/9Wz+ooVoO++Gqv0osQsXIMyFgRbac2TUkaU=;
	b=BY77sVzaZ2B84rXkfDbNmkVY7GCUawWe5/XD/SX9vqXjWQuvmedwyRenPuIWUaMP
	B8OFCGojK6naJ+L1MXw0ebS2LUTg1YLUgi6NDIjzaeKrBO+sL5mXBxzIFggqFDyMY8r
	k93hiLHn3hcVNQhYRIxuYn0sQZpK7fiYHquSwu+TuuperTy/LTp/OBNKxJfXueJ6nWl
	w/F+iZ2BsXtOJX7K3KniWr9PUfbZlJpHvD8gTwaESsKKbgk/XO+89s3UCnytovZGXHD
	E0DlM8aKiaTXHoqNyQn2iD319ncOqyHPL//zOMvPOsXAy82nATW2a6LBPfF39kRYOI/
	MftbtuUkBA==
Received: by mx.zohomail.com with SMTPS id 1784394548534983.9557685965633;
	Sat, 18 Jul 2026 10:09:08 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Sun, 19 Jul 2026 01:05:22 +0800
Subject: [PATCH RFC v3 05/11] leds: turris-omnia: trigger: Implement
 offloaded() and declare hw_control_trigger
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-leds-trigger-hw-changed-v3-5-5fb55722e36e@rong.moe>
References: <20260719-leds-trigger-hw-changed-v3-0-5fb55722e36e@rong.moe>
In-Reply-To: <20260719-leds-trigger-hw-changed-v3-0-5fb55722e36e@rong.moe>
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
X-Mailer: b4 0.16-dev-4217c
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

