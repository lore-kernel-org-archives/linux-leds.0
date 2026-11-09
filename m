Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794207955;
	b=jNDSTBRynoG33cyXyxPOKCVtB4XtD6dqoAiup7z+EtyBSgyPYwy1Hm5QG/OW/jFhYw30
	 /zFyt8ao+/mmQQnvAyWmKC7RRRP9aUAUaWTgHaMsWPd66dDseFPsm3P+9VI6/PzdQNbhl
	 3qpnWQ4tw84rKVFxmie/zbUnv7Xs5FULeBJFrUI+A/E+XlC5AtS+4aEmsYglN2XbrsDb3
	 ZYt+z1fDWf73rCw7K1PSh0gms1jd1+QJshYLec+AKUUgoNOCbtLEhvXZRPZQsStrs6wg2
	 3qp8k99PQKifolF53nUsVj/zduTO+RQqI7yBs84VtRQpat+1rtYD5iFc+XrZ49dsFyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794207955;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=W1ABmc3WTCzKJfUFhADUbSuXP+AhOfzoYuOow8/pfyY=;
	b=Qe5uC9mODAtj95VSH3KQfoK4KuMgVDVLxJKFp0jlk0fstFl4fBtG7AtC5rn9mfadTIjr
	 LNU0Os5k2rNoYKD7M/AGEKqb7tPXRfqCt8hyTXK6YG2tQNIvTgjLAbLVQZ+sdg4SMDNIh
	 L0EtCv+xEtR0BhOlyCHFmn1sgDSrrlmHXYj36nWQML3EvQXUnujMY9qHgoEbzTKmAl429
	 NZPdsDcReJkZfM2KHUWKQx6D4Qjl1Hp4tvyp3OMYIDzLI1eO9VFOlqE+DFWEbNtPgNwrx
	 YMegW7aP7HHJBXa5DsYvP6iKVAWYmlRY7T3a/inkCqftJmVruA4ZyG9S4/SybAb3G7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=LDrslFLL;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57D38606A31C;
	Mon,  9 Nov 2026 07:05:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57D38606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=LDrslFLL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=LDrslFLLqNIgvCuzNriJUhAkwu7D3DwSp2pSNdnRUqyf/EWSi3nMI6teREooLwwHrTlug78i/9V6g
	 tCwOibfZOOpXbycvWl95lxpm98iKiQ0mvEiYjQ2XdHokbrpOt0x2UfA0M7ZttxjaJTFy56UK7B3a7j
	 4rSTrLcbKeX/y1Hw=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee66af170ceda6-8e8e2;
	Mon, 09 Nov 2026 15:05:51 +0800 (CST)
X-RM-TRANSID:2ee66af170ceda6-8e8e2
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from FHB-W5100250 (unknown[36.137.216.21])
	by rmsmtp-syy-appsvr02-12002 (RichMail) with SMTP id 2ee26af170c6071-85b1c;
	Mon, 09 Nov 2026 15:05:51 +0800 (CST)
X-RM-TRANSID:2ee26af170c6071-85b1c
From: Gu Bin <gubin@cmss.chinamobile.com>
To: lee@kernel.org
Cc: pavel@kernel.org,
	david@lechnology.com,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] tools/leds/uledmon: reject device names that are too long
Date: Mon,  9 Nov 2026 15:05:38 +0800
Message-ID: <20261109070539.1922-1-gubin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <20261106100614.2312-1-gubin@cmss.chinamobile.com>
References: <20261106100614.2312-1-gubin@cmss.chinamobile.com>
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

Changes in v2: reject over-long names with an error instead of
silently truncating them, as suggested by David Lechner.

 tools/leds/uledmon.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tools/leds/uledmon.c b/tools/leds/uledmon.c
index c15a39c1f271..d38f5716c7f7 100644
--- a/tools/leds/uledmon.c
+++ b/tools/leds/uledmon.c
@@ -31,7 +31,13 @@ int main(int argc, char const *argv[])
 		return 1;
 	}
 
-	strncpy(uleds_dev.name, argv[1], LED_MAX_NAME_SIZE);
+	if (strlen(argv[1]) >= LED_MAX_NAME_SIZE) {
+		fprintf(stderr, "Device name too long (max %d bytes)\n",
+			LED_MAX_NAME_SIZE - 1);
+		return 1;
+	}
+
+	strcpy(uleds_dev.name, argv[1]);
 	uleds_dev.max_brightness = 100;
 
 	fd = open("/dev/uleds", O_RDWR);
-- 
2.55.0.windows.3



