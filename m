Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795424471;
	b=KQbon5Jzzp8mWuTwF+apbbSpwn8lsDWy2KaL1tytXMbLgubRbKg0HCy+Y7++PhyxLPR3
	 c83bewG2isbMLsyolbw2BbF7oNeGnN1UjGK4C/dKlz8Ss/OYBsx+KpIvuznLQm1P1687s
	 ZMzW708UfAcP9ISLSuZRHqoZdZDgdd/2HBledcJReKyO6HeEAoPbuvtGxwJa3DLe6+ALq
	 kPt3JTPn+cbUBowCzOGa+BBNjyOKFbCETxbCj4vX+bQDHvLaNsOPvkjcqbMW8198YUkmB
	 W/SDi9VeN5sWDLiI1K4HT7SL1790/I0ipV5U4461TcuoJ4JWFpeDprMPZ0qVPNsbeuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795424471;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ko4lHFMO6rgY5vkIo91sJE054+t6Rp7aGh4qjpiyKKI=;
	b=k1bFHUwYGMLoz0jRSl32XGIHKrpAUxQNP4FuDlU8NoxmIuhisAmcAYQ23c1QHk+tMh/Y
	 yV318XN0P80DOFXEWunEJ/F6SCjV6JnQGx+scC2fswTZdjN3sOGdELuhkugAlXYOOOrVm
	 1eN9aapfk1yjZWLiBUIajzUfsBaWN8UpurHZ1O0h1O/NxH1ltgNfu/An1GSwZhwZVmK8b
	 txMJ5tOvyRSyQUdf4sK/on4nIuG0i9NTaVZl16IlNLHf5pWnkHNM8Oo+4gOHB3rn4FtT0
	 J6+j0pnEab/fRqXIWlAuuYgI9Y8lw4ZEA7hi3J0akZR9rE+BbdnxxbIcOhQM2Oa4m1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=Hftv1M8s;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF88460A2613;
	Mon, 23 Nov 2026 09:01:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF88460A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=Hftv1M8s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=Hftv1M8ss6n39NIvNg2Ecva2/Am+8SSbMcStum04UEMOJ2G9osH3uUBDX5EKDCbGK3+Rbh7K1xq18
	 fcjHJW6AWx4WbHORMr0v0DDu4FYQN6xPU4S1WPfvFXk0Oc2ExsAplG8ZvbWlH9magUyd7dtYo/t02w
	 HfNy6uz8mjIDKszg=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee96b0400ce608-421d0;
	Mon, 23 Nov 2026 17:01:05 +0800 (CST)
X-RM-TRANSID:2ee96b0400ce608-421d0
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from FHB-W5100250 (unknown[36.137.216.21])
	by rmsmtp-syy-appsvr04-12004 (RichMail) with SMTP id 2ee46b0400c9c2f-8f361;
	Mon, 23 Nov 2026 17:01:05 +0800 (CST)
X-RM-TRANSID:2ee46b0400c9c2f-8f361
From: Gu Bin <gubin@cmss.chinamobile.com>
To: lee@kernel.org
Cc: pavel@kernel.org,
	david@lechnology.com,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] tools/leds/uledmon: reject device names that are too long
Date: Mon, 23 Nov 2026 17:00:54 +0800
Message-ID: <20261123090055.2508-1-gubin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <179442104215.44545.2144163087581820120@kernel.org>
References: <179442104215.44545.2144163087581820120@kernel.org>
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

strncpy() does not NUL-terminate when the source is at least as long
as the bound. uleds_dev.name is passed to the kernel with
write(fd, &uleds_dev, sizeof(uleds_dev)), so a >= LED_MAX_NAME_SIZE
byte argv[1] leaves name without a terminator and the write sends
trailing bytes that are not part of a valid device name.

Silently truncating such a name would create a device the user did
not ask for, so error out instead, like the other argument checks
already do.

Fixes: fa7f32422ea1 ("tools/leds: Add uledmon program for monitoring userspace LEDs")
Suggested-by: David Lechner <david@lechnology.com>
Signed-off-by: Gu Bin <gubin@cmss.chinamobile.com>
---
Changes in v3: keep strncpy() instead of switching to strcpy(), since
strcpy() would leave the tail of uleds_dev.name uninitialised and the
whole struct is passed to write(), leaking stack memory to the kernel,
as pointed out by Lee Jones.
 tools/leds/uledmon.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/leds/uledmon.c b/tools/leds/uledmon.c
index c15a39c1f2714..4b40729a13e93 100644
--- a/tools/leds/uledmon.c
+++ b/tools/leds/uledmon.c
@@ -31,6 +31,12 @@ int main(int argc, char const *argv[])
 		return 1;
 	}
 
+	if (strlen(argv[1]) >= LED_MAX_NAME_SIZE) {
+		fprintf(stderr, "Device name too long (max %d bytes)\n",
+			LED_MAX_NAME_SIZE - 1);
+		return 1;
+	}
+
 	strncpy(uleds_dev.name, argv[1], LED_MAX_NAME_SIZE);
 	uleds_dev.max_brightness = 100;
 
-- 
2.50.1.windows.1



