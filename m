Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.70.183.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793022959;
	b=Voh5nyBglO1eI29NWwZNkYmCWggJFI14exWdZB/nS9l2zSSXl0ldNPpKccDbGCy894rq
	 yUwSt5FKChMSsQdTmhJkkd33SuMQ2jcer+u/2D2/cbDzbahcVDQN/EuQlICH/KXu/uglM
	 YOSNK3sDTFx7MOK8XvvmJjfI8LLiGUudMNulM9fn2bKl2akBE/T8kXyNJwFGUMJw1k3Us
	 g78VcjbgM6fyvIygL0qeDB7guloCI7Bw5j/PGZaScADpo49FHE420AqlEsOOZHtGVaG1V
	 +gbk6mIfFvakJwnPA9dcQnJ1qB3taROAX4wbLfzkdbiD6kraJ9nS5Wq9JSJ0xLwmg6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793022959;
	h=DMARC-Filter:Received:DKIM-Signature:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-GND-Sasl:X-GND-Cause:X-GND-State:
	 X-GND-Score;
	bh=RzewzaoS8R3h+8E5N8/B+hljWlCwiywqyur7ETFsqgw=;
	b=I2wqG5dXEM1Yl16mx3PQ6BpkcuEKZUevbiiv25C2Fb6wXfzImEjTSHakAbQWLrlttLaJ
	 nDMbsbTLgA7cTe2D7SNiU7GXpqZTDcGRG48aQowmk7/jCtk/OacShfOwhRMUWmSUHVvL8
	 lj1dbPNDzysdk/fhwYHPYWBXzlTv28qtZaqf0Tk5J47XkeyqUpnu6UGn+VQWS1e9gCYix
	 3USarNPINqVeQEDWQ7VyhTQF1Zoh7GwEtHC05K06wnmbH5/DvVTcooQcj2/RHLgREkXqI
	 oYfzUdv1UKmIlwk6bE1jaVI7ZhDEpOVAX0YB2Fxb6OXF95ozXD5Xiw2loLBYy0Ta2bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=marmottus.net;
	spf=pass smtp.mailfrom=marmottus.net;
	dkim=pass header.d=marmottus.net header.i=@marmottus.net header.a=rsa-sha256 header.s=gm1 header.b="i/h/pdWa";
	arc=none smtp.remote-ip=217.70.183.197
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B6C606A31D;
	Mon, 26 Oct 2026 13:55:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4B6C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marmottus.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marmottus.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=marmottus.net header.i=@marmottus.net header.a=rsa-sha256 header.s=gm1 header.b=i/h/pdWa
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3B63E3ED0D;
	Mon, 26 Oct 2026 13:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marmottus.net;
	s=gm1; t=1793022950;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RzewzaoS8R3h+8E5N8/B+hljWlCwiywqyur7ETFsqgw=;
	b=i/h/pdWa3wedYsHD3HCheJpjBZoMWkFvNlAcbMmo8eLQwaFww3c0IDAIY0OFp7fv2Ume0O
	rUYBtITXZcv0rfLEksvDJnm2AE3z+ksI9EueGoCd+M2punLw6Fj5BnVnbDLk7eS+UVjHoT
	qIylxO+F2ksbM+Muyp4gB5rn4rBCs5W7KaPug3WJ6EV6uxTKnOIiZ3hOAzzmlw8Dmj3WJV
	4uFsf8XNF/SykMR1R3W0nRzFBDSwSa3BCwC6WmmC4xftc0yHiqhWUAwNQoTJQew7IoZZer
	w+TToUx684Ad3uEwIBsjMT5iE0P5LtvuXSGlcggax6VX+AmUHxxDHFv+zKRegA==
From: Arthur Crepin Leblond <arthur@marmottus.net>
Subject: [PATCH 0/3] leds: lp55xx: Fix the LP5569 LED mapping table
 placement
Date: Mon, 26 Oct 2026 14:55:38 +0100
Message-Id: <20261026-lp55xx-v1-0-6eaaf530115c@marmottus.net>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANpb32oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDINbNKTA1rajQNUxKSTJKtkyxSEs2VAIqLihKTcusABsUHQvhF5cmZaU
 ml4B0K9XWAgCsV8OCagAAAA==
X-Change-ID: 20261026-lp55xx-1bdb2c9d8fc1
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Griffin Kroah-Hartman <griffin@kroah.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Arthur Crepin Leblond <arthur@marmottus.net>
X-Mailer: b4 0.15.2
X-GND-Sasl: arthur@marmottus.net
X-GND-Cause: dmFkZTE1nVrkfQSyaayXhMQVPQw67+fDjJSQbYs9I9CSfh1rXKefsadGJK/PWxfHzcAyialiLP7u0aPPimuGkSw+YXAquRqPwAXLPccJEtD4J4M7l+Es04Tlt0myLakbCA8w2r0RgD0FbONAYvCvBq5kM96EOr73m7xZMuhdHsivy3dpurlUpcdSCfBHxKqksxUzyky8rRKxJDPBsGELc9LTZx8MAK3pKQAMYFFuBR4Yy93vvR5d1CuHaYVzoqdVeHA9UjNgKIPrO1sAy/fPr6778u1LdVu8JWaaDwAaYvufu7tH7g2tbz1FqxxYe0+OaZJm7kvhDQYemONTDXufhOSEK7TcKqzxo1kh16KrVntjZFgN5Lr26TZ3KQ45c/2NXvetViGUnUe35hXsPqjlZxZ8xRekyh8WsOqMXFNgplL8DtIOw/7Q+xA4NO+XmPkiG+Urw1fb6nl0GxqhfLF5iUWr0xmPxtbxcr91uFDXGVkYWFOJr6vyf79G1UCQOEHPDByKHEYNb0K4r7WasYvqaE6jgfpvir7r3C5bzu9wcSvOnbh+WTMUrVAEfdU7yPukEny9gwGVX/dht71Y3/xsJimeqBiofJkvL+viEYrBGhQeQFw7z7L5hmG6r1FtgjicJrzeWzqV7oaC4iyNtqQLISXoMJoEoWBsud4nBwpYBdQFcv8BTA
X-GND-State: clean
X-GND-Score: -100

The LP5569 and LP5523 keep a per-engine LED mapping table in the SRAM.
The table is read by the engine's map_* instructions.

On LP5569, the instruction loads a table from a 7-bits absolute SRAM
address (0-127), therefore the mapping table address must be in the
lower-half of the SRAM.

This series makes the layout configurable and fixes the LP5569:

  - lp55xx: Add program and mux base pages to the device config
    - Add prog_page_base and mux_page_base to struct
      lp55xx_device_config and use them for the engine program pages
      and for the mapping tables written by the engineN_leds attribute.
    - lp5569/lp5523/lp8501: set values matching their current layout,
      so their behavior is unchanged.

  - lp5569: Place the LED mapping table in the lower half of the SRAM
    - Place the mapping table at pages 0-2 (address 0x00/0x10/0x20)
    - Place the engine programs at addresses 0x30/0x70/0xb0 (4 pages
      per engine)

Tested on a Raspberry Pi Zero 2W.

Arthur Crepin Leblond

Signed-off-by: Arthur Crepin Leblond <arthur@marmottus.net>
---
Arthur Crepin Leblond (3):
      leds: lp55xx: Add program and mux base pages to the device config
      leds: leds-lp5569: Place the LED mapping table in the lower half of the SRAM
      Documentation: leds: lp55xx: Add an LP5569 example

 Documentation/leds/leds-lp55xx.rst | 24 +++++++++++++++++
 drivers/leds/leds-lp5523.c         |  4 +++
 drivers/leds/leds-lp5569.c         | 53 ++++++++++++++++++++++++++------------
 drivers/leds/leds-lp55xx-common.c  | 14 +++++-----
 drivers/leds/leds-lp55xx-common.h  |  6 +++++
 drivers/leds/leds-lp8501.c         |  2 ++
 6 files changed, 80 insertions(+), 23 deletions(-)
---
base-commit: c190ff288cb5c09e1b30db9e51a11d979d27f5b9
change-id: 20261026-lp55xx-1bdb2c9d8fc1

