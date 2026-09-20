Received: from sender5-op-o15.zoho.com (sender5-op-o15.zoho.com [165.173.182.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368C4476681;
	Sun, 20 Sep 2026 19:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789933465; cv=pass; b=iLpBrJfTeW5knHPrWNriMOVOArk+CgrA5Gap+f5wrjUC1MLJd2NyqwAVH7LOK1fdLQ5zB9iDvn1wXMwa82HLxzgp6c8zpirGtrAhz5QMwvofs4QeeTEe2RamjMcs+afcLPQ8D616TB+RNEehACTyU8vB2YPe0sSRqon+XA+Quns=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789933465; c=relaxed/simple;
	bh=yG3cWWzjIZAXZagai4B1TYafER2rr+mUiH5N9vTwpQ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EcrT4Ywq3t0HlMenlKz+Oe8dtkbwC9iVxs2exC43Y0I/OLtgKBEIUp7y7m3EIuRsFXOUNE9TQIOQfcgXJ9dFvcPuS4a/AYF6erl5iThtb/QjeBAPnwFFKBDmM3BNFzJiQssfsym5B3tVIZkqlOyyH3YWIUDyh++CWn8lIbm31ys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=PcWPA1GY; arc=pass smtp.client-ip=165.173.182.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="PcWPA1GY"
ARC-Seal: i=1; a=rsa-sha256; t=1789933268; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jmM9xGqrGAl4kEkAD8jf+4E5GuVUmZy5ueV5gwatOW7yhFApsiL+WAS0pnXGjejs8NumpCWCFNfxCkq/InZ94DkCwGex9N0Y5N8trWPv25iig5gYHt2QizUFItQNZOWyTPauYgKLIYe0JBM/9kGBRZK/Z07NZJGKb5GbYUllCWI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789933268; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=2FcYYdrcjAE0hgS3YmVlv+tJ1/G1wYcCRwkRcENotIo=; 
	b=CESUU3sgKDFo/3GoG9aisHpALdvGGHOiseeXxtVPRY8+GmXpztCph2p6gqKK/E1G6E5CulBuuFcc/ZBEAXmUmZLGRWkPmA26vKptzkFtzP4BsMAJZwpiNRxrA5QtWnF8sNHGuv3e8ajiw1QQFu/D4QAyB5k1KhacUVAqByku20A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789933268;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=2FcYYdrcjAE0hgS3YmVlv+tJ1/G1wYcCRwkRcENotIo=;
	b=PcWPA1GYQLvrScMIV7mpPGn5Ivpqdlu7JQQAWiN97fJMoNYrKFTXDWo+P29bksl2
	GxMJm4Rq60nYZXSYwYiN9tCRdgudkaJfOAQQ0+lQnBEyQKQO1drDxxeETdCZqDJMufl
	3202ZsNfcXHni1PQGh+jAW5tV+Q6cc6WIPc3W5BIEkT0xsIYgNKY566RgERoXbj9bAy
	CIq4bYrbLL4P8rAmgffXZFnbDckznyhiupGKIBFV8jpHDji5fM1ocoAoICyshVYBhU8
	k68yPgRI/mDebD7rJ1Gjw4UKEaFMIg6AfVEf6fWQ5YJyk+2HdOhFqESKOicUiigRwPh
	uA9FYL8Ezw==
Received: by smtp.zohomail.com with SMTPS id 1789933268181778.553587833174;
	Sun, 20 Sep 2026 12:41:08 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Mon, 21 Sep 2026 03:40:23 +0800
Subject: [PATCH v7 09/13] leds: trigger: Enforce strict checks in
 led_trigger_is_hw_controlled()
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260921-leds-trigger-hw-changed-v7-9-fe3cdb6dec51@rong.moe>
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

With all existing triggers adopting the new interface, strict checks
could be enforced to make the semantics of hardware control triggers
clearer.

In detail, a hardware control trigger should:

- Implement hw_offloaded() callback to indicate hardware control
- Associate with the LED classdev's hw_control_trigger string

The fallback path is kept, but a warning message is emitted when it
reaches there.

Acked-by: Ike Panhc <ikepanhc@gmail.com>
Signed-off-by: Rong Zhang <i@rong.moe>
---
Changes in v7:
- Rename the offloaded() callback to hw_offloaded() (thanks Lee Jones)

Changes in v3:
- New patch in the series, splitted from PATCH 3 (thanks Thomas
  Weißschuh)
---
 drivers/leds/led-triggers.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index 38ce3350c870..6fee3145caab 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -42,9 +42,17 @@ static bool __led_trigger_is_hw_controlled(struct led_classdev *led_cdev)
 	if (!led_cdev->trigger)
 		return false;
 
+	if (!led_cdev->hw_control_trigger ||
+	    strcmp(led_cdev->hw_control_trigger, led_cdev->trigger->name))
+		return false;
+
 	if (led_cdev->trigger->hw_offloaded)
 		return led_cdev->trigger->hw_offloaded(led_cdev);
 
+	dev_warn_once(led_cdev->dev,
+		      "Hardware control trigger %s doesn't provide offloaded state\n",
+		      led_cdev->trigger->name);
+
 	/* Otherwise assume private triggers are always offloaded. */
 	return led_cdev->trigger->trigger_type;
 }

-- 
2.55.0

