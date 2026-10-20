Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.136.64.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792500424;
	b=VULeKfhUezkxKYnh0ysVGJ5irZBnjS+D53MeaIz4WZt3UQJGXGSEOF7bLgyBXGyS8n+T
	 sZbFP0PN8vXXTM51+j+iSXkKg+LfaeguMmVsbnF0ecwMD5HM5EpQCwObSTEnUkZmWxxFA
	 ZC2ZWukw3Z1JBskteG91orulccNFDvwjr8lQ9LSD2Wym6CsXRnE2KCbn8pIPVDVRDg0sx
	 5deuZwN33sanqrhulNPewquLfAz1TrR3UEnAxDUJZMvdzVyeA7rgL9bfDdANzgZ2GIfvv
	 FEV/K0w9TEPI4u08FSXZBLLj8DOGveligN4JuzldclGKRVwynwjPNheuDMkneNzCPJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500424;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Flowmailer-Platform:Feedback-ID;
	bh=CN0dtFVmpDOGFXmF2YV+l5pk0MBZMY+XXE39oRFUnQs=;
	b=0DAwauPDk7puoRG7kqu99Caj1jdESOFMgXDa040eXDMhv/liRVa0F8WnJO0azMKXd5lE
	 W41muECcw6vqh1PfoNEaMjeYzHhDiEJk/Bj1/fr1soFg7DW2pZ7v2/nHEVprszHYj114S
	 1jaqd8nMOmaB7K9tsiyRJrtH6WzcP77dlfaZwh7YHtR39NjwtQNpm/ex+JE9sVeeTZAue
	 r/fIU2nm6F9j0TPwmRnEQ3sx53ZjhzGGnZBSfTHCC6PFZpfm4/K122A6EdXBMOcg3VeNy
	 nep9qaCu6tnbJhpYp28QGRcY1/9DYrNt2zohfSSTWC/hyxhbVM8AueRPIju+IzXdAJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siemens.com;
	spf=pass smtp.mailfrom=rts-flowmailer.siemens.com;
	dkim=pass header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.a=rsa-sha256 header.s=fm2 header.b=R4GAtmOQ;
	arc=none smtp.remote-ip=185.136.64.226
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A299606A32D
	for <linux-leds@vger.kernel.org>; Tue, 20 Oct 2026 12:47:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A299606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.a=rsa-sha256 header.s=fm2 header.b=R4GAtmOQ
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20261020124654fcec45189100020785
        for <linux-leds@vger.kernel.org>;
        Tue, 20 Oct 2026 14:46:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=CN0dtFVmpDOGFXmF2YV+l5pk0MBZMY+XXE39oRFUnQs=;
 b=R4GAtmOQIooqPO3ObyGmpj/ByBKJELHW9cHIb7n3I1sT29fn8As9z9+PcUIGLCljk2Ge2/
 NSadxiE/kmRiGXX+sikRQE8bW5U7yi/G+QhpEjCaPg4ej3CxYeyTw4jm62FDc0ZQYvXTJaKb
 Qe6F3kn3Zo1DwVP4tlulpyRY3mvuSle6fng3BwJAT4hTQM4EIG/c7L/qynTmYkMy077SnWNR
 k1sj6Nk47agGPiLuR+BAHASRFYzTO3UV3pEJxbZ8xBokzObrfs0LEXJ0j0KG5gy9yKF/PlS8
 psyUNYbbYcruXVN+V7ZjCsv/tiqzvIt//79qs62m0iQR/l8YqGxmxSxw==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: linux-leds@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	"Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Kees Cook <kees@kernel.org>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v5 1/4] leds: trigger: netdev: Put netdev on activate error path
Date: Tue, 20 Oct 2026 14:46:45 +0200
Message-ID: <20261020124651.1987272-2-alexander.sverdlin@siemens.com>
In-Reply-To: <20261020124651.1987272-1-alexander.sverdlin@siemens.com>
References: <20261020124651.1987272-1-alexander.sverdlin@siemens.com>
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
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

When hw control is active, set_device_name() takes a reference on the
netdev via dev_get_by_name(). The register_netdevice_notifier() failure
path frees trigger_data without dropping it, leaking the netdev.

Cc: stable@vger.kernel.org
Closes: https://lore.kernel.org/all/20260914140045.B8F4C1F000FF@smtp.kernel.org/
Fixes: 0316cc5629d1 ("leds: trigger: netdev: init mode if hw control already active")
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
Changelog:
v5:
- removed unset_device_name()
v3:
- introduced unset_device_name() as a counterpart of set_device_name()

 drivers/leds/trigger/ledtrig-netdev.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
index 5b0132484594c..cfaf130157b3d 100644
--- a/drivers/leds/trigger/ledtrig-netdev.c
+++ b/drivers/leds/trigger/ledtrig-netdev.c
@@ -776,8 +776,10 @@ static int netdev_trig_activate(struct led_classdev *led_cdev)
 	led_set_trigger_data(led_cdev, trigger_data);
 
 	rc = register_netdevice_notifier(&trigger_data->notifier);
-	if (rc)
+	if (rc) {
+		dev_put(trigger_data->net_dev);
 		kfree(trigger_data);
+	}
 
 	return rc;
 }
-- 
2.56.0

