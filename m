Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.160.73.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795332765;
	b=yqJaJFZ9Gvjk81kLCb3uqCijCLE5Lo5wgAlGm4MOrH3TRMrY8EPbv5eyzK5meGzRBRXg
	 VOCwR/skcnpnRCNdAq1tuczcXTvW8Rmul976VkaFEeaF0h4iwDdHsJD026GKCYuCZt4vm
	 smPsZBxYygrQd0YMjR11wJpJbXuEWGR+/a0ygm+Dy6ZaR1FTnhaeeT8ScjevgW/BujiCj
	 Tv/XLkpN+VIf8yh290UqrWo1OQZvlT1kbDoC+OOjBRRc+Y6yJO0g6y30CSRlI1pEL2w33
	 5UMnwNC3ORtCBzPbDeSLP+/1bGovsot6Vfn9KnG60mmMxbGvU7Td6yY4MZxP5hwgdHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795332765;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=1GlOYy/m9dn/m9HYrjkQJet6n6eNt2FMyzlGN1t3OVo=;
	b=JYVdeu1pl4BPyPeezCkTblJCgdh0bqF/+PfzeE9X0grICYtXB//SaMR/ZUewWfDrdd6T
	 OBRK4JAh3S8GulwhVrA8evQqYuk/NDnsV1X1YEzg1XPX8TiirR5ND718ZQcCxaCWvYWyk
	 o7+qIH9B+GC/pqwCnov3ZaRQOE+8+9DlOiIKuejjVGFsY6/les/H+c+XBEzfAuLi1+Cm3
	 n/XRdNqr+YFQfG7Jct+ICCE2Aqa1w+lU5K+e4XmEHJGzwJWlL1HmwbhX2otVss1VYunPX
	 /lH44uLn7p130p9f4ETMos6SzHNkjwbbRC9+8u7+nrnL4Dr63XifR5fznOh+dtpt2cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=blala.de;
	spf=pass smtp.mailfrom=blala.de;
	arc=none smtp.remote-ip=213.160.73.65
Received: from vs81.iboxed.net (vs10.datenmanufaktur-hosting.net [213.160.73.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C46E606A320;
	Sun, 22 Nov 2026 07:32:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C46E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blala.de
Received: from blala.de (localhost [127.0.0.1])
	by vs81.iboxed.net (8.18.1/8.18.1/Debian-6) with ESMTP id 6AM7Wb7l026717;
	Sun, 22 Nov 2026 07:32:37 GMT
Received: (from akurz@localhost)
	by blala.de (8.18.1/8.18.1/Submit) id 6AM7WbRs026716;
	Sun, 22 Nov 2026 07:32:37 GMT
From: Alexander Kurz <akurz@blala.de>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Griffin Kroah-Hartman <griffin@kroah.com>
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bjorn Helgaas <bhelgaas@google.com>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, Alexander Kurz <akurz@blala.de>
Subject: [PATCH v2 0/2] modernize and fix mc13xxx-led driver
Date: Sun, 22 Nov 2026 07:32:33 +0000
Message-ID: <20261122073235.26707-1-akurz@blala.de>
X-Mailer: git-send-email 2.47.3
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

Main goal of this series is a fix enabling deferred probing of the
mc13xxx-led driver. The previous implementation has been dependent
on the MFD instance being present first and which has been changed
by commit 78efa53e715e ("leds: Init leds class earlier"), breaking
functionality. While working on it, replace the OF-specific API
with the newerunified device property API.

Signed-off-by: Alexander Kurz <akurz@blala.de>
---
Changes in v2:
- removed unintended change of property "led-control" (Sashiko)

Alexander Kurz (2):
  leds: leds-mc13783: use unified device property API
  leds: leds-mc13783: enable driver for deferred probe

 drivers/leds/leds-mc13783.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

-- 
2.39.5

