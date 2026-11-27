Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.160.73.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795810617;
	b=bAVDBplQZtFgz3uybbwSc7sASIH0VDsIJnnwTSgViafeSSPnIEnQaZqn4Tz/1C4Gjp+g
	 XEdjBb7Fjj+DxEMgOhbhC0htwH6KyX52CpsN0DUSRG6Mo9R7qF3pcpOhgbADznO93sN4C
	 n5ycfaF19BZaoa9CcR3IeCEgUpcrbq1dTj2bR6W/VGESuanGUbjsqH15sEfTeM5rKdGI5
	 CuO2m35me3ucg43JC/AlBLLjI77pmdBaAqiav0ARx8KPBOGYGlCdAnP8kEw02kKw6kR4z
	 NJUSmOx2Jhn5dhfBUdel+pVBNmZHpbz1wdY/HF79dJZ04xILulOyi9ospNeHLXCvIqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795810617;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=RtbLAM89d2dB9De8r1I/XQmNGdhkH6iDFjH+hgQCrmI=;
	b=bF6Gzygo5mdCDsUwDj98+4PBxvpbQAiz+qTjrINqFMpRakc4sECXR3PBCggFhu9oZBiu
	 U3KrcEnx0bDnVUdg9IdSkaMuaQq3xD7FaDOsrmfc+Pb9GDPwEkHDzj1Ja7qi+Sqt1RqDx
	 1euWHJZWWeCFl74z5ADqXFbU7ZmJMy4p+1s8MXsiO1Wle0x9hweEfu8HaeKUiIPEWj5bk
	 cVh1KJUIeay61JDRv64H0s5YKjrfAMiuqj/hpLCDupRX5daeeNr0c7Z/GZrYCa3yJz6jT
	 w+UKAPpu5vQ3iVNzEuBJALzuC10csgTDhF5j/LY4r3w9rGS+tkazYsFzMT3Q82k6MiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=blala.de;
	spf=pass smtp.mailfrom=blala.de;
	arc=none smtp.remote-ip=213.160.73.65
Received: from vs81.iboxed.net (vs10.datenmanufaktur-hosting.net [213.160.73.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E936606A334;
	Fri, 27 Nov 2026 20:16:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E936606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blala.de
Received: from blala.de (localhost [127.0.0.1])
	by vs81.iboxed.net (8.18.1/8.18.1/Debian-6) with ESMTP id 6ARKGSbM026982;
	Fri, 27 Nov 2026 20:16:28 GMT
Received: (from akurz@localhost)
	by blala.de (8.18.1/8.18.1/Submit) id 6ARKGRfp026979;
	Fri, 27 Nov 2026 20:16:27 GMT
From: Alexander Kurz <akurz@blala.de>
To: linux-leds@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Griffin Kroah-Hartman <griffin@kroah.com>,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bjorn Helgaas <bhelgaas@google.com>, linux-kernel@vger.kernel.org,
        Alexander Kurz <akurz@blala.de>
Subject: [PATCH v4 0/2] Modernize and fix mc13xxx-led driver
Date: Fri, 27 Nov 2026 20:16:24 +0000
Message-ID: <20261127201626.26970-1-akurz@blala.de>
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
Changes in v4:
- Fix typo in commit message (Sashiko)
- Rebase to for-leds-next (Lee)
- Link to v3: https://lore.kernel.org/all/20261122170615.31710-1-akurz@blala.de/

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
  leds: leds-mc13783: Enable driver for deferred probe

 drivers/leds/leds-mc13783.c | 37 +++++++++++++++----------------------
 1 file changed, 15 insertions(+), 22 deletions(-)

-- 
2.39.5

