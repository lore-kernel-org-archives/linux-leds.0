Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795695925;
	b=tkHEC7wXN6kZ7oWqBXzg2n8GiHl6hb8XVrPkykCABll3cjPhCbFXfK3KXgcydo1r6DMk
	 x6ChSiGGboQV8eDcdrWiKv0Z5YoZnxh673VgsFe2Ea1YGPm4dI2/2St2Fy3kN5fFVQkhC
	 YXirdVAgi8WHEPfxuhPJDMLSCwMaMJXaoWLhwOaz+Mpml4wttVEc51L77JmQ/Gzf4aXGt
	 jIi/yjUCHYlOuR5086ZPTjQNjkaHv+nl1d8u1i8afl420xOzB7RLX6jRFnHrotXP8vdNV
	 olvFO6PDSx0XVF79+as62xOSIrThon1r1yaaQTQ1QUga+S68WijHjixIj4PBswtULXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795695925;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jY4prrYeethbYwaEBl7NR0t0hneBzAAuf7VOXeQQ51w=;
	b=UIcY2v4B/7cpmfo0TniRzMuNTEwYdO4/VbMNH+G301KFKQlte15PL/ySnt1IwtXiNUVb
	 wPZcfHoXiAxz5ZGYP8jl3B67F+8IAuBeJmxJ7x9s+KrnRsVK33bdVSSkGnUId47FI2FZb
	 7tp2X8H/N+dWL5YY6uCIvw41A4OjGBBll2oeaGfIjXAgE/Owk8HScVomPiWGvknMcKCXL
	 QTenXy3Cbs0l7Fq/AjqV/A2u+0O8hMFnnzZI0zTMM3LcoxNdmuK3zgDkrUWPufVpRgGIc
	 lcDbUdTPzGQP0S5GLws86CFZp3r5s5m+isq0TEctFggoQsZFxXCoQRYit4heQIciY6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lHf7RVFo;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373FC606A323
	for <linux-leds@vger.kernel.org>; Thu, 26 Nov 2026 12:25:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 373FC606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lHf7RVFo
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1b5786e099cso5558649c88.0
        for <linux-leds@vger.kernel.org>; Thu, 26 Nov 2026 04:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795695923; x=1796300723; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jY4prrYeethbYwaEBl7NR0t0hneBzAAuf7VOXeQQ51w=;
        b=lHf7RVFojmOgsrIajjyLVRsOtNP3nHqiq6msIxIVQ8vR+xObUBpNW8eEgQKeBAAHdR
         oJaX0XJ2daoPYg5iWTrQ6Lxn6R0AphDdXK8prZw5OE9+r43bWVpd807tNc101RyDimRD
         dW4JataDYh4NE8Y+wyumVQp9maAD5n6QBJbmbPbMb/3UHvZF5iQZAVgLGJJaNTxkeyN0
         UYIJbaOpreLyc30zHwhFt10JBHhM7qt9+4jEkt3ai9gpi38UUEUSM+z8GBjTvLUmwngZ
         gubu+PaKNn2281w8Aoyei7jbkSIp7rDE6dwUAk0anbCWXbOq75+0VENbfPEagZ8q/9lc
         pV5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795695923; x=1796300723;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jY4prrYeethbYwaEBl7NR0t0hneBzAAuf7VOXeQQ51w=;
        b=rtEvB6UhKASbDxBuHSbiUmd63WJgOuXTD/xWa4W3nVCt7DxCWIB4R7fspBsKawndeW
         jmsS8TIKWyWdThwLAdiuAmywt2w5FoqExg4uqpUeSMMWvce+eBitZ/7sCPnl+1z1ax99
         SYb4fB0yRojKsFot3yFWCoatQ7cvBocBMGBiN9EQxJSJGtN/+I4A8iQrP8QeasIaErwI
         zIVaL07YE6VQCB7PGp5D3GhQcq1slFS8C5SnOCOw6x1QbWVcjrVTq4IXvkae4f8YgczC
         yQ4DhN9309/t1rNsS6Nuz9R+VyXO5Qh8XfmziJCJtyeSb9cXWvRep4IU0C7/s+dmXunn
         efvQ==
X-Forwarded-Encrypted: i=1; AL+hErFO/GK89ylAt1d1oE+KvMvtYmR76eOFpCW//Tj+pYSV+an0XrOdS6B96beT1Tdpaa9oTSgKBZRaVe1k@vger.kernel.org
X-Gm-Message-State: APuU4Z8+o0ZYt+dBXwq/hNZjIaJ36qkQogq6/A5WRsh5HPF+Lf7j8ri9
	bKy2UDMmomcmcCIWWmDqG5Skqc5W1mXmT28pCF34CdOOddq3JtOJ80IF
X-Gm-Gg: AZFdTZdHs0KkfAUvi5HWzG/n3g8Y/h2dR5iW9CjE0LPli3mvnEf4khF/mE5ioNKbUm6
	GaIsV1GpEp1YrxDmaoTw5CkXFMH4x+M3a7Lpe6wfCH4FFTeMp2E7e9EsdslzIXLKfQ/MfpBPIs8
	ni7ACPq0fs3kQB2//W368/djKqQusgx/ealqtUzUj3ee9AFOjqfsIuQoPAMRMCZ3j2VtnR7tNaY
	/5Nsdz1Zg17SagF8dsi6Uo/GSxbBHoZiRe9snM4mu/RFXzdHTa+qG48iUop74U+VYqF0T7Laa+c
	6EeAhfmY7kqxV+8mNIGwB5mHJ+Q0gPlgD3krtDRFZvQLz58StZotMYRstulAaJ/1GpRJGTCpPhu
	tMMm2sLZ5lBh3DTGcAhPy5AsecEJEu+42Wd4wFm6g3P7CB8rC/gGih5goh19iJ1Mzo1O1KtzaUc
	u3Ftr+5sT+AC9GUEPkHMKU6ZuUJ6SNFlZzJudJ02RlhoLPutbNE8l5JdWOketZJbaeM13dKSB78
	oVs6Hj44Do3gNL1/xdGDrj73ounuZR292Z8w71mRcdguhseVNSM6mEJCElvt64y8LBUQEfxTHTt
	15+LQCQAW4faGVPIo9Uu2+F8Rdlohk0vVhKgXAyTwva0ScFlLfz7VsoQUCucUeHjNuBI
X-Received: by 2002:a05:701a:8148:20b0:1b5:227:7d1f with SMTP id a92af1059eb24-1b55689eac0mr20511682c88.11.1795695923199;
        Thu, 26 Nov 2026 04:25:23 -0800 (PST)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5569bffd2sm45954449c88.0.2026.11.26.04.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 04:25:22 -0800 (PST)
From: Cong Nguyen <congnt264@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Luca Weiss <luca@lucaweiss.eu>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] leds: sgm3140: Put the child node reference on success
Date: Thu, 26 Nov 2026 19:25:16 +0700
Message-Id: <20261126122516.1198461-1-congnt264@gmail.com>
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

sgm3140_probe() gets the LED child node with device_get_next_child_node(),
which returns it with its reference count raised. The error path puts the
reference, but a successful probe returns before reaching that code, so the
reference is never dropped. The v4l2 flash sub-device takes its own
reference on the node, and the LED class device only stores the pointer,
so nothing else needs the probe's reference after probe returns.

Remove the early return so that success also goes through the common
exit that puts the reference, and rename the label to say what it does.
ret is 0 on that path.

Fixes: cef8ec8cbd21 ("leds: add sgm3140 driver")
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
Changes in v2:
- Use the common exit for the success path instead of a second
  fwnode_handle_put(), as suggested by Markus Elfring, and rename the
  label.

v1: https://lore.kernel.org/r/20261125134013.2692510-1-congnt264@gmail.com
---
 drivers/leds/flash/leds-sgm3140.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/flash/leds-sgm3140.c b/drivers/leds/flash/leds-sgm3140.c
index 107d02c3137f..e12f65d3e219 100644
--- a/drivers/leds/flash/leds-sgm3140.c
+++ b/drivers/leds/flash/leds-sgm3140.c
@@ -258,7 +258,7 @@ static int sgm3140_probe(struct platform_device *pdev)
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to register flash device: %d\n",
 			ret);
-		goto err;
+		goto out_put_node;
 	}
 
 	sgm3140_init_v4l2_flash_config(priv, &v4l2_sd_cfg);
@@ -270,12 +270,10 @@ static int sgm3140_probe(struct platform_device *pdev)
 					   &v4l2_sd_cfg);
 	if (IS_ERR(priv->v4l2_flash)) {
 		ret = PTR_ERR(priv->v4l2_flash);
-		goto err;
+		goto out_put_node;
 	}
 
-	return ret;
-
-err:
+out_put_node:
 	fwnode_handle_put(child_node);
 	return ret;
 }
-- 
2.25.1

