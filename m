Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B1347ACC6
	for <linux-leds@vger.kernel.org>; Mon, 14 Sep 2026 13:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789394256; cv=none; b=XFo4yAWRlvnLqNWV5Si0MC5UCl77FJT5a6opwNPh5m3YwfxUV3x7UcpcTlHdCybIrdtHWmFqyV+EHRPZyJ3IQ8HkW/uuIbDTpSw6G8pWkqR8K4iF53iOn7yHXc35G8/XSBw/BVKn0E2kRLdP48i9ftUkwNXXoY4Ky55qxByfy/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789394256; c=relaxed/simple;
	bh=4C8oUlW/K8pKlkOLxMwWsCa9VAC3cTK/vHmn35fjaPE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nrdjMOwrjEBGbuxZdbk1Hoh7Ga23I6mZUCFxoSAs+PEU8B6Vft94g0+ssiW3kNSvbFDCOZywBOq+l6Y4Mio+zElBz9+kvNWz7dqFZeAvGjOl7wnlerq2vSn4dDjYxr7oWBl8fRbkkFoNFlNomm7D3uLr0WU4186wgoQLJ2MHQBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c2utLZvu; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c2utLZvu"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2caced6038eso31392795ad.0
        for <linux-leds@vger.kernel.org>; Mon, 14 Sep 2026 06:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789394253; x=1789999053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qaak+sKiArxa7mKTlQvl1SbE11tdZGIRrd8OTw4JELM=;
        b=c2utLZvuS2Yyt/JHyr6bc9kW4ekQE2B3ViaOdP9gR100gAoCMVwd5152py2B+EKSjn
         lBYF29FRcg0kDNeQ+yCkmRMHF4N0HWfKxxAtH3TkM/w6dbuMmTFy9oS6c5qRzxQ+POMi
         ooBmxomaXFopx2xMv9v8lzvPTpPiRw8e/AGe2pNV2B/QFuymR+EbasQaF2NV2AddS4du
         SvPepfxWQjqgEBi/oL5myebi/d62aOcP96D6BC2xwsQXiLFYRR4+kC/pw0hvJbitOjoD
         pxGkLg7svnrUFJsTd6k+4MkKDdAh5LggEBR3TcTulFSg0PVWhTosbpgDwKz5SiZ2yrCu
         zfnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789394253; x=1789999053;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qaak+sKiArxa7mKTlQvl1SbE11tdZGIRrd8OTw4JELM=;
        b=WI68xh46i0Jzx4GPQTYUPHbDUkT7VRbvxauHcuBOIrJFwq+NgxWdcCJN8Q9oGyEat/
         vv6yjA9h9+7YmydqyJljQkFluGhkqzQxLKYiF8MY+b4zxrkzVb+rhTlMTLgWq+bKR92D
         e6odrpU9kKbUdjmVBROFAPRyt0adlAYDL70v2IPPsba8HIJ0rrZLb1gk0Ob1h85oVxN0
         1RRJbX/6Bn0giAn7ZNl0Xf4C1XGsW5oe8eZBgiIZzuq5MdFUboOi+DRDOidqwHeXCsAM
         1CreXLVq+4uLFznbRbTc6s5emKQ3s9es2STnJwQrTeNHuw5AHfS7j4HYtxvaOxmekZP8
         B1jQ==
X-Forwarded-Encrypted: i=1; AKwUvBxk5Zboh8efha9S6p8bWLfcXSy348E2chbU99CsKHCz0tqj1Zf8Us/yjXsMruxilMPjXiOpNsCaFr81@vger.kernel.org
X-Gm-Message-State: AFuF++kO/iG97k/vjEa61qa6MPdU7rCXuxSH/Ipwh7omDgpV/BHvhBRx
	x5CPYXli9sFvwLj8LmN5O/t3kq5RYCe9tLvvakV3JlA35yDoN06gY345
X-Gm-Gg: AYBFou2IyQ9n6DRg7Qn+C6KLJalK3lkhJ1/gdj8jOo2Py+3C9gtlxZcYPBkuI3PnbQ2
	O5IDqxQNsw674A+Vk1zs2Tt6rtk2nhsjMqMeIWJuc4yk71fOh5F4/6wY6IqgcZA6lsdglV5b6ph
	2szKIO/Jpnaihd3H+yCo6ZncvDx8x5kGYaaEtb6ys/xky9Trfes/T2S0E/aMH5/V/aZDqs873ZU
	ZgasyqqiT/jIhmKzV7E0rbF9x3LnVSOl0i8/w+cKhmxIOLcO2BlWjzn6O24KlLUUptVd0iNmePu
	0vwtg23C2hZHFHYBNHUP2leAhfmfiPE3Tvdifp6+mkWLQjdYT+UJtRx37hoIRXy5y5MeJeKxB/e
	opLWube66IDost1Kly0gzysPD+XV+mrgysIRozlFKDXVqMdXaQVNc7CrHQrt1Y+JcGPy3hDf98F
	lRChtJTetfVcgwkLK+xGvKuefAVWGOkzKoIFwNjqGoccZWzM2IG3OAgg==
X-Received: by 2002:a17:902:8d8e:b0:2dd:6a63:4476 with SMTP id d9443c01a7336-2dd6a6344c1mr28308675ad.10.1789394253055;
        Mon, 14 Sep 2026 06:57:33 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cff297esm49156425ad.73.2026.09.14.06.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:57:32 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Luca Weiss <luca@lucaweiss.eu>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] leds: flash: sgm3140: fix child node reference leak
Date: Mon, 14 Sep 2026 21:57:23 +0800
Message-ID: <20260914135723.1741327-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sgm3140_probe() obtains a reference to the LED child node with
device_get_next_child_node(). The probe error path correctly drops this
reference with fwnode_handle_put(), but the successful probe path
returns without releasing it.

v4l2_flash_init() takes its own reference to the supplied fwnode and
v4l2_flash_release() drops that reference during device removal.
Therefore, the reference acquired by sgm3140_probe() is only needed
during probe and can be released once initialization has completed.

Drop the child node reference before returning successfully from probe.

This issue was found by manual code inspection.

Fixes: cef8ec8cbd21 ("leds: add sgm3140 driver")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/leds/flash/leds-sgm3140.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/flash/leds-sgm3140.c b/drivers/leds/flash/leds-sgm3140.c
index dc6840357370..51e31fdb78e5 100644
--- a/drivers/leds/flash/leds-sgm3140.c
+++ b/drivers/leds/flash/leds-sgm3140.c
@@ -273,7 +273,9 @@ static int sgm3140_probe(struct platform_device *pdev)
 		goto err;
 	}
 
-	return ret;
+	fwnode_handle_put(child_node);
+
+	return 0;
 
 err:
 	fwnode_handle_put(child_node);
-- 
2.43.0

