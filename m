Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795515071;
	b=Z1lQ438eDjyAM0828aKMEuVknyEWs+lgu8nHJ7DVV+B2OdnWPxx1O/dB3gdppBOUQXfq
	 p7+VN3JOrmRcRiEWtTHZNNNUo/W+puCbYF6An0QMy6qhBuYU6XewiZCsqjI4KcuzEzJqk
	 CWlqNEfjPwfe71Q9IXBzkSktRk+lVE/3qojJwZlJ/SbmHlvEXBHTpq/W8rS8C4KpY5AVn
	 +xAWeLN3fTw9k/ZqOf4uLetIZUk2CvAczbgt/BWcudr7GjGce95mmSaFONX5Ktjmy5//v
	 Y06CXbFcgr8pq4GAei8EVhDUS+vbDnnTsO/cNfBMtDjZ01RpxBLcGF4zN5buMCpe3DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515071;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=8LzBCOLhNJ/F4/5I+BBpSJLxAOQbmQSfZhjMSBmDwl0=;
	b=P+JhVQQIdrssKqa9ACYcEfgqYqZpVUyghT9saF7mmuXvIS0VbiyxbyR3BmbfyUQ2Wl3+
	 mrxWaqBf9iIiyBb0/qANGEqCfvYfCTeqfLHaHNL0Ap0urlfsQ9zHdbI+fclwVfk9/OtLC
	 EQmwu/RBSk5gDIaQUszfTFj/ykquZ77je56G6XuOQqpCutla6Z9KUHb8I9TL8jiY7P2gc
	 /N+Dk5CPsVdzO9cC96iOr7GFsDS5gF0r3+lImktWEq1m+gyJ/bkhX/SE4HSJo7qY8funp
	 1iicP66fi0TXfVOosgpYsfLp4PyaMwf5fi9lHaZKqqAcE8TlaNcQdc4Gfd6f+WSLhOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lny6vb5w;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14FE606A321
	for <linux-leds@vger.kernel.org>; Tue, 24 Nov 2026 10:11:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B14FE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lny6vb5w
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2f0481b35c9so24135215ad.0
        for <linux-leds@vger.kernel.org>; Tue, 24 Nov 2026 02:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795515070; x=1796119870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8LzBCOLhNJ/F4/5I+BBpSJLxAOQbmQSfZhjMSBmDwl0=;
        b=Lny6vb5wrWwMhZUdnN8hlCF8ORcEMD85thGQm2nYx/wH94Q96b13rnVRmOaCgtmzma
         +OhNchu9zljtD1f9WIH7Roi5sZ513hx6PJr6J9p9VaokRB0BPCYEUSRWujNivnQ80qqu
         vb5ppEbk7seUA/0bQnw1FIjHgBMvr2EoMHqv90TLbSesyd8ihvsRj2w52lWtIZP8qoUX
         PPACXh8NB/5R19HqP5uCmtnzgAdvZWWGdNsimnBVeq9Dyk+OaMETDHyDX8Ywg0VpsLc7
         cBKxj5hPv1XST6cFOS+ZQK6ko8Aq1nj/QcalUSKHzf4wgvJ87id6m2q139orUnoebmj5
         wBGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795515070; x=1796119870;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8LzBCOLhNJ/F4/5I+BBpSJLxAOQbmQSfZhjMSBmDwl0=;
        b=UQBUtKRxPpfySJbDiks/S+Gpy3LVf4ttp5XIdze3hHx1RTb+PWBSJxXKJ0EEnMA9yl
         NOOIeOVpwPGVMmuQhm8jqQg7lPZ0ohwmAqVwJkL31dbFmNGTyHsUFnaJHgapi4KtXzXk
         /UWUwiRNuC8F4rcqkJ+fsRPMJKgifeEZ/JjLT4hZyoz5wf2q9WO32PpZ9c7S5vhsVK5D
         EmhceKH4wqiPvErNulwJhIRnWHXRlH6jgN2SiwfIxfsiuPBY0s9rmk/tso5SY2KJxlXl
         RT00DzJF7p7ejxLiEfgVhStJcbcIdWT/uorG4pDgqrDBddebQyvG5D4mMVNSu/tz7KUG
         auFw==
X-Gm-Message-State: APuU4Z+LUw4ZC38JZGEkwSj0dWUCOgsMEd3v1oSS2aTXbhenlCIK6wcf
	HdP5ajlZFwy1Urk4ea/w9v8AQ32XGDSWDX+6ukKHHZV7yyyjH6Kj8WbJ
X-Gm-Gg: AZFdTZfSs4MKZq4rjU2WjFyRutnV7lPrDAUW6PzuZjGo8n8upZ4tYILDEzjrnp9Skg6
	Vl21zuR62vONyoW9WYdZwbY3vPcwsoHDisjDCR0m/vY8kkGPHOj4ts59NTUawStZAgnzJQXStBh
	blZmte2s9+ojwKRBEbKokO391oUkf0ydRe3URgXGG++YofN68/8DPEuDZsXWbOgW93L0BP1nIfb
	gBD6p5QNB58R8XloZQT+vt0ovygfqZ1AGCaNVLZ6W47KJHhBSJgFN/1pUYWBNXAklnqM2lZ4g/4
	/fVpnMXs5z+2LTPW9s+Usko2myDp+kpiCdSCqksNYVYw4IccUY2/s8BprVsqhfl1r8+xRoUaZ6c
	/ZuuNRLdCgZyowrue4W+Ch50hdH0Yklvc6KCrgktb3t+/gzl7yT3acSqdubDg4enXdHSM+cUbnA
	gG3h/sjSTEVh+L4NFZEP54AzXBhBd3QIfJXc8FEMnKisuB8csohuQ1vt3NwsocZ6YxBvsgTTWC2
	sz0w22k+cGE6y70dwyJpaDlwM5BGQkqFnmD13MKYQx8vkn8WvGvUpCGf2NknY7Vetq1rk+kOqKF
	rBt0kUR5XZjlkB2TMUiySHoFL6WgUDbtAS8xucgbktdmkNQ=
X-Received: by 2002:a17:903:acb:b0:2f0:25ea:8fb7 with SMTP id d9443c01a7336-2f03f0c19f1mr124505295ad.3.1795515069885;
        Tue, 24 Nov 2026 02:11:09 -0800 (PST)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f102fc4sm66693175ad.43.2026.11.24.02.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:11:09 -0800 (PST)
From: Cong Nguyen <congnt264@gmail.com>
To: Matthias Fend <matthias.fend@emfend.at>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] leds: flash: tps6131x: put the LED child node reference
Date: Tue, 24 Nov 2026 17:11:02 +0700
Message-Id: <20261124101102.3884922-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tps6131x_parse_node() gets the LED child node with
device_get_next_child_node(), which takes a reference. The driver never
drops it, so the reference is leaked on every probe error and after
remove().

Drop it with a device managed action registered right after the node is
taken, as leds-tps6105x does.

This issue was found by auditing the driver with an LLM coding assistant.

Fixes: b338a2ae9b31 ("leds: tps6131x: Add support for Texas Instruments TPS6131X flash LED driver")
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/leds/flash/leds-tps6131x.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/leds/flash/leds-tps6131x.c b/drivers/leds/flash/leds-tps6131x.c
index 7f2c3895e6e9..56de7a1cf9a7 100644
--- a/drivers/leds/flash/leds-tps6131x.c
+++ b/drivers/leds/flash/leds-tps6131x.c
@@ -529,6 +529,11 @@ static const struct led_flash_ops flash_ops = {
 	.fault_get = tps6131x_flash_fault_get,
 };
 
+static void tps6131x_led_node_put(void *data)
+{
+	fwnode_handle_put(data);
+}
+
 static int tps6131x_parse_node(struct tps6131x *tps6131x)
 {
 	const struct tps6131x_timer_config *timer_config;
@@ -550,6 +555,10 @@ static int tps6131x_parse_node(struct tps6131x *tps6131x)
 		return -EINVAL;
 	}
 
+	ret = devm_add_action_or_reset(dev, tps6131x_led_node_put, tps6131x->led_node);
+	if (ret)
+		return ret;
+
 	num_channels = fwnode_property_count_u32(tps6131x->led_node, "led-sources");
 	if (num_channels <= 0) {
 		dev_err(dev, "Failed to read led-sources property\n");
-- 
2.25.1

