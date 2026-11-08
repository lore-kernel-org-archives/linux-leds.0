Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794150859;
	b=MbRbqkoRrzFD5Lh3/Rc/+Y5GTBepQRLIgjRdbscbXbJ29AlH+/Ym8xG+G7wkf0HsjK9k
	 e+hMMLBq5zIgO7ME34WDeqOgiHXM2gGLvxvy60CAFWbRLOOoemYVMRZBKEhcKralj3iSW
	 3lExKEhkYrjkedj/5M//hpr8hFDDxjyqFP5wOGbNcCc7dKAwbzO7cGdMZ5Is0Vh26SrZy
	 TEokwQRRGoT0wGHm6PSVJ+sUDAGyKfMDsgS5HcRq14NaMLDU4ZqjWeGYtIsNZ22o1n+5M
	 yxcG1BtckOS5alUTiK//3yyorw/DKbBGkmZtEvOV6amkVjVQRsCXzl950uozw4I+ptw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794150859;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+v214Dro7nadIKB3P9+8aKqFMugLXZGhMQ9khVmC52A=;
	b=itIR38HfZb4vbV+xEP2Zk7RmZUgh/JKzw16WaHlec0ZtsLyxfeZwmVbAekMxbT14bi8p
	 IUA94BtHXaKhi3PdggSZ16ExyDTnTCtMdefgP88MvRSgeUlPvwVoEmxZAMioM4NsdQL08
	 nUUXApwXaIyl0ukH9KM/jPccA0Q//sYLEhQbK2cIlUwAYoSy7Zxn+F/4YY9QWztscu/sc
	 yD+ZqqtNO8rwTVHbQa2q0SM0viLZp42pd/BukKCaX96RRdbsy6tMn7OOvKrEtY+6KHWWz
	 dGn8RtKUHEh+Oobvbe/GuE/iZyi2h+EOijTtxXMD9uZG4emEQkWIOCQycsoCwmzTg/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SLjObtj7;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B57D606A320
	for <linux-leds@vger.kernel.org>; Sun,  8 Nov 2026 15:14:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B57D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SLjObtj7
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4d5cb1b181so16356766b.3
        for <linux-leds@vger.kernel.org>; Sun, 08 Nov 2026 07:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794150857; x=1794755657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+v214Dro7nadIKB3P9+8aKqFMugLXZGhMQ9khVmC52A=;
        b=SLjObtj7/Fp3dgIFTi3UjH0YGrY2bxl4pTuH0ES0JMPioOhMehJAuxU6KqPLJjweYp
         6WTM/vrriAK4E2fiF3ofkeCOhGiN6VajHpw1aZ/5U8BsUEwmpPHqShyIIr4vHTF2olfc
         yN/LnftO/mctJttSbJRTqz1SnKaOGxdM7keXwkr2U1DhPZi6YeW/YfQQ3Sj+TnMzJ8Uu
         bgWu9G/IgcCTyg9lywM3vGYSZwVEDnDgZm1VayIYgfIkRhsLWkFF1LNkj8emLNA62KJh
         uzQaqif5d2aCHX3UFv/nVlIQSENYKqP1ozoEhNfhq73+Tz+C4Nlu46EQqfCptzX4uQ/J
         BAyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794150857; x=1794755657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+v214Dro7nadIKB3P9+8aKqFMugLXZGhMQ9khVmC52A=;
        b=dPAf1UwIPiX+SmePAW8sX4I+ZGM3j06RpuChqGlpqY6/x1Fhl8ZaeuX4AQYEReLrS2
         yF9LK9y0uB0LtCuvMEkFM42lSk+lRBCxjrkEyGRT1yznDIOojDZG4Fn62wmm9ZFw4JrZ
         YtFsO5MGUOotjpaC3tUxrtRlV9rHF6BFZ49DCbV+W8uHxgrsOMPq58QfKXGl462knME9
         R2A48I5qVbFkZzLyJs7lqsgR0IUjwVBgZ1A+Q3jcyzyBokXF/LIt4RzRbsQEK7TDSBDB
         M1g86kDS27nMRVG7bLaKyBeliPo4vNjZu1CEYUQSs+KEnBS2yCRVZOeN94KUKoxPgveI
         kMcw==
X-Forwarded-Encrypted: i=1; AL+hErGhvmBMk04Tg31VB8Jn4LasE3inLZ6BVhxkD0s8LiaLifs0tlDd1dQ0Yz89EAyXX5SMKyo58xufpVAT@vger.kernel.org
X-Gm-Message-State: APuU4Z++lfsIW5tGBASjO0IULbFZN0922FonSqG74D9yNHsVmuNg2fwb
	wMvAaj8abmYYcDIHOserLW++/9U90mp9Cs3DzlThlvKAPSa+9jvQP7Fe
X-Gm-Gg: AYBFou2Lln1f1MadQQT345835B0RNHs0TD0L5tvoCQU6+wOi1lVwqPICkcXQZjQ5c3Z
	H6TBI3BGivECDKcsmRENApAwllbyMgJe6U2BUJJkqx/ElPZ4WqvQT0Z5t8XZ/Skid3ojzRbj8fd
	0iH0PrdCaNWEChN6DvlKHbeJY5y+999YBWJ/9WXA4lSn3LCX6KwE/YPaf8Peuef318ubvOXkN7b
	DlBt6fmpyGVFVx2Zc76V+AnanqKNcRpQDLkmO4RX2Ipc4ozS+LSlL0N7XnuuJ91yUPqwu9O08L1
	gp878WplRszfq07EwqP5gMgrKdF+38QzLKnU5e4QIJgYGvyD786civhZHp0QEQMI5J/N8z3/Gb3
	xO+Bd+JjQ/14u3DX1nizT7CEqI3qmzRwhGuMA/EpMitcE7eLpV4QJ0C3VTwXTczAKTK//R/+nHg
	wdwKD3Pgu8DVXeG2vX5UxGMDDrhszxw9k+P7Lwkx4n3GFoK8Sqi/geryXwS6PdoV50NpCiz1xKT
	u8BuUlu8YPKM+zci77UXLTcHcLYTVKHcEC1wsjmp5n9dG/nDnnSoD3glGQig1ec9jPGqqmvE9Gw
	8dwGBTvf10w++veoDd0yhbtN+3MWSZWrDmf3C8hgjD9int2vhMzKwUAFQFmheH3g2pBcUzMsVWy
	CroG9dcx9aQ==
X-Received: by 2002:a17:906:7308:b0:c49:9632:9280 with SMTP id a640c23a62f3a-c4d6d8d6fbbmr119323666b.46.1794150857516;
        Sun, 08 Nov 2026 07:14:17 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a978892sm69689966b.58.2026.11.08.07.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 07:14:15 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v5 3/3] mfd: max8907: Add LED cell
Date: Sun,  8 Nov 2026 17:13:48 +0200
Message-ID: <20261108151348.204182-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261108151348.204182-1-clamor95@gmail.com>
References: <20261108151348.204182-1-clamor95@gmail.com>
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

Add the LED cell name to the list of MAX8907 cells.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/max8907.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index e282dd82ece69..826d7768fd8d0 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -20,6 +20,7 @@
 #include <linux/slab.h>
 
 static const struct mfd_cell max8907_cells[] = {
+	{ .name = "max8907-leds", },
 	{ .name = "max8907-regulator", },
 	{ .name = "max8907-rtc", },
 };
-- 
2.53.0

