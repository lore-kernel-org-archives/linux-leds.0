Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904682;
	b=YO82llXL0e4W8o3w3OgZwpMsyp4seguiHQKNzaPQga6hrtH01D8/3d9xhXup+YK/yLsi
	 02UfKTxtNZ/3xXy79Dx2edqCWNjgIasS0bZdfqval5LPiD17xH/soKk81K9cU6Rh9sbPp
	 ICcj5BglgeqFKK9eHayZ1JvHMryxCIuy49XdV3Zx2o5yfP0FlKCwde7nVkUs0vgYI8tdK
	 Jys+QgNWGS1DXFdu10JaDuAuDVaVMo4n7pFaBUyTxBxwym4e6zElKj+WQZl4S4LF656p0
	 UqmzX9LU/3rV4aDXprnAijNS3neqkN+/dPcGkNp+LMceBJGgJ2oT9+Kl2gwdNOkxapQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904682;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jnWVUTUnlmsJEpFB8nhtjDbr8Y+ZTWe/nqHnts4RQXs=;
	b=GsEt2nGVJiJ8wS5vNgI7YNkUNmATyg5kNDDxtIhTyaFFNazNcRg28BG2f/GxM9WZeXWR
	 Jyvjr5DEv5K+oDowdCM3+z/PIn7oyM8tMnJolV8auPJF/mfsGhQFYQl5oGyajasej46n6
	 fTKvIjSUdRvvISMK/PeApeFYcloj1Q9pLOniEaUmHpnlyb5ZLIIzBQSDXTazTolU6hdei
	 qiKIIBrbQ7nWMFkKaZArNIYo7xVn3LmoAdT4f1Z8UylQ1CDmAxvvTz7D9B2VzIBN+ivdJ
	 wI6wldDSOkZv4TDhjVdDtm31HJO8FCdjxEktElQ4NPzh4qHGK6AxKx4jfs8LCnDiT6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BAFE606A329
	for <linux-leds@vger.kernel.org>; Thu,  5 Nov 2026 18:51:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BAFE606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso17280775e9.1
        for <linux-leds@vger.kernel.org>; Thu, 05 Nov 2026 10:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904680; x=1794509480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jnWVUTUnlmsJEpFB8nhtjDbr8Y+ZTWe/nqHnts4RQXs=;
        b=X8eqe9u/Aq1FrN4sMxD/pefIzG+YXzeOqvrZ8COqfqapO8Q/M1H0Sj1aD0TqhpMLI2
         AmrBQacAjif6fdKpEU+BLEmLC+oewe604mdifwCPdOv8erlIeU5oNwnF3Iy9LL7J8sxq
         PlQgueiT1Olwo5efl/bu6lKuYT85HXTali5gc9szgbGNdqyUrkeDjRdP7E95sVtqCTQI
         VhOsWyufCye5KbdgYYFgpgWSlNKXELlW5y+xgS+Jikcq8fro9a4x/lZSZch5LBeP9NQn
         Jg1xlrjJKhFDmxd+OR1rys5baX34Jvcf5xBAagOLSWMOBBAGXDlgEIq9UvZKeNhb4woY
         BURg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904680; x=1794509480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jnWVUTUnlmsJEpFB8nhtjDbr8Y+ZTWe/nqHnts4RQXs=;
        b=fPp4vh/hTvLbgzkW/QGcdvpERTTM51xJHG72rJES3xrPDYWfnDnjh/KuVs0YCRgiDz
         LTnl3BEbkPt4W8rPMvp5Xd3oLtUnr8KcjCvTllx+EwnnCKpo2xkn+wzq08WKOFJtQWVq
         DnZO85/aB8ymdFAR4vZvMANG5+4C3ASrjZGPNcIbeJ3KCHcOaM7zrJxkOly/IYF/oBUr
         bsH37WTVGa0IICy4c3a+UfkuHBQG4Gao6KzM2cj3iiGmX3ysF9IQqULV8PlfMkbjm0CZ
         HHSIk1VUpyoS1VcYDVw6FKOYGEXWoHburLvH415OJJHkXySO04qFk4cCpwiVWNlfO2DJ
         sx9w==
X-Forwarded-Encrypted: i=1; AKwUvBz3WcPIpBiTY4gTrGUsm/w9migx31tjp/AzcewzWZvUyKn50b3f1Unx7L1whMZ9ZSdHE0WEqmLHl+tm@vger.kernel.org
X-Gm-Message-State: APuU4Z9E+uns4rzYeMnJCzkfsPrGT9ah2CZORJ0vR8JwSaFo+ebgxCEt
	dfX4q/8Ycni53EesrfrFSEJurp+067d2gvqNJ1KwtagEbhQix5v63EIl
X-Gm-Gg: AYBFou29iyYJTMWBfYlHCfblj0CRKP2QXjq9if5HQQGSegl9f0OU+7ZssIOrU4daULT
	6dYie8HsO2CaNCQ557zHeRBaio3+RKanwEnH1bBapnJzlZ79jbhWD9a4biYHpCGnAJ4+QzoWUkw
	5hBXI9FhuG7S2JT6EU/lu7b8Ghd9elZJJxd5F6uc8z50kxbZ97lS4icvpzujfFNlTEiLbVVAplQ
	GCf40DlHX4mUfDSqOwD2keixUtLiC8lfTtK62QN3hdpStclXHQVXbAnJj3B4pwIaSzuLEhmjJh5
	g4lGAg+ZJiXDSxqwg6abBB+AngUXpbzDaY1NNFcwy4vpw7XQY4kwwUTYDzkQt2YEOkGOk4cToIR
	NbxYpfL1R3Jk+/8lLIrZTg6ulZHQcAYK1Cfz4iESayB9JwJ8Sm0cXMryKe3l1KS8AIKTHOSCpHu
	tbRFyovlOPYDvynIvQ9wLtbIkx1FvycI2XXUGAtQzhvy9F9BBTeU+AkMJNvjZfij3y17/MIcuFP
	QqcmzseeiSNHXfH/9We05IP61IxkO8QA+YuNuU8J9K6cYptVfSrSgG4fR2J9AmEdEz5itRpyRuX
	NRQWLymmFluWAj9CDviPKdhAnZGmVaRs0ixoobu2i94tNbHHde6skYN8sKfkWNIJyW8amXRNTu/
	NMx2fMLDV1eHmG8n1qSJPWdgi4dlC0A9dboLbPpMgm2YMQHHl7PROgEuxz7uYR1Cbt3+dYOSjOp
	FEZDtkanqi8rcuexEM0trAG2iPEMJXha/hH/qNiDrdRRsFSdXpWYzMLyEP32ij7UvRAPISw1c/n
	nc=
X-Received: by 2002:a05:600c:46c8:b0:4a3:59c9:a744 with SMTP id 5b1f17b1804b1-4b6dd82aa22mr395975e9.7.1793904680202;
        Thu, 05 Nov 2026 10:51:20 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-88bf-3a8a-f542-868c.ipv6.o2.cz. [2a00:1028:8388:a84e:88bf:3a8a:f542:868c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56e2ae72dsm137150875e9.3.2026.11.05.10.51.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 05 Nov 2026 10:51:19 -0800 (PST)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
	=?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Rong Zhang <i@rong.moe>,
	=?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-api@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] leds: turris-1x: Add support for CZ.NIC Turris 1.x LEDs
Date: Thu,  5 Nov 2026 19:51:17 +0100
Message-ID: <20261105185117.83189-1-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104150229.GA1650678@google.com>
References: <20261104150229.GA1650678@google.com>
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

Hi Lee,

Thanks. v5 incorporates your style and driver name changes,
dev_ext_attribute, and the layout of brightness_set(). It also drops
led->on and the fixup. All includes are used, and string.h is new.

The global brightness files stay. Generic brightness is per LED, while
this is a single CPLD dimmer for the whole panel, similar to
device/brightness on Omnia. The level files expose the eight steps of
its button.

The reset flag also stays. The LED core reads LED_RETAIN_AT_SHUTDOWN
only during unregister and calls led_classdev_suspend() only on PM
suspend. At reboot, software triggers therefore keep writing after
.shutdown. Unregistering the LEDs in .shutdown, as leds-sun50i-a100
does, would also work. Let me know if you prefer that approach.

The devm ordering stays as well. A failed probe unwinds like an unbind,
with the LEDs released before the reset.

v5 also preserves a dim level set before activating the hardware
trigger, including across a colour change underneath it. This follows
the behaviour of leds-turris-omnia, which I used as the implementation
pattern.

Finally, scripts/checkpatch.pl reports only the 75-character warning
from your list on the mails I sent. It is on a URL line in the cover
letter.

Josef
