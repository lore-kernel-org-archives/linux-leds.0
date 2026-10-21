Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792558756;
	b=1huSJBlaxoTh+2JQFoVm/PFohCMdcUT9PjnRd/S090ancmfIKSCQ4apaFrEvyR90/+CS
	 v/FCyKmmUD0Gwbqg1cSlDJL3T0RstoIQbNbnqYA6duSPXCLedXLT3UFlqmydys7X9n9S4
	 v63BRgm2Br4fCftAos3+2Tl1TgcTsQzW99blLXy660T/BjhDYltFbx2vhnohNKDarYGL3
	 /B9Md03zHp2YQqk/Wc4s0wjHvkVpspY3bzyJCgsiMXdRXkOTXYEE8T2mLZglevMWJTyAJ
	 SsFY7uHzYayajYydqQTYzd6Mg0QFSlPoOiYZv3KryrDtA6BFGJNG4h2KhjNgGD5Ft9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792558756;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kGNdHjEa4vRNWwuyZwToyKUED19fBzxo8nKXU+sdJBU=;
	b=NyOLynXnKZBv1gF6gCf/roKdtg93JkEldA/KZ5UgCc/WqKcmn9IoiyUT18epQ8Q6Z1+i
	 IRXtqYTz9lNZST+M0pm91w6RGcrr6lVr2U0+NsAiJi7qkll3Uchx8tEsrjkCU0PEdqmfu
	 gZC119sLAzctnhTegkwR5A68hjNRZAqphhohTOmSzZ5YxqTbnYOLj4PADVz8Vp69S1NKz
	 RWMj0MS8w/ItxlEJ8plOgLQLEkNOHJpSdqY9irMe8b46ZuGF8Rx2UJZQrqeF0o62wwksi
	 LyqgSJ5z6SQvDGIevLC++7tBW+16RxP+EEz/z6YCfg6AJUUDD7VfvJuVMR0JljnOXmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=G1YzsQwR;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25260606A31D
	for <linux-leds@vger.kernel.org>; Wed, 21 Oct 2026 04:59:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25260606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=G1YzsQwR
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ac677668a9so329368a91.2
        for <linux-leds@vger.kernel.org>; Tue, 20 Oct 2026 21:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792558755; x=1793163555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kGNdHjEa4vRNWwuyZwToyKUED19fBzxo8nKXU+sdJBU=;
        b=G1YzsQwRcj2dAThCInl/b1U1xXwHSBgdUOLik6J/MxL1gHWp0lIXX8nvppqRum4FBz
         /ghmu4nRKCAnDSZJ+eR4JoWk+D4KN5la7SBdoiz44GXFsBHC5gbMisSiK6Mhh+HKkJF7
         RBKazmQWyehkcXUPItTT2h0vBxp9o++wq2Pr6SNogBw27gRCxLjtHyUtxyfhAZDmDf8a
         1kIrAC21jt/u2y3XyLju6FIVZUdcVNlZzgINVsLMie4DNbdbptwP+xdUlyPkH6wYHASY
         Q0Eox1O20ghiehe8viHL90lIpkcvvu4sCXSlcw7OAWJczt3PLrPB69wZwjl32DEX7ymc
         CxxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792558755; x=1793163555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kGNdHjEa4vRNWwuyZwToyKUED19fBzxo8nKXU+sdJBU=;
        b=SQZSPk6AHw4IdqWcxFx9bQ0uoi6hWmU2/bnjIfF8vOlCoRQyQ3aN4WVSNvYhXFBEeT
         eWTBxx0oW7UYsLLyApR+WOit4aWfxSdFoeJXcuGSt34A1sh4KAGJ4hbtIUoPPBSGALvt
         oYDAHB4eeSyZtXsV718YjzoW+iBmVoEL+ruAJhDd6tYk1XYxuh1Xx7S9Uo48GQqILa9V
         oOGqsr0dQ7pRYYXEXanvXU7DW9Fv88wMGjeY9ZW8aXu6j+m7ivDGdzh7L/U2ehQldm4r
         Ox3v47qhcPqAbRliYQgRc6M+rwLE+p9dRpncwcKjbPRzjChD+326Tg+kqlinOR5ATS8k
         MNDQ==
X-Forwarded-Encrypted: i=1; AKwUvBw1h9kuuNCTZw9awjX9AzG3Oo2/6gXZamLQ8EbLLn9mKXuooyfdNfus59P7Sm0lnUhmjIWNn6WsiDDw@vger.kernel.org
X-Gm-Message-State: AFq9FYKbO9M1lDI/qMTl/El3tomO2rDr1OIT0KKdAz3g4/T4m4SZg9Aq
	rPdJWHg91+JYnaynWYoMC6m2ZMgNE6oSqX+eek4jwh2IgRw+XilVZ3PF
X-Gm-Gg: AYBFou3bIKO8JHUTmMDDgLgW8TCFrTKKalY3w7ew6MMwwqwxy8QgMUrZY3TjOfxtTs2
	JKJyidGCt3x6+e0y9IpkYKWMSXvz4k7CygztqcEPiSWWsQA4oNaUglBliizW0NArmRI+hJAsNQc
	9yr4lVVzqBAqlkdNA9PnDTk80zLkfub7CYWgn6tTzBTXopE5vd86iZQNrjqlltRHF+eAQKNoOnp
	MqN125HDfitYyhLvL30QUPWgqajHoJWsLnttxSBG5mSiaHqwRVhCjh+5TDp9C5bO6xlZGPdN/OS
	QNk6iz1k9fzlRvbUvDYGy+O0vrHashwt7Dv+BpdFeFrAoYP1sTfj2JO9pPYPAhmDlm4wnfavCeZ
	UyJqnVhPnEo/G6DZC7EDEuZuRo5c8y35or0+7JKj+KUu4b55jtqslUsfg+QXebk0t4+w5Ybq6zY
	PahcQ4XNvWKlIrsRS5ZN3vc2DIcMEm5c5YuQXX44b2PJ/Ko4qJH6QUV7r6ytfLFWWu/r8EPC2IF
	uMB26OWfvKZ8ItlfI4UplHLSVjKURMSSuVAANedmP3nToPhPTwFL7xo0mnChX7zcQWi4W71/sOo
	gnG2n6Va6jjCRXmxqcKyWaAgS0OLcy8OTCpqYD98IDLOq2D5UBaXmJ85xLGTvl+YaCAxrM0=
X-Received: by 2002:a17:90a:d883:b0:3ac:17c:6e74 with SMTP id 98e67ed59e1d1-3ad86cc2074mr805091a91.53.1792558755404;
        Tue, 20 Oct 2026 21:59:15 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6a871dbb9sm313903a12.24.2026.10.20.21.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 21:59:14 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Dan Murphy <dmurphy@ti.com>,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 2/2] leds: lm3532: Avoid duplicate error messages
Date: Wed, 21 Oct 2026 11:58:32 +0700
Message-ID: <20261021045832.16356-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021045832.16356-1-phucduc.bui@gmail.com>
References: <20261021045832.16356-1-phucduc.bui@gmail.com>
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

From: bui duc phuc <phucduc.bui@gmail.com>

Most error paths in lm3532_parse_node() already log errors. Remove
the redundant error message from lm3532_probe() to avoid duplicate
logs.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Link v1 : 
https://lore.kernel.org/all/20261007104915.507801-1-phucduc.bui@gmail.com/
Link v2 : 
https://lore.kernel.org/all/20261009091059.25729-1-phucduc.bui@gmail.com/

Changes in v3:
 - Remove the error message for devm_add_action() failures.

 drivers/leds/leds-lm3532.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/leds/leds-lm3532.c b/drivers/leds/leds-lm3532.c
index a3bc9680dc4c..a050e4350bdb 100644
--- a/drivers/leds/leds-lm3532.c
+++ b/drivers/leds/leds-lm3532.c
@@ -708,10 +708,8 @@ static int lm3532_probe(struct i2c_client *client)
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

