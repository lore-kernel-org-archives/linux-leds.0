Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795155533;
	b=0NayApISTWMv0bnMAjGNP2lY5VxJs/hQ/rJSPF5H1ovncYSXGPDtjrpjszFs8OQvNE2U
	 mTwhQPtCfjjxD4lmG57ykEGbbNz7tWqtNXocvnptTJZk5O44Gy5MAbCJJVMmUlM4HyNkF
	 CgUWypDEVF/Q71CpsTxU6sQoaNY8Za2FhFE6NzApZAPGy+IbpgZaHmhJYSPh9T8FF9lzf
	 qfSM9dNfM8h53lBKLhdWCVmmFrH8Ox3t7eC3BiIXQA13FwBF0g2Bh8RhxQWlYC8c9h5B6
	 ookTSMyhA/ea00DXme8YyBYwmylKKP68jV6IlTx6AcUCfinQ+y+saMBG/c10412I3Sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795155533;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Wvd/leJVVRMYb9xXPFoawniofrkc24UrTssl3gcACC0=;
	b=VmSFrssPYBP8As7VRknNhZaM38KUJE7JsKyK2VSkrfjo250RveSj80/bQWWpNwrre6me
	 +H0PHM6a+UgE6bhttStQHyNiV82QyZVDZvsotDI64/OWId8GWroeooBqZrXdE0Ue3jyOK
	 EJNpZmFB9PlNlUXTOaqEf8y8N/g5pga7sAcvXjpVG5NMw2FUYDCw5vNNLfeeLzQFRY3KM
	 Mb9dKFMRfLe3HLxYuTD8wGnCALYymwxjVOb+GpWWUiotmRfEM4s0D2VNxAjNCvEiWyYsl
	 GcSy9wXz2aBm3jOSdCc5+5av38VJkw0pFJSsiLq+590lUZneim8VkfYLI9qMKhRRZ2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=WFkopXIF;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1726D606A50A;
	Fri, 20 Nov 2026 06:18:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1726D606A50A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=WFkopXIF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=WFkopXIFkI7a5n3+pL//jGF5cwbfBHB3OEEvZXkGpXAFXE0wXTXMZYfNVnIIrY3UAQ0UOiFC+yWav
	 8kgHbPicEple5TenCNa/7ZAxKZf7fP1TH0WuLzRueFPrj53YlHnd2V70GXsQ7c0ErvMWLTVFUMgRGf
	 1vnJhjPwMIWkIh18=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app02-12002 (RichMail) with SMTP id 2ee26affe641949-60f71;
	Fri, 20 Nov 2026 14:18:41 +0800 (CST)
X-RM-TRANSID:2ee26affe641949-60f71
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform.localdomain (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr02-12002 (RichMail) with SMTP id 2ee26affe6407cc-1864f;
	Fri, 20 Nov 2026 14:18:41 +0800 (CST)
X-RM-TRANSID:2ee26affe6407cc-1864f
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: lee@kernel.org
Cc: pavel@kernel.org,
	griffin@kroah.com,
	jacek.anaszewski@gmail.com,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] tools/leds: Build the full hardware brightness path
Date: Fri, 20 Nov 2026 14:18:40 +0800
Message-ID: <20261120061840.98122-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.51.0
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

The path includes both the LED class directory and the attribute
name, but snprintf() limits the entire result to the LED name size.
This truncates valid paths and causes open() to fail. Allow room
for the whole path and check for truncation before opening it.

Fixes: ae3473231e77 ("tools/leds: Add led_hw_brightness_mon program")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 tools/leds/led_hw_brightness_mon.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/tools/leds/led_hw_brightness_mon.c b/tools/leds/led_hw_brightness_mon.c
index eb65ae988839..c26be496a00d 100644
--- a/tools/leds/led_hw_brightness_mon.c
+++ b/tools/leds/led_hw_brightness_mon.c
@@ -14,6 +14,7 @@
 
 #include <errno.h>
 #include <fcntl.h>
+#include <limits.h>
 #include <poll.h>
 #include <stdio.h>
 #include <stdlib.h>
@@ -21,12 +22,10 @@
 #include <time.h>
 #include <unistd.h>
 
-#include <linux/uleds.h>
-
 int main(int argc, char const *argv[])
 {
 	int fd, ret;
-	char brightness_file_path[LED_MAX_NAME_SIZE + 11];
+	char brightness_file_path[PATH_MAX];
 	struct pollfd pollfd;
 	struct timespec ts;
 	char buf[11];
@@ -36,8 +35,12 @@ int main(int argc, char const *argv[])
 		return 1;
 	}
 
-	snprintf(brightness_file_path, LED_MAX_NAME_SIZE,
-		 "/sys/class/leds/%s/brightness_hw_changed", argv[1]);
+	ret = snprintf(brightness_file_path, sizeof(brightness_file_path),
+		       "/sys/class/leds/%s/brightness_hw_changed", argv[1]);
+	if (ret < 0 || (size_t)ret >= sizeof(brightness_file_path)) {
+		fprintf(stderr, "Invalid LED brightness path\n");
+		return 1;
+	}
 
 	fd = open(brightness_file_path, O_RDONLY);
 	if (fd == -1) {


