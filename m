Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E2928E0F
	for <linux-leds@vger.kernel.org>; Tue, 15 Sep 2026 02:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789437970; cv=none; b=GLmchJ3aXZ/ifpHlbOfk5qjyql5xn2WFIil30fkRYYATtZj1Y1fydweyqMD0OlSNzkrA0k4GkUclqK6HQnVfmKquVH2nqMHv4wwgn95eREcuqVnY6w57Q9oWaYLvPNws4XI43TVr7QfHGiYbBH51l+0uTrLr94n+AvxKDwQowQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789437970; c=relaxed/simple;
	bh=IsSRvZpTd2ytDnUVH/h7zanvLZg8RPBZ5DIYyIFl5Uk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ptnyqyK0w3wfruOF0dQhwN8i1sDD1ueZAdQSIJpELixcPqvNmDczQSWDnSaZlzpv8NZOu0e8r8aeUUdiw3hPdqbx/jJjcPZAEIvY0FP5zpx/WsSRdAC0sIAfuL24YiJekLR3Am2MvBr/UGC9jfluqiLiQlEg3UiHTJi1UN0NiZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WCA7DhpJ; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WCA7DhpJ"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb76bcb1fso34400201cf.0
        for <linux-leds@vger.kernel.org>; Mon, 14 Sep 2026 19:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789437968; x=1790042768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ad5dKOxCgmzRzr/3vr0OMGOG7uBSvPVGD8Z4whsnBTA=;
        b=WCA7DhpJ8TJeP9pmUDreN7hK6JZCADnfkhjgBPZ1ijFQXHog4DZyhPyc2+eVrQXmSg
         JTGDE5PlvHpRwK3MG1n9Cm2/Y0b2Kh+w//ukPWR4zLbTxb8eEQt0mKwYc3hUdWnpqhp6
         Y6PM0mfsjfptUlyhd98y4zIp1zGngPuwVy9oiJAEDOK1PNybUZAi3sW2eonQJTiOuo5f
         QleQOK2Wk7Hv3l2NMkNxXtoLmlsI0/3Ouv/uKNrfEPR+2jCdy6mls9HneZZJp0j+m0uP
         fHP6BLs9hPTQD2WI9tajwUF/BbSL66CJ+VX4dKbtl4xLQg27RZQCgZ+iwV7mDoJwCrpa
         z1VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789437968; x=1790042768;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ad5dKOxCgmzRzr/3vr0OMGOG7uBSvPVGD8Z4whsnBTA=;
        b=sjyqznZ2LMd2LL8yN6RJY32wLaQmL2KHK6t22RK4N/fTBhYsaiiSsR/DryQyxWyeku
         pu+KNOavvhWQvIuPBoFHUKuOkUZrm/0H4b1v/F6+/mxEU3xSPUgHiKVLAndBdQ31C8SF
         sU5sr/TNqCeMU5PVXQjmTo2Yldv2qQO0ZJfWuGKvK1W9EMQtBX0cHig7VBFShO7TpmSq
         PwPijRPZr9VHWloz3fUL1GY1Zr3hQgbYpLbXZf8nm/m9OuSyjW8DbyfJaJ+0qVpQoFr0
         6liKwEgl7mlWwupDSEJFbHBTOWh/A8I1adi61kU36y2Joc2gx2rdG7auqwexHuQSasbq
         q4tQ==
X-Forwarded-Encrypted: i=1; AKwUvBzeqe0PZgYSROcRRWNf7pMzuhOF15f3/VZedHuVWTnV2QjikrWLeQDcuEbA1jrZETXoaoB8p/GOz2GG@vger.kernel.org
X-Gm-Message-State: AFuF++m016Yr4sV2EujvwN302SLUrQ2HWfZjDZKoiuevKEflB5RPHLpF
	y/6pFSIpMPY1NAecPsLxCwadnyaqYL/Ie7HVLCSZ2gs0qt5LFkpWhf0=
X-Gm-Gg: AYBFou2rCv3z2mkjWxcaBNh00nFU1wk7FDivoKJKNxpR/S4UZa1LALhCoaIFY3I788p
	5HxsAAD7RjcUv9DdVS5rTIPAozTYL1WZupMXS1PjlMz4Jqe8xxPU3ZV+QdK5KuTzbQFqAJfWeCi
	+C1IBonEuYHZRuJz47D6Om8oBsQzTj5+u1AVY6hrAwU8SIXghu+I09MpXMuRTy1mMxCwc4qeFOG
	PbBfaAx6RZDq+cZg+nFuoeXUtquif13sCbqunVjjhO/4n/3EPo/zofqqKaqzPeba7nN0URPEUEB
	kNauybxDWRUtc2cCRis3Xb3yGp+CdM2Ynkv7e8ggDPNwC8J/BhkcNfUqnNL5RCSbgqy2xOizwaZ
	MzKc4yARo48W/65XOIRmHtAgDgLg0l/4qpYdjQU+F6VOjsOOBgdmtnn/jXyn/gpUfMhr6LI4vO9
	XO2henz+GWAT8ghYIiUfDCwdyTpcF3RbcP1hXwthNR+38AgIbnMymGn22FTstNTbk8goZ40735/
	4iEHuoqXuDAIf3wOTK/QEeMCqaAwxzk2OgRbAKd19iNlX/57pVvwrd6uCJd68Ikd6EmMG3EaoDG
	mSR4rq1aYofGF+iaKWH59rygYUuLO/WtOmFcevev7zgld+fYotT3f2PVsay/vzXxR6+lIw==
X-Received: by 2002:ac8:7f81:0:b0:531:179e:ea4e with SMTP id d75a77b69052e-531179eee80mr50338711cf.31.1789437968264;
        Mon, 14 Sep 2026 19:06:08 -0700 (PDT)
Received: from 6e-wmo5420-02.ad.psu.edu.net (6e-wmo5420-02.ad.psu.edu. [104.39.213.233])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f45cb06sm109618956d6.11.2026.09.14.19.06.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Sep 2026 19:06:07 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Jan-Simon Moeller <jansimon.moeller@gmx.de>
Cc: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] leds: blinkm: Remove sysfs group on allocation failure
Date: Mon, 14 Sep 2026 22:06:00 -0400
Message-ID: <20260915020600.91955-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

register_multicolor() returns on allocation failure without removing the
sysfs group created by blinkm_probe(). Remove it on this path, matching
the helper's existing LED registration error cleanup.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: 56e8c56c9af0 ("leds: Add multicolor support to BlinkM LED driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/leds/leds-blinkm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-blinkm.c b/drivers/leds/leds-blinkm.c
--- a/drivers/leds/leds-blinkm.c
+++ b/drivers/leds/leds-blinkm.c
@@ -691,8 +691,10 @@ static int register_multicolor(struct i2c_client *client, struct blinkm_data *da
 
 	mc_led_info = devm_kcalloc(&client->dev, NUM_LEDS, sizeof(*mc_led_info),
 					GFP_KERNEL);
-	if (!mc_led_info)
+	if (!mc_led_info) {
+		sysfs_remove_group(&client->dev.kobj, &blinkm_group);
 		return -ENOMEM;
+	}
 
 	mc_led_info[RED].color_index = LED_COLOR_ID_RED;
 	mc_led_info[GREEN].color_index = LED_COLOR_ID_GREEN;
