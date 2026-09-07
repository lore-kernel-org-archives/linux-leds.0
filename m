Received: from mta0.migadu.com (out-124.mta0.migadu.com [91.218.175.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8C33859FD
	for <linux-leds@vger.kernel.org>; Mon,  7 Sep 2026 23:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788824909; cv=none; b=SyMSntCNsPN1eTunuiCHAsawbd1rBdtgV2hDB8izb2OuPJ7DKjY/8Jnmc6VBIrMxJxbOfslTy8/X7chxCMr4HTlbJsOx+vH3zYsu29IGcWps+IKl4jxucDgTd3Y09dHu0/kl6T+1u5qMP9sfe2iiqi+nY0sunn4+YSmj3k/JCpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788824909; c=relaxed/simple;
	bh=vW7rPPQqumnFHjXcWTkfgFPNXjjOAjMWusBJNRgLTqc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rSqVbTGbVBYthvT15pwD3m0vTd7CuYUFPPBZcr85dyCtSD1MASFf2nGyhW5n5hZWyAhg52C6qr6j+ot6KuSmj8YEdmoQgY9EknMtdKbkqbWNWdygFxo5lv54QVQ8ORzK3sY7HJHpaY26sMzg8/dkjphcnQXe5ZAYbOwLmmAgw1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=cAS0W4JD; arc=none smtp.client-ip=91.218.175.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="cAS0W4JD"
X-Envelope-To: linux-leds@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=vW7rPPQqumnFHjXcWTkfgFPNXjjOAjMWusBJNRgLTqc=;
 c=simple/simple; d=postmarketos.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788824904; v=1; x=1789429704;
 b=cAS0W4JDLeR5rhn6x6ZCV9dyfE+shh5Er/Xdm5W8WLfLbau+IgcHZiTUj1aD7HEZQmZWCNjs
 hLvuz2cXMRLLtJTwhnq2SGKOYMwbBRVsbQm4JSIqOkc0qP7HirpOAkuRJt8nf5hYFpdX+nRsurQ
 tW9guXjgw2bL5yf2PnsTK7MQmlzCLHSx6S/kt4tv6x6jLnkK7JByixW0z1sqtx89UVu68sUWhiF
 BRrXcOHzNifpfWJyxAAT1LYnHpGGZzuXQZi0zrhAEBjNq0bfWMm2daS1ngI5AXnJZXDUjDTt6Gv
 3ZC8Zzh2xYti8UZmUhfYwvUMyFajZAxUL5Ca0vAMjJ9YA==
X-Envelope-To: linux-leds@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 00e855a07b206fdc;
	Mon, 07 Sep 2026 23:48:14 +0000
X-Mizu-Trace-ID: 00e855a07b206fdc
X-Migadu-Flow: FLOW_OUT
From: Paul Sajna <sajattack@postmarketos.org>
Subject: [PATCH RFC 0/3] leds: aw2013: Rename aw2013 to aw20xx and add
 AW2027 support
Date: Mon, 07 Sep 2026 16:47:50 -0700
Message-Id: <20260907-aw2013-aw20xx-rename-v1-0-c9a7df12a701@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSwNz3cRyIwNDYzBVUaFblJqXmJuqm5JmZGycbGppZJhspgTUWlCUmpZ
 ZATY2WinIzVkptrYWAHYE5aRrAAAA
X-Change-ID: 20260907-aw2013-aw20xx-rename-df233c5921c6
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nikita Travkin <nikitos.tr@gmail.com>, 
 Alexey Min <alexeymin@minlexx.ru>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Paul Sajna <sajattack@postmarketos.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788824891; l=1972;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=vW7rPPQqumnFHjXcWTkfgFPNXjjOAjMWusBJNRgLTqc=;
 b=G4LWjebJjLJT8yNX+hq8FWoRthMiEwakQH80OFpUkQIRTzc5Y8U/iv4M6MVA4tQYf8Nzw0n2C
 xLqV1hJwSbuAoHCrNqWDPd+KXF/S4MzsmKXvcxXHmqxrVjzo6zJCkD5
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=

Requesting feedback on this approach of adding additional chip support
to leds-aw2013. 

It comes with some downsides, such as the rename
introducing Kconfig option and module-name incompatibilities. 

Additionally, there may be easy confusion between the pre-existing 
aw200xx and the proposed aw20xx, differing only by plus-or-minus 
a zero.

However, given this approach in aw200xx, I think aw20xx can follow
suit in a similar fashion. The 20xx series chips are all similar 
3-channel LED drivers, see the driver commit for a comparison link.

Lastly, I noticed this driver does not have an entry in the MAINTAINERS
file. Let me know if that needs updating and how please.

My working tree is also available on GitHub if you prefer that interface for
any reason: https://github.com/sajattack/sdm660-linux/commits/b4/aw2013-aw20xx-rename/

This RFC resulted out of discussions pertaining to
sdm660-mainline/linux, a close-to-mainline fork for Qualcomm Snapdragon 660
devices, specifically for the BlackBerry KEY2 Keyboard Backlight,
in the following GitHub PR: https://github.com/sdm660-mainline/linux/pull/218

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
Paul Sajna (3):
      dt-bindings: leds: aw2013: Add aw2027 compatible and rename to aw20xx
      leds: aw2013: Rename to aw20xx
      leds: aw2013: Add AW2027 support and rename to aw20xx

 .../leds/{leds-aw2013.yaml => leds-aw20xx.yaml}    |  10 +-
 drivers/leds/Kconfig                               |  14 +-
 drivers/leds/Makefile                              |   2 +-
 drivers/leds/leds-aw2013.c                         | 441 -----------------
 drivers/leds/leds-aw20xx.c                         | 525 +++++++++++++++++++++
 5 files changed, 541 insertions(+), 451 deletions(-)
---
base-commit: 944a035ecca915ae947905dcfb03f2b9dc6d032c
change-id: 20260907-aw2013-aw20xx-rename-df233c5921c6

Best regards,
-- 
Paul Sajna <sajattack@postmarketos.org>

