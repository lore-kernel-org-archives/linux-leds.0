Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793959587;
	b=L9BTq8m7nNg4ldespZE+spVeLcbYFzd6ZkgxRZxeFlyZPs21T9jBB7ShvIAEPaF9PpEA
	 m+4Z3hn4iC+ibaep7HnoBIZkN4tR7wI5uPB+fkhji99lUIqP95ZamRe4LZcEYTbevV1K0
	 JoRDFKBAp5bktyPpyTHyJ2WGO3bsFbYYDjwI3C53dcGF5RDYRKus70+xDO9ijr2iGFSJk
	 Ln8AzI5TIFzkmhNIsKL7t+ZU6i8llvwyxsyWc7yeBV0YopI3Co9dpbm0ltGNiVdy/H6Ws
	 r0z29wW/BeBF2prA5oxYnbS3XEyehEGiMlGpOdCO4hbC4N9mysA1AyLxOWGs+YB3Mlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793959587;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=71tMgdF+10Y5Seh1rmO4IE/SPqvJVm/4F8OYPfOhRQo=;
	b=VL6shN/8E8+HRxA1ytKcJ3eWFsS97Ymn11kCyI7opnl7ESJI9eTWj6SzE7ddfpbLGTxC
	 4UFkWOHP55vHaJlQWwgXEpFKdXqE6AQRS6fjgRHQiclS5ldRzG5m/bV8Dr50iesRop8a7
	 whsOEvqVSNQ/je4aMlPihbvyKmVaIAlAwZZ4VHnyoYu27OGplVOJZuuaV80NTRkWZr7xK
	 uPXl8ECq8Lthb112LlcXF3moP250RB3M5GOLSG19k15BLZpICSDIhENVUsPuxny8HFaOb
	 dDOPjd8m8VAgj1Kfil6kW5Y2JjxmSVOiYezrKNsfAefVvmQTWnaYmGYDNqZ4u+h6VhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=vaSMBQxz;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94539606A334;
	Fri,  6 Nov 2026 10:06:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94539606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=vaSMBQxz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=vaSMBQxzx6/RTto0J4NOeSIr5cxBRdUzsgSAQISADASaIcKj4EO40u7xb/Yxz5PhIStZYdvyn/IOo
	 ifY9hCceOFI+jr3heW1tqTc3V6A6bd45w02CG89jRuVTfFJ6fX6E9aysKsLYSR1oL+EjdkFR4u1WBF
	 EJBLKG0PHzfpup+Y=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee16aeda69db43-8cdcf;
	Fri, 06 Nov 2026 18:06:24 +0800 (CST)
X-RM-TRANSID:2ee16aeda69db43-8cdcf
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from FHB-W5100250 (unknown[36.137.216.21])
	by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee66aeda698002-1c227;
	Fri, 06 Nov 2026 18:06:24 +0800 (CST)
X-RM-TRANSID:2ee66aeda698002-1c227
From: Gu Bin <gubin@cmss.chinamobile.com>
To: lee@kernel.org
Cc: pavel@kernel.org,
	david@lechnology.com,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] tools/leds/uledmon: force NUL-termination of device name
Date: Fri,  6 Nov 2026 18:06:13 +0800
Message-ID: <20261106100614.2312-1-gubin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
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

Force NUL-termination after the strncpy.

Fixes: fa7f32422ea1 ("tools/leds: Add uledmon program for monitoring userspace LEDs")
Signed-off-by: Gu Bin <gubin@cmss.chinamobile.com>
---
 tools/leds/uledmon.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/leds/uledmon.c b/tools/leds/uledmon.c
index c15a39c1f271..6df35b817233 100644
--- a/tools/leds/uledmon.c
+++ b/tools/leds/uledmon.c
@@ -32,6 +32,7 @@ int main(int argc, char const *argv[])
 	}
 
 	strncpy(uleds_dev.name, argv[1], LED_MAX_NAME_SIZE);
+	uleds_dev.name[LED_MAX_NAME_SIZE - 1] = '\0';
 	uleds_dev.max_brightness = 100;
 
 	fd = open("/dev/uleds", O_RDWR);
-- 
2.55.0.windows.3



