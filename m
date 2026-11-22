Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.160.73.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795367199;
	b=ubkwpcX7wtjEurP8ErUdc9UUi2NJZr4/+kFi32XxeRmTMoVSMgl55lOqalaL61R/wa3E
	 vpuFf237Rh+E27+qEtkDQbN9p/gzeaekCmdfmWJJd6oaBWsewNIaJABYIb98P/Bi/qomK
	 Bo8xc+mG15zU7NdircPrqU1qfX1vxHeKxMUsklCvZptOSJyZD1WOx8RKw3SBZAi6GLMf+
	 08sFg3/GK5QQpPlo0L3/0ZNvDcsWIjNSMa6wCvT7qGrxADbQKmyrb4U6/tcDXIkL/7qQj
	 X1zb4HD+sX/7XJpBt15ZdD3wzyqkhARdmgCwB2tN10lRnFRq/bhyNmHvf329NhNeA4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795367199;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=FfHmFMyMuBMSGh5ipbDfDrzhC1+wmRWQuj/VGZ/eFrs=;
	b=VTm6v9ziIiUwxDv0/uwYAP+NSQLDilF8u3ppwA42Pcvna38mqimSCyg2gV4WFQ9DJBde
	 B4TvhDpfkipXVbHB1uYy9GqW3ooNgjuCIddCL6n2HlvninF2NgA6yXD1bW1UHLIsJVNd6
	 MC+JvXxZ0XUFLx78cUdN4hs95hEBYFPtemPlE/HGyhpSrVqC90AcNbJohi6BB74ncRy4s
	 pJcIcdleooIufp21R1Db0t+Y9eBnAcYocyRSZYrIzYh1swuIlTXD96o0BITHgQxxbgGQS
	 JVnPm2YAr2n0hfwtDtIb+rZkl8hPt1n79KMjh3SKf2KvTwz4Hyp0Oz5nbAVcYZ386Cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=blala.de;
	spf=pass smtp.mailfrom=blala.de;
	arc=none smtp.remote-ip=213.160.73.65
Received: from vs81.iboxed.net (vs10.datenmanufaktur-hosting.net [213.160.73.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E855606A332;
	Sun, 22 Nov 2026 17:06:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E855606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blala.de
Received: from blala.de (localhost [127.0.0.1])
	by vs81.iboxed.net (8.18.1/8.18.1/Debian-6) with ESMTP id 6AMH6HMM031720;
	Sun, 22 Nov 2026 17:06:17 GMT
Received: (from akurz@localhost)
	by blala.de (8.18.1/8.18.1/Submit) id 6AMH6Gra031719;
	Sun, 22 Nov 2026 17:06:16 GMT
From: Alexander Kurz <akurz@blala.de>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Griffin Kroah-Hartman <griffin@kroah.com>
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bjorn Helgaas <bhelgaas@google.com>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, Alexander Kurz <akurz@blala.de>
Subject: [PATCH v3 0/2] modernize and fix mc13xxx-led driver
Date: Sun, 22 Nov 2026 17:06:13 +0000
Message-ID: <20261122170615.31710-1-akurz@blala.de>
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
Changes in v3:
- use dev_fwnode() to check parent availability, replacing dev_of_node().
  (Sashiko)
- drop CONFIG_OF guard around mc13xxx_led_probe_dt() as all used. (Sashiko)
  implementations should be safe for compilation with CONFIG_OF=n now.
- Link to v2: https://lore.kernel.org/all/20261122073235.26707-1-akurz@blala.de/

Changes in v2:
- removed unintended change of property "led-control" (Sashiko)
- Link to v1: https://lore.kernel.org/all/20261121074239.8745-1-akurz@blala.de/

Alexander Kurz (2):
  leds: mc13783: Use unified device property API
  leds: leds-mc13783: enable driver for deferred probe

 drivers/leds/leds-mc13783.c | 37 +++++++++++++++----------------------
 1 file changed, 15 insertions(+), 22 deletions(-)

-- 
2.39.5

