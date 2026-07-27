Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16320355F49
	for <linux-leds@vger.kernel.org>; Mon, 27 Jul 2026 22:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785190574; cv=none; b=gw1d/OzQ8wnML7GfHDubAMc/1g8YPhW1X6OZHrFsW0GNFiwxsbjZQ4E57TDPJJpSV0TTyYSvLPjIlwoyP7HSWTvEPjYHvfyMjsmiLYEf4Su9mSZ4aET71OMbg9is3nPsle0lD34Gzb7bVR96aKKGmdHwTY86ctpDF/7rMicSp5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785190574; c=relaxed/simple;
	bh=BrI5qYQeuVyYMDgpJDgKzp0AaSS+LjrtEVsdPDeZSjc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UDw7641tCnWs/kVfa6MLLoG+MFM4uw6/0GuJUUJTn0doNrUwiCQoK3vEwSMEzvTa4OMrHiO3jVYfc6aY1A5Pav4XVy1m3Q5G+K1thhI1ABI9uqr04Uu9daGU8SWpb6LJxMtL44dNhkiaYLMMtU2VghqGjhEOaFyss/mTM5DJJr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=geFIzw9m; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="geFIzw9m"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-664b05d408bso2635099d50.1
        for <linux-leds@vger.kernel.org>; Mon, 27 Jul 2026 15:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785190572; x=1785795372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v6Lb6PXYoTo2SZV9e0RV4X1y8uZ6bVYYsgCt6gyZv5k=;
        b=geFIzw9mp7/fvsfFLvosDywqHuGABzXOgzZBhtt0gr7bTCw4z55k9CluBziFCJWblv
         /CX5slSJUKkXKGK1bQCLeo/Mv/g/pp05Dhm7A8HgEecdhrMjcrtrRHOXuhut01keXdrS
         +wO5ffA4D911iV+8nQ5flKyx31ZdFH5+AQNKsXePA+iWH9A5lMp+YTSSksTgWgQOK9YW
         hbgXOuAEUo1kP0g5bB0pw1JgQIfxbkwusPztKYyhq8AuSPdijO4ZKr6XlKOvly2VqDtu
         dDbhFpDR1hkwuoh9l1tsJr3+HomcPXlQeejp3djxaoubOklhv6r8Ax9jS7I3KRPAMaNy
         WjEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785190572; x=1785795372;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v6Lb6PXYoTo2SZV9e0RV4X1y8uZ6bVYYsgCt6gyZv5k=;
        b=jmkPHl5O54HMXOOjqqju81SC7Kht/21SapFrtKSIUHW6LBx+iuiH3xy/WgTnZdGYrU
         A6qGKa19Ge5hZv4oxC0oFKCnBKNzRYTmzT5aCBqmbuyvBoATK2lWReupjJn9VdCKlEHj
         umFd+zCuQK9Ho740HXMK07zj+RlX1/KUMHWkGhf4Bq8J6ZmvVpQppZLpAlrZcnO88Nps
         JDzInpTBCr7Q++XYYvpguFone5bJLKDC4xAMk3EGyp05no+uOf5dZ6jtRLLZ/n0Qfemv
         QxA2BjtjBkCYU+bEQJuzrKrq2C/yP2JmCyeePufAcYhqVIt1XNICD7fWfr9wnAMiP9Na
         M0bw==
X-Forwarded-Encrypted: i=1; AHgh+RoeWXhkRhHbbhDlOjN8E7pKyLVqQ51F5ybyTcyq9665n6/ULqPEYz2Kqx6fk0+KlEVTtbTGZj2pRmEy@vger.kernel.org
X-Gm-Message-State: AOJu0YwN1/E2FYuK4VezS9/cNjJNGaSQ/gsuiLvrAYgdnH0SmJLbyDX2
	znBaWpDjQzANuL8vtCt+j4G7VkoW4T0+aoJ6G0oKLBJOpwkvCc7+EtGTPZdISjul
X-Gm-Gg: AR+sD13zHtO/ABd908Pz9zVkxSvZBPZECoQbhz1GTr9WQkvPwOsnP6OMuMHV5e9mKA8
	cJhqXjSJRLgytu6Qo3LFKnQg4KJ5n2hY4yFaLDYxJK8MxcnuOlxRo7/BHfZRGPZhvEMbPJDe56b
	ynCobnwoQ6L0udb4BQ/ToTBuvav5FY9SqfsmBnnkQk32lFvyTpU6SwkD13WZ/znW7Ye+w1aXQc9
	rQ8CzBJsdbaikdPf5TucZFI+0d2uiwNXahmJ8c0XmzZzEO+PEZAevockK0nf6YVJeVqmbB4VF2J
	DwL+xn0xhdYTr6e2NIshovlDHbaby+vAxdVZZRBgYSQujP/8WtQ7mZIXKVX5S1j7tAiwMOiazBr
	ErQL5lvoFmI1Z6chLBJ9XHRV14ZtomRpCWo1cBy0aK2d5lJehCmxMxdwI4fH3jmd/7SDM9xzZad
	5ZzuREVkuCYBBX2raoosasDxnCno9Sg/UnjctJOApR96Cf0n0UyIxBN+0=
X-Received: by 2002:a53:d005:0:b0:668:52ec:f873 with SMTP id 956f58d0204a3-668c7c0ee01mr2745034d50.81.1785190572003;
        Mon, 27 Jul 2026 15:16:12 -0700 (PDT)
Received: from localhost.localdomain ([107.198.84.185])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-668c6d30094sm4053701d50.1.2026.07.27.15.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 15:16:11 -0700 (PDT)
From: Paul Sherman <shermanpauldylan@gmail.com>
To: lee@kernel.org,
	pavel@kernel.org
Cc: treding@nvidia.com,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paul Sherman <shermanpauldylan@gmail.com>
Subject: [PATCH] leds: trigger: cpu: use cpuhp_setup_state_nocalls() for large CPU counts
Date: Mon, 27 Jul 2026 15:16:06 -0700
Message-ID: <20260727221607.5216-1-shermanpauldylan@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ledtrig_cpu_init() uses cpuhp_setup_state() which invokes the startup
callback on every already-online CPU at registration time. On systems
with large CPU counts this serializes callbacks across all online CPUs,
causing boot delays proportional to the number of CPUs.

On a 64-hart RISC-V system this caused ledtrig_cpu_init() to consume
~250 seconds at boot. The same pathology affects any system using
cpuhp_setup_state() where one CPU is slow to acknowledge.

Use cpuhp_setup_state_nocalls() instead, which skips callbacks for
already-online CPUs at registration time. The trigger operates correctly
for future hotplug events regardless.

Tested-on: Milk-V Pioneer (SG2042, 64-hart RISC-V)
Cc: Thierry Reding <treding@nvidia.com>
Signed-off-by: Paul Sherman <shermanpauldylan@gmail.com>
---
 drivers/leds/trigger/ledtrig-cpu.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/trigger/ledtrig-cpu.c b/drivers/leds/trigger/ledtrig-cpu.c
index 679323c2ccda0..ce75d5f54684c 100644
--- a/drivers/leds/trigger/ledtrig-cpu.c
+++ b/drivers/leds/trigger/ledtrig-cpu.c
@@ -163,7 +163,15 @@ static int __init ledtrig_cpu_init(void)
 
 	register_syscore(&ledtrig_cpu_syscore);
 
-	ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "leds/trigger:starting",
+	/*
+	 * Use cpuhp_setup_state_nocalls() to avoid invoking ledtrig_online_cpu()
+	 * on every already-online CPU at registration time. On systems with large
+	 * CPU counts (e.g. 64-hart RISC-V) cpuhp_setup_state() would serialize
+	 * callbacks across all online CPUs, causing multi-hundred-second delays
+	 * during boot. The trigger operates correctly for future hotplug events
+	 * regardless.
+ 	 */
+	ret = cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN, "leds/trigger:starting",
 				ledtrig_online_cpu, ledtrig_prepare_down_cpu);
 	if (ret < 0)
 		pr_err("CPU hotplug notifier for ledtrig-cpu could not be registered: %d\n",
-- 
2.53.0

