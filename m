Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB243346E58
	for <linux-leds@vger.kernel.org>; Mon,  7 Sep 2026 04:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788756883; cv=none; b=qiGR5Q9bTC76/Z5OrhIpqzD/bJAQ3jCRl3dqA2IA2EJFhJ0cK7u62wCMIDEKDSYm1QJWeThkE2uxCLFoV72pr0pZ/UtOP09+rAPprp7FMHEfaTLEYQ1xRVqnaRit3kh0gJa+ceXLwoRIB9vcABfDKXr7BhuDCzXJJJit+s5PBmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788756883; c=relaxed/simple;
	bh=nGLX54WD8ZYhwyYfjF+NbAYQqy/IWOhlM+QLKa4hUz0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PG2xWlV4+b3krtzT3PV0+kB3/87EWoi3oaEsXuD3/JN5GskrBAciEDM1dAxsvx/JQXnqAOSGk5jMApjMH4wVtA1vWrsM2BlWSSWlFGKNG+ud+ZxBnz1jyKkWGQLLtykextZqMUQwoRlVz9j9ZHoZ1QVFc0mnXJbDAkeENm1aNsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I2/54wA6; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I2/54wA6"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc1d57602e8so2759079a12.3
        for <linux-leds@vger.kernel.org>; Sun, 06 Sep 2026 21:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788756881; x=1789361681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+H6PCme+LwtltvMdPx7okQil/u953epHJoMAFnFvfvA=;
        b=I2/54wA6oB7qqEfNBCtUqeyMVqnmjFj+Jmg8oYx5HS3FZyhse00ea6VnfUdImwi7U1
         7F0vo2NPMsGgN/ZAbIAxmh3mw0SZehnW94lr9j8oDvtHz8nIz5E3dUNk1d6Wk/VIl9pM
         WsSWDHqdFDK/9UJmQ+DyjTNhkjkeL8XBokZJ02Z7VIyFGdPpSCQX31uW7LJGIyZ//RHF
         KhWEw+xbWtlC2gUP/VvT8nz3XQy38STV2Ikldxf/254e9T395gqWNGzHYAq8JUD6fBcO
         XdR0FlG+VPwwVgrBg9iQA1n/aSv+j4T4bY1kBSSKuReHt/jqleMh2VjE2RFyCgYhqBaZ
         XbNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788756881; x=1789361681;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+H6PCme+LwtltvMdPx7okQil/u953epHJoMAFnFvfvA=;
        b=tIVo1EjWa67wD9MUzDOliovXVTD6k9j7JP5FLbqQyGdnHA0Lo8iVf5HhOsf6kFdlpn
         AM+cTIdHcr1vk9MGs6Rc5RAlWQH3PYluamJYDT0nYB8Fru1H+oU+uKO6gcRI872JOKwj
         sSqs1FfLd7pLRSSEwDJT3ruWrxoX71hPt/MnuHLNVcStIP8L+7zZbmE7Jsh2pEmDJEQV
         K06xYnKuemEaya5xEVfTGzbNZTFQVTBw1+/pxvKvq6+g6s7h0DGd8AyjuGQJt+uUp2bD
         fwMtGQaxsKfoupJqN1DVbUWtPO9KZsJrpi1QktQ3YGbIcOiAZE/OAvgbr80DTH9fJC5c
         r2uQ==
X-Gm-Message-State: AFuF++lPRybh8S5MCMd/UczX2ZjWfBtClqAhhUxp9e1m1jrzwOaKD8SQ
	IfP71WZlg0ENjUNnvjjrWNoI5+zRbTxx4LjHCzZ47CYAtCzhuQ9ciZh4
X-Gm-Gg: AYBFou1u6O/v05+Cq4lXWi5+s5E92//gBGE3iPyo/iVHr3mAT7LQ6lAPKHUNYoq9Z9/
	YLFJTadR1Si3VYXk8EWh3IPbsnG6JKTPPT9If3g0MtWWaSGMa7wzpXWfMsq80nxgOKv1CBb4jOt
	inUXKKdvu759V3CXeYs9ZDWOGeGbJ8aSeCMEWD0HiGnjuEVH5NI1ge4HI07eQmt8JdeC+XBkx1A
	THHnUw2A03xguKqIALYrh9/fVtQ8Ycftq89qPwkoTjUvrqGKMCRMZVcfjKrSUcpqyV4+iWvs9e0
	2QFrcTovPJ2N/SS8M/FWhhFSUxzZeLclwROuKZkp+9wFXPM+brPe1w5TsHigd/d26rX5HEhKNF2
	PRs37P9wRH7n2ugqlHmoTdkOzSCow3zQVZLkq4tNYx3pOwLZDTB/tFIOu6j+S+alLZUwn3WO7BO
	mSdXjDZsMx5uAIu04ltbHwKaorkcIAlPIyXNhd4b0d+z9KnEt2/9PtbKIlJTQnvY07s6/3FbaBN
	CDpPuvcjm4IvQ==
X-Received: by 2002:a17:90b:2681:b0:38f:5801:dc0e with SMTP id 98e67ed59e1d1-39b261d52a4mr31580282a91.15.1788756881269;
        Sun, 06 Sep 2026 21:54:41 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243f780csm21933483c88.13.2026.09.06.21.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:54:40 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] leds: ss4200: Fix typo "retrive" in comment
Date: Mon,  7 Sep 2026 10:24:36 +0530
Message-ID: <20260907045436.18039-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "retrive" to "retrieve", reported by scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Only touches a comment, no
code changes.

Since v1 the subject carries the driver name and a capitalised
description, to match the LED subsystem convention.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/leds/leds-ss4200.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-ss4200.c b/drivers/leds/leds-ss4200.c
index f24ca75c7cb1..c782339b1330 100644
--- a/drivers/leds/leds-ss4200.c
+++ b/drivers/leds/leds-ss4200.c
@@ -339,7 +339,7 @@ static void ich7_lpc_cleanup(struct device *dev)
 
 /*
  * The OS has determined that the LPC of the Intel ICH7 Southbridge is present
- * so we can retrive the required operational information and prepare the GPIO.
+ * so we can retrieve the required operational information and prepare the GPIO.
  */
 static struct pci_dev *nas_gpio_pci_dev;
 static int ich7_lpc_probe(struct pci_dev *dev,
