Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792593638;
	b=kGP5aUm6dt/3scaEkzE7Y6FtrgV/vlbSooL9Z5ojIKEk1JNQuhXMGNhA+t5r+YT5g+x/
	 ktLI5O9ePueJzK9vCd5KBK9GrwwSTuOd5xB3BCyUl2E+1DumzCRJ07dD8ZaE0H80fI20z
	 tZWyKgxcpSkVDx1dGpSvpABoQBzSjxBwes7sLGKgMMJZd6EhtJzITE2nlusnAHiYMsZTk
	 nvp+fqd/iuoGtPR+G8cxj7YVdkWg6pV2gWWOCjQxpzlZG3UaFCOriwxQCpQ/u/cUHEYXJ
	 k4UlTd5avA8T2iAz+P2fYpi1ZvGJZ+KV8LIQhB+bH32C66EeOJ/00tTdzjLHN3ulIhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792593638;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JC3s2BvnjO6vQTjfoPdPvCQ10NTn2kZauw9NyfW3CCg=;
	b=WZRNakqhEI8kh3IxnjU6TgjrJiueRHXwpu5FloA8pedxOBAUpSxOYNyeLGk4IsPrp+gT
	 I2HMc5lCeFTawYz2t6DifFbXg7tGD+iAdRfavOYjL3L8EYEenNOWIe1vMKrU2tM7bx/7j
	 I3JwEdMYrewaOQFISgsmsSjMRAItjrQc1ywJwsNtGjTmfaUN/zb1xOd+25bR7bt3kIC4E
	 rzq2LCUVgPiQnGyiEM8adMytHUA2fhCFxwtH3iS1NuXk4+M8whNP5tsX478AaojXPb+gF
	 BH9+4idWeQBTMHJyxIJSIDD2QkkiFHVjmLAkLGmzaPtxLInh69PE4TrHuxo5Le26pYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ob872DEf;
	arc=none smtp.remote-ip=209.85.208.172
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AE0606A31E
	for <linux-leds@vger.kernel.org>; Wed, 21 Oct 2026 14:40:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45AE0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ob872DEf
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3a595487d43so6887171fa.3
        for <linux-leds@vger.kernel.org>; Wed, 21 Oct 2026 07:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792593636; x=1793198436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JC3s2BvnjO6vQTjfoPdPvCQ10NTn2kZauw9NyfW3CCg=;
        b=Ob872DEfECdrJK5rcadxSeTINa2R3SWYjAVksQcx6u8Y0WBhx6DD9Zg6jjBC9Nw8CI
         jTwxzV4diaMg1TmE31UYlW3jQzImoeLgRbu8BoKoShkPwswRHP9/a22GUcPq3OXY1Ajc
         VqwSmPTfE3WzPO+jDE38J3B7w5Ejh2qv9ekiAqomoCG8hEsLXD1vkyhLMdDT5sCe1ast
         j7ouDyrB4GOphshdOqtB6MKyhR1CoCWbiD2a6rchLomtwTeRqNpPeoAcxWZ7jS927InK
         9ccycYhNXxgBB2pD5TWTFbqzHseH4abOHhPNhRYymBUa3d45TcN4cbVa3p7OKBZrnje0
         NLqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792593636; x=1793198436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JC3s2BvnjO6vQTjfoPdPvCQ10NTn2kZauw9NyfW3CCg=;
        b=c7KEEDr5XZclt0fJnVgSJxaalSeeAnjYaLsCXxx1LRlxqvu6jTyw6KndtiChzHK9h5
         yAnmkjFGBf6h66drxijB1RfyRGRrf37r1o+4ahd/9WOHnisF9UcaMsOagOQgvTQgB8jq
         MaZVGw9uk6YXW/VsmhNAlWL4Rko8PcVc0atP1LY8daYSpRW7J1YYH835Ze6Elx1UblJA
         qu3gkZdrZl5drziFGp7jlKSHMxdy9KNHy7tbQJeN/ZrJH6VSe+VohiXXjvsJVNLTzt/u
         8DCswYf6V36GOs1VcoakWTqQayJ9jwnwovz9KHe4yexXt5XKF6fQEsnJN6bOasi9rVN2
         xw8g==
X-Forwarded-Encrypted: i=1; AKwUvBzGDxMq2bGStoBAzFaFEmrbobMN+eVe2FH5ogUQbCMduDURZTzVoXuoxpCyLq4a0g5QfRpxHaeh7lpP@vger.kernel.org
X-Gm-Message-State: AFq9FYLjkW+h2/oeh2Fvu+GaCuVzUwp/4HiKbir9A+QYx5euApVQHZJS
	96Rh9kKrEMoJrOaaUxoyUhyTQDEDCE6btArFjJVb2Tp9WeQi0ola3Tme
X-Gm-Gg: AYBFou2iKSvTi0b1Z1CiecUjYwJwvIguhiPMrvctY5oOqnxaQEg+6gwxT85tpRQzFJW
	aUriT9gXDVOU/KEldjncI683tm8ohGIqecdC+1wpfVjgIzBA97uxmLzGPVaZoEjxDlc2Nbjupim
	WKrUjs+zRlsMCKw7i35QZefeal9WoZ+1ayaupmUGgYlKB3fPflT6LP1j9UD0SJM0kWgCxvjZdoq
	g3kMFn96RUssT7Xt4zLrZZ+sd2hItY2KFJYFUxmZHGCrJ+3Vv6hmO9rc0e0Kmss8VgSsM0DsTEG
	BNXKwnOCRTQw94uDjRQliW4OuykIS4JtwfT07Hrt9k/TG3kuTClscooUPZ6dVsGhmcUYmD2q5Qt
	qVO3uMTw6vkuwWMaq2w4CXSj5e8lKnczoRKu/UxxU1Vl8xuBoS3NBYI3f6j2l1RjW9BTdT5I/9+
	gatIUcedQ+fO2X09AAN8PJ2pDzo9UmkokZNAT3TZA0tq7iGkcn5O7CVqtbzX6vSvUwqng01+aN+
	60a22EpWUYVTB8pvKkc+KB9ZhuC6qnCsti3udHYGMz7LIMAASAGag2PtrlP20V/EC9RTWs/gg==
X-Received: by 2002:a05:651c:150a:b0:3a8:bd3d:549a with SMTP id 38308e7fff4ca-3ac44145e40mr6460711fa.7.1792593636213;
        Wed, 21 Oct 2026 07:40:36 -0700 (PDT)
Received: from quietus.tail91f8a6.ts.net ([94.126.152.114])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac4f563bf7sm358271fa.18.2026.10.21.07.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 07:40:35 -0700 (PDT)
From: Ruslan Koreev <koreev.r@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Rillian Grant <rillian.grant@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/4] leds: flash: lm3643: Describe the LED on the Lenovo ThinkPad X9-15 Gen 1
Date: Wed, 21 Oct 2026 17:40:34 +0300
Message-ID: <20261021144034.1636708-1-koreev.r@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <179198409516.839288.2293417415100693160@kernel.org>
References: <20261011191026.149338-1-rillian.grant@gmail.com> <20261011191026.149338-5-rillian.grant@gmail.com> <179198409516.839288.2293417415100693160@kernel.org>
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

We can share the board-description code in ipu-bridge and add flash-leds,
as Sakari and Andy suggested, while keeping per-board current settings.

Lenovo's packages set IRFlashLedIntensity=30 for the X1 [1] and 40 for
the X9 [2]. With both outputs using the same current setting, these
convert to nominal totals of 467350 uA and 608050 uA respectively. The
X9 result matches Rillian's trace; the X1 result is from static analysis,
with live Windows behavior still unverified.

My earlier claim that Windows applies a fixed configuration to any
LM3643 was too broad: the sensor configuration affects the current request.

Both default paths configure a 400 ms controller timeout. Actual mode,
pulse duration and continuous-torch limits remain unverified, so these
are candidate operating settings rather than established LED limits.

Rillian, could you share the relevant SPB trace, including mode, current
and timeout writes, together with the installed driver version?

[1] https://download.lenovo.com/pccbbs/mobiles/n4oce17w.html
[2] https://download.lenovo.com/pccbbs/mobiles/n4cim20w.html

Ruslan
