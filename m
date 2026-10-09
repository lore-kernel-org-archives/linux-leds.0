Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4F737F00D
	for <linux-leds@vger.kernel.org>; Fri,  9 Oct 2026 09:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791537077; cv=none; b=Xp9+B8hLTix6oSy1BRTKm3Vtk4h1DqLwR0cRPrfscdgAkKhJlbZyRKPWt9t6a2OP1H0rJmsVEFaIScGXY6drlQKFate0hwZM2v/ICyGQMUybAhjMer0blkNo2yTThOFF3cS42egSJOlP7u/SPfZLVXjtYYqB5XSTre2wdtERzmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791537077; c=relaxed/simple;
	bh=tBfBkIWljJahaYTO0anHftOa/Mal7hPXpw/F/dtZxT0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VJK91n/auHnEU+6MxJxLqPkf148vUjyefkJzRUuKkaFHqPfulp64FKaEZyHpFkqFpZMlpcxaxz/MhB3HsvFw0S615JMUE0innd4N7g3Inx0DnqKACcePnzXooy76m3LO/KPcF7urZ8EP5xj2m5wEXkSVz5WAwQrGAqDwVeiy7m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UpdYpg7U; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UpdYpg7U"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-141395927feso6532577c88.0
        for <linux-leds@vger.kernel.org>; Fri, 09 Oct 2026 02:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791537076; x=1792141876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oaT+zyiVDF+oO1apwHrrvZj9B+eawsITqiWBF5tkJHQ=;
        b=UpdYpg7UN+h24CathvVYDNLHYtq6tD+DtqREEiZTiQ4f4Snubry8dizzNgUQ/hv0NL
         Tlsya7wcE6IHsEKiKF5MszOpiPZEroMvDVZV3vDMDA/iEGqKL0x6+tQarvuJsnyUcvP7
         SmwRdgKtK73AiofHRGj3Da1PPusi8XJmNMxJzvZe/wnJMhtT0P6DLZRIOZMAMYmzCJkm
         RnyGJjP6keH4vMCd8SUZXufGCBo+yNgM0Y8DIuD9DHw05IjvvvMEBW9u0qhQEKs4YrJS
         zhwUMEs6VeJc97YQ8VcLR0DN+TGmUDAOqTKAn6uiCsvIiD5FBmrzx3wi0asts8faz2JH
         0cmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791537076; x=1792141876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oaT+zyiVDF+oO1apwHrrvZj9B+eawsITqiWBF5tkJHQ=;
        b=TewFSo6Frvnn/rjWTFa+Tp+fPF8RcWPuSqZKgOE9ZPca7tlqt+t9NVDGhHUblrcQvA
         h9uAS/jSnqL7iEGMqT4MVTEeTauJHX+HpCwkzNYEJMLU4+gx09YOnxS0vyG2ohBWn6SR
         y95UdzTVEZZ5ruGnfmxd6+imLBqPGZ4S5NY0parZRzMsOy+Mrpg3GuxqpOwD2k4LFPkY
         ytJbgSdjf7PZKT4wd0NfNrPDSzuyq3DuEomV/5en3wH2KO2EPll7PsGWHLuj8fsJFWI9
         3Vtkhztk3tvyTwOB/Og85LMu/tmLe2CturPn/GZAIc3LHWDLiOyIvcP1+O+Ub5KqCCnv
         aMMA==
X-Forwarded-Encrypted: i=1; AKwUvByhMJxQ6IkSyAq7JkSxffF050qyY1a2KutHDpLB3cWvkhxn+ufH/6gKLF/Wi8k0P5kpn2OgnQ+vrZNH@vger.kernel.org
X-Gm-Message-State: AFuF++k/kF2bvnug5C3Z+8rZaexTIirWM8gogDdQQ5Y+0jjzSNdwhLvp
	a0jR511YOXyx318MtgidqQb54yuGxsyexQ4yo970/fMJAVy7ZvE9120M
X-Gm-Gg: AYBFou1NeObf4WXkMQ9ozN8yMm1IWqKB+TlevgtvaX+BBivysxgBmJZtVTYGbp6e3oF
	gnSYoNtmoDwwsqoCmt3dNNJFxe5x9ePPiNWV32WzumwMMUACx6trO67St3MsLslk/bOrHXf5CJU
	tIm8NbZXdreg1e0r//hS9uv/EWIfrOF2nBFh1SHLy0KwQi9L5WMJwRlFW4W9joKqJ3lQpvlWylB
	xxmxT1Ij5iIvzH7mmd3nVgbIvDIs4rl8a5FWQKvOmEihGuW3U0fei3EBvLWeImP/oypsVGdE90s
	31DpZaSAdqCOHNy7SHwMenTMh6kcK73SZyTCTmtN0SEHMXxOPgtpc8ML9/GAWE5mFGLb6HFxw9p
	jf7aX7EmHorUpfvo9COgrkpWbQrXnzfRKmvUKOyP4YTkzdGOW/XE9kVHUh6AyNTOykyv82jICM7
	Q21C2ttKnx71JbUOMFJkU9G+MVtZmEErl3u7CkwZrrmzVK0evzjV2RzYr5gu23mf3l1GJiBORyj
	4KEBIKha8qOd/3/oCCM5QcTNzYcrNTiw8gggEcRN2QyJPbkr9k1eaFjUBM9nETmwr/gI8aA0uW7
	EYmxH1lm3mfLeE+EEL2drXLF
X-Received: by 2002:a05:7022:ea4d:b0:144:e38d:8e52 with SMTP id a92af1059eb24-16a60ce7512mr1263776c88.37.1791537075733;
        Fri, 09 Oct 2026 02:11:15 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a1becefdsm5125444c88.7.2026.10.09.02.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 02:11:15 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Dan Murphy <dmurphy@ti.com>,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 2/2] leds: lm3532: Avoid duplicate error messages
Date: Fri,  9 Oct 2026 16:10:59 +0700
Message-ID: <20261009091059.25729-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009091059.25729-1-phucduc.bui@gmail.com>
References: <20261009091059.25729-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Most error paths in lm3532_parse_node() already log errors. Add an
error message for the devm_add_action() failure and remove the
redundant error message from lm3532_probe() to avoid duplicate logs.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/leds/leds-lm3532.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/leds-lm3532.c b/drivers/leds/leds-lm3532.c
index a3bc9680dc4c..05856c053fac 100644
--- a/drivers/leds/leds-lm3532.c
+++ b/drivers/leds/leds-lm3532.c
@@ -566,7 +566,8 @@ static int lm3532_parse_node(struct lm3532_data *priv)
 	if (priv->enable_gpio) {
 		ret = devm_add_action(&priv->client->dev, gpio_set_low_action, priv);
 		if (ret)
-			return ret;
+			return dev_err_probe(&priv->client->dev, ret,
+					     "failed to add GPIO action\n");
 	}
 
 	priv->regulator = devm_regulator_get(&priv->client->dev, "vin");
@@ -708,10 +709,8 @@ static int lm3532_probe(struct i2c_client *client)
 	i2c_set_clientdata(client, drvdata);
 
 	ret = lm3532_parse_node(drvdata);
-	if (ret) {
-		dev_err(&client->dev, "Failed to parse node\n");
+	if (ret)
 		return ret;
-	}
 
 	return ret;
 }
-- 
2.43.0

