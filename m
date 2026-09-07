Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036B8523798
	for <linux-leds@vger.kernel.org>; Mon,  7 Sep 2026 20:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788812682; cv=none; b=oAVSIY6+Z4SoKGSCXUPdGUlLm0uB5nQgqmCeVrs5qH0eLLmx7cg5pnMW2To1J9OUAd+pzEF6dJtNv2uozL/LwhJ0HXanGHuuDRamN+1OR8Ak35AE0dvAfnbIPnVfDyd+1OwB14F+ISxNf56xDxjnv6kzak8GLE/j7mEwHIGXfC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788812682; c=relaxed/simple;
	bh=X7JWu3hTwfda0G3LTzUQurk3pgnp/SDAW7/OksBAMEo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q3GyAchIuf+Oqkh0cB2PV19FcHlIxSoFY/c8kQtIEC/lh4n2Iuvg5CcXkRNiRofvqFKWgfVkOdUvgrXH0Qm+Y6SGhbXUFfQC+Ou+dy0cG/9uDyrrqGk/H3liLxVLcme0BXGzay0DGnGzLsBlq+fmwBuvbX2dyyPtjTt9a9W3zg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KGxaOH1M; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KGxaOH1M"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-398b3d66515so3698920a91.0
        for <linux-leds@vger.kernel.org>; Mon, 07 Sep 2026 13:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788812679; x=1789417479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=46QVQzG8H4ax30pO+Grvw+jZNC8ZuaIYSYVcUb0/Mh0=;
        b=KGxaOH1MKR625PM09u9t97+zYt1YeA16FSSUVoN/otUoZwCNfVw8rGN4tlurmSPwog
         p8GEwYA6/m//0zRpEzoH6KR5KFlQ0CBhFldodwR3lhPJ3IEa2WbxnV4UTXMDDmGlBgci
         v6TOsNOB3r2VYBUkuBY2Lb7hejcGWWhrgclbcA6W8odrGaGHPlJcekGvjWunSb3370WX
         hiUW1NkIyl2obCGAFmQhk1gQFJqnugg7SetNbfsGTX1QA6E1PHIon4pvTuSZwqbfbQJe
         djEeF9iVJHkTYpGSCAlGo3PCthb4qCCdamFhxpC3QrcfiFxmoFxmUKXkeGYXt6jQQuCc
         JuYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788812679; x=1789417479;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=46QVQzG8H4ax30pO+Grvw+jZNC8ZuaIYSYVcUb0/Mh0=;
        b=Wn3S+uRozoc/SxIMJViKcnhKGpMif5jUOZE2LFSfkD/3hP0GRYbLxFIxq9J08j7QuZ
         /ccL0lfMaxEmKlgebFy05c7oFURmULyc/MhxEreVPGMTJfdzvvj6hK7fO2YTlaJIuVGi
         3fei5aaKbICTx1aj6zA1E7wSDs+KLRQ8ccLWJ5itkwYxScbA2gtt24JC3JrGji5zu0VX
         iOBHcU+/dnTXxz1ZkJPYKMMYYigU85ShxFtaQ+zIngY35LpRAU0xhUnzHscHGkafuvMX
         K42s0Tb6PY/7X0s7+y8kED1Y8qsolYq/Sozh89kkwwwS5EhAFBKQWE//etvfKIkD6P8r
         FxDQ==
X-Gm-Message-State: AFuF++m9mQV988cImyFaNlG0FUwuLw/6srUD0FvFhhlUTRqy8qGm1kfp
	V2DPxqP2KpWWzdW23Ca8ke2ewXBP+ivISdUshwyeJDnJUiMLTjoJ4GqBNzkhqA==
X-Gm-Gg: AYBFou3n/9Q0snIA/XEuzKxUGUeAoQ6PW0//mTnPMCETx7O3iiVPi7sX+19KJRO85qg
	14nROkx+a8jbaJGWluF4U0nXcA47GPcfwj8FpmBWw73+YxEDiONZjrpwVWqSYqVjc77ozeYAWBv
	YPSsyzfQF2t3g0ETu2vQIMw22SSqPkzd+MbCDX+7aitlDIR4U9zgVyQwKq7NfcET7qWQxfQlOgo
	vGFJVOTx9S3WYnPHo2tp30rf+SpU2Jj64RG8XGULKz7aKTqnj4VUpvSsh16SziB5QrHYlXrDRdQ
	BgV/ClrHaQD7DuE3TtnO6sgUz8+mYyTPqh6HqXxvJRoz96wcJuS+ajGHMAf1olqQMeg2KxRmjR9
	h2nfYKfsjp0SMgaXltYBL5wMCF9Bpc0mk6OF+W7r+XDG6DmI1Vk2oIIVBXRdxPSNANmwtm95lgk
	jUU+e31fh6TzRkxt7htitylnUQ6gV56QWrwEBNInSbg0bacnbjJMiXwCuTvY8KCM1ivom2ot1bM
	mdgY2qLZWkMVfCUiuIbTH4Ui383nQWMbCmwmXZfdVP14D4AoC/WeYYNP4CfTQoVFqr3Ur4J//J8
	dWVpldnPG924Ow78hHHBOYk2vSeHdYMWe+c0SA==
X-Received: by 2002:a17:90b:538c:b0:38e:b400:a860 with SMTP id 98e67ed59e1d1-39b26204a3emr39079278a91.13.1788812678990;
        Mon, 07 Sep 2026 13:24:38 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08ce4221sm33702487a91.14.2026.09.07.13.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 13:24:38 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-leds@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] leds: syscon: Use device property API
Date: Mon,  7 Sep 2026 13:24:36 -0700
Message-ID: <20260907202436.42304-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the DT-specific of_property_read_u32() calls and the
dev_of_node()/of_fwnode_handle() roundtrip with their
device/fwnode equivalents. Behaviour is unchanged for device
tree: device_property_read_u32() and dev_fwnode() operate on the
same node, and the fallback from "reg" to "offset" is preserved.

Use dev_fwnode() for init_data.fwnode; unlike a child node from
a scoped iterator, the platform device's own node is held by the
driver core for the device lifetime.

Assisted-by: opencode:deepseek-v4-flash-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/leds/leds-syscon.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/leds-syscon.c b/drivers/leds/leds-syscon.c
index d633ad519d0c..741850f35f19 100644
--- a/drivers/leds/leds-syscon.c
+++ b/drivers/leds/leds-syscon.c
@@ -56,7 +56,6 @@ static int syscon_led_probe(struct platform_device *pdev)
 {
 	struct led_init_data init_data = {};
 	struct device *dev = &pdev->dev;
-	struct device_node *np = dev_of_node(dev);
 	struct device *parent;
 	struct regmap *map;
 	struct syscon_led *sled;
@@ -81,13 +80,13 @@ static int syscon_led_probe(struct platform_device *pdev)
 
 	sled->map = map;
 
-	if (of_property_read_u32(np, "reg", &sled->offset) &&
-	    of_property_read_u32(np, "offset", &sled->offset))
+	if (device_property_read_u32(dev, "reg", &sled->offset) &&
+	    device_property_read_u32(dev, "offset", &sled->offset))
 		return -EINVAL;
-	if (of_property_read_u32(np, "mask", &sled->mask))
+	if (device_property_read_u32(dev, "mask", &sled->mask))
 		return -EINVAL;
 
-	init_data.fwnode = of_fwnode_handle(np);
+	init_data.fwnode = dev_fwnode(dev);
 
 	state = led_init_default_state_get(init_data.fwnode);
 	switch (state) {
-- 
2.55.0

