Received: from smtp.smtpout.orange.fr (smtp-69.smtpout.orange.fr [80.12.242.69])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FAB03438A8;
	Sat, 20 Jun 2026 15:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781970887; cv=none; b=HHxLGW0yBKU1CNk1+v2KaqvUjcpvZVjnE41vMJVDK/ODZGpg8WlcM7wqANLZKJqSC7BK7jjp+/sz0qpDA8OSpyj/LsH4Oq8zcGNyNvGzjIbLbIso87mpWaukmNQO9ZFLwkPFZoMp1fVzg5Kuuwvs3u/CgkQLO3UIef/Hu4PPQXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781970887; c=relaxed/simple;
	bh=7tIj2xW0kosKmoTcSgo+1Azc36QEZJzTwF0ZXZUcJ1A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K1dJzcwhOluXiQRhIHuxyQNPdTBsyHNndeVx5cbRKo51pFHINbyLC6cVSnzpEPR5Fysb2xsFPoff9c0u6OKjPQ9urFK04b8s1T6le+9CA+r+pim+Na3nWpXiCbhjkHQoMgYZ2XId8tSjqSWodA1E7j97zrAtCQEFpxanNQWqVDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=Sto0fy4/; arc=none smtp.client-ip=80.12.242.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="Sto0fy4/"
Received: from fedora.home ([10.65.86.61])
	by smtp.orange.fr with ESMTP
	id ay0jwYCZ5Q7VLay0jw8mxZ; Sat, 20 Jun 2026 17:53:33 +0200
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPSA
	id ay0bwUj7kB0pEay0bwfDTU; Sat, 20 Jun 2026 17:53:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1781970806;
	bh=xX8dePqxT2OHQVyDVdmzeKFQf8N3OwaMA7ISaU6XSXM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Sto0fy4/R5Riz1fL+Vc7NVeJvenF1PwnSIHR5yEJogY7XAraHiIUlXEd0bwGaEc8u
	 bt0ESePL86akgOSdVGyjTErNJ+IF4qiZVHnKEQueTtjZ90HM5Fbd0RGF9mp2xliLZ8
	 hPHa0bq+rMv7YIXlVD5bGfaPrHCoGnwKWWg5cIvri0L4BNCb5nu8AE5zap8ukzxx3Y
	 nnli1pPLrGxBZIi3ejcE1L6DaBf4uPCK3GCd9NOf5YCjNXp4eq0ryhrN08xL0Dpx4h
	 xxpglt/LS0QosN81kv947L7pZMY5zI/GM1zoAFOrxUGGEajE4sIJg/ywoVgwIyNGjO
	 +DVjyiwypy6iQ==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 20 Jun 2026 17:53:26 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-leds@vger.kernel.org
Subject: [PATCH] leds: lp5860-spi: Fix an error handling path
Date: Sat, 20 Jun 2026 17:53:22 +0200
Message-ID: <311792e767ab803d4744bc26155e6dac253d9b45.1781970783.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If lp5860_device_init() fails, a missing mutex_destroy() should be called.

Use devm_mutex_init() instead of mutex_init() to fix it.
This also simplifies the remove function.

Fixes: f0a66563aa2d ("leds: Add support for TI LP5860 LED driver chip")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only
---
 drivers/leds/rgb/leds-lp5860-spi.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/rgb/leds-lp5860-spi.c b/drivers/leds/rgb/leds-lp5860-spi.c
index 5e0c44854a68..6bf6a625c28a 100644
--- a/drivers/leds/rgb/leds-lp5860-spi.c
+++ b/drivers/leds/rgb/leds-lp5860-spi.c
@@ -38,6 +38,7 @@ static int lp5860_probe(struct spi_device *spi)
 	struct device *dev = &spi->dev;
 	struct lp5860 *lp5860;
 	unsigned int multi_leds;
+	int ret;
 
 	multi_leds = device_get_child_node_count(dev);
 	if (!multi_leds) {
@@ -61,7 +62,10 @@ static int lp5860_probe(struct spi_device *spi)
 				     "Failed to initialise Regmap.\n");
 
 	lp5860->dev = dev;
-	mutex_init(&lp5860->lock);
+
+	ret = devm_mutex_init(dev, &lp5860->lock);
+	if (ret)
+		return ret;
 
 	spi_set_drvdata(spi, lp5860);
 
@@ -70,10 +74,6 @@ static int lp5860_probe(struct spi_device *spi)
 
 static void lp5860_remove(struct spi_device *spi)
 {
-	struct lp5860 *lp5860 = spi_get_drvdata(spi);
-
-	mutex_destroy(&lp5860->lock);
-
 	lp5860_device_remove(&spi->dev);
 }
 
-- 
2.54.0

