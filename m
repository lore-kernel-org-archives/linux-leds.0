Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3672F7F01;
	Fri, 16 Oct 2026 10:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792145115; cv=none; b=iKuOgM66uBxisRhkq9zGBS6WZ+XchTUnJqJ1DLqf4ijMwoAQ5YPzfBJUxERU0Aikqlu10eLb7v6WFXh3xFfdpWaS9BMV8cdxqL7EDc5PCEfFxkyz0Aru2CGB0h3Q8jRGrUYp2ZLA6PIScABEH2nWp2VxjxpBedroeZ8qgYyJ+7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792145115; c=relaxed/simple;
	bh=CqBvM/AXogvrufs8sWxvD7c3UiarnKOmk/rrJGTdF2A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=quCiQ8rUsyGIs7HVK5Nu1Zg4++tx1Jn1sbi1gZ0nGbrK8oV6L0YIhhdmRNYdt82RmcQWqlc3j07HrdjaixuwvMNipiozEUhEl/WWWl3qZgcvS+Xnd1GAy9hcTYFsPSkHaDVd2Rq8SzghTthVE+1Ig5my8zNn7DeuymgVaUURBGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=TBylhj3L; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="TBylhj3L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=74
	JzXrDW0j6GdutimLDXQZzHxh2RkaeDShqkvOmCgHU=; b=TBylhj3LgGwwIxGJ/y
	iPg6bRhqvm2XW0ebjR0PWkHSdhMo3nBTeM+gO2B2/w8nKAgZREniOlRNTNQif6Tk
	XOLv2VIdAzEw/yl8vAebmDscRlfvy/9B3r1QlNojyjbz3FV16VeIYt5fXb2lkUqp
	Ia3maOvKYi+1ML7Ql9ZGGh2ZI=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD332+29tFqQfLjAA--.14422S4;
	Fri, 16 Oct 2026 18:04:49 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 2/2] leds: cr0014114: queue recount work on freezable workqueue
Date: Fri, 16 Oct 2026 18:04:35 +0800
Message-Id: <20261016100435.2581303-3-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261016100435.2581303-1-yaojiale02@163.com>
References: <20261016100435.2581303-1-yaojiale02@163.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD332+29tFqQfLjAA--.14422S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cw17Aw18ZFyDGrW8GFW8tFb_yoW8GF4UpF
	ZxCFyYkay5tayxt34ktF47Xa45uan2krW5KFW8C345Ar4kZw18Z348GrW5JFs8Jryvy3W5
	uFWUXryxZF1jvaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zizwZ7UUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzQH8N2rR9sF45wAA3U

The firmware workaround periodically recounts the LED state by issuing
SPI transfers. Its delayed work runs on the non-freezable system
workqueue and can therefore access the controller after it has been
suspended.

Queue the recount work on system_freezable_wq so hardware access is
deferred until devices have resumed.

Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/leds/leds-cr0014114.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-cr0014114.c b/drivers/leds/leds-cr0014114.c
index 3f6931ae0bcc..afe3730e1222 100644
--- a/drivers/leds/leds-cr0014114.c
+++ b/drivers/leds/leds-cr0014114.c
@@ -155,7 +155,8 @@ static void cr0014114_recount_work(struct work_struct *work)
 	if (ret)
 		dev_warn(priv->dev, "sync of LEDs failed %d\n", ret);
 
-	schedule_delayed_work(&priv->work, CR_RECOUNT_DELAY);
+	queue_delayed_work(system_freezable_wq, &priv->work,
+			   CR_RECOUNT_DELAY);
 }
 
 static int cr0014114_set_sync(struct led_classdev *ldev,
@@ -256,7 +257,8 @@ static int cr0014114_probe(struct spi_device *spi)
 		return ret;
 
 	/* setup recount work to workaround buggy firmware */
-	schedule_delayed_work(&priv->work, CR_RECOUNT_DELAY);
+	queue_delayed_work(system_freezable_wq, &priv->work,
+			   CR_RECOUNT_DELAY);
 
 	spi_set_drvdata(spi, priv);
 
-- 
2.34.1

