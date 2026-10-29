Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793264466;
	b=is3pcpyqaoOnrmULyS9SITTYE4k+25C3q16oaZjSGg717XpFkyEFuJXxzRO5OlBergx6
	 S3OzHBHJUz1ppF/IjPlTMt8Bc3g//03a8xPdKvyFb+vNyimcrOc/+T1AdgfsnMNzq15wI
	 VkFO2frmp9TlK1vFUfuzet3ez1ZUSAH5MGsKY8+qiHiW7K07OefcsHtF7xkZ7JtRNW4aX
	 Lpi+KX0Tg8mOehm5m6erQ5sXgFFw7CNZDHrla5aM4jyozAHA3/mkBgyQIgg6LQzF2fytC
	 kalB/Cx0B9qe6SLJiFuQorF6hTRbrBNKKisj1wOzCvo1eEDxzGrkF+zplf4DDvC9e1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793264466;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Z3mbcZY+neJw3cJUW+gndo2WA1VaXIZUfre4RITk+7k=;
	b=gtGd3JXsfMtWVv+9/l6PXJXvnM9VLUW7bM4Gw5wzS7o0nDqWe/hemAFu8eTx1es22pq9
	 S7PhdxOlN0lMzil+gPauzSHg5b6QHrtFdZq43iROREQ9BBEc2JKvVJziyo0aRvF4Bj8kC
	 fd5A5Q8JSxqpYaZDPLjT8V1Z61cP7kc6gbB/TseM7AV7z09dz/YFLeDF6HbQzmJnPpCTF
	 x3KVjmyOiFz78S71whFk/JliK9AiC1lZpx/TqArSp2NUMmDS2+Y+/9j3f+okJ7+bpAF6f
	 pxmJ5PxbBtUNDtxKg92W5muj9HnW8nYgDRBqDKVujddJWo9k4KYen47ZeF2my55yJQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TCcGnNUJ;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89437606A32E
	for <linux-leds@vger.kernel.org>; Thu, 29 Oct 2026 09:01:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89437606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TCcGnNUJ
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36a1947498bso1261390eec.1
        for <linux-leds@vger.kernel.org>; Thu, 29 Oct 2026 02:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793264465; x=1793869265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z3mbcZY+neJw3cJUW+gndo2WA1VaXIZUfre4RITk+7k=;
        b=TCcGnNUJc9rE3+MU2dfBg1/buLqpvuGZpYCZpTH5anu5u+ZMXaHl9K3FX4AOJa36iE
         SHLYuQ8VH7B/b7kK8397LfdltoUH5e6q2jo++wZvHhNr1Kqx2KiiJVNWv++16GSYeXQH
         t6Ww3ttl7Q+94LDcf7q0QvjHrUAXJfa/V7tBTLTrruB4gSw/g97V32iMOOU0Sm9ERl9S
         4MGRGzLa94oKF7jIl1QFcE66oOfgguRO0RAazo4KhivQuQbL7hiPIbc7D/5wupmrnu67
         NZ2ljq3nvkvPLFUrnS/YtgabfHFLNHyNR8ZRtyhzh7sH9L0c+OWsajyMQ2UolEIrFD08
         PAuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793264465; x=1793869265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z3mbcZY+neJw3cJUW+gndo2WA1VaXIZUfre4RITk+7k=;
        b=17wxThHJgE+DP76Mzb4cXev9ZHFAOc0PauMvb09EC+MawHF008jbou4C2DiQORFO6S
         K4QUOdjoriuej87chvfs2slHKOE9/k2p1a9ddjbcV0HmAlnl7UrkxtJxM4rHNKMJhdjd
         BMyGtG+9xTKC5nKezYYFRi5dowL0EtmRJCFlaKQo6krFQfOz9DF7j8UthEI4S8Mc1HfO
         0nXQeuAXJfUVdD+qczsG/Ewq4WvUc4Nxk+rddrSL6TpWhaSp0bbvkATrmMVYWsVrvWix
         qd6zGg0sYj2ZvwU/J3NvdSMVuGo5aCNfTZkLDW36hnrfApMe0y1KV3TRQhHidQBBPEv/
         lKxA==
X-Forwarded-Encrypted: i=1; AKwUvBxLVkojN8fAjgILVa/mn31dtK0E2C7auKJaI3U6UO+Uxz34Ss7h8Q8T7srrqADyYQLPqHOHHE0agKvz@vger.kernel.org
X-Gm-Message-State: AFq9FYIawnhNwyHFTIbICU9eWc4Dl+O3Dh/2nBLBkJAr4pePIpecSOSH
	1MC7gSytYqSsQy9bqFSPCAsVKqXXmjciK/4Jr4MQC/wQ6UeVV4rn2oQ=
X-Gm-Gg: AYBFou1I/mfR8R3UH0kRYAOvwATVN9Yg5eW07+zvl72tqJS0MZvA37ukItwKks38IND
	1sfVjOyHb4ui2tt1T8ZDIPKqiWnJelHDqGjeE6x11NvT0dEloWsQjlBxujxhsMPEXFjrp+9uRtr
	UWE4smSOOn1WYaZ5M5D1qI04kilUE9NAJlIQu1/MbkUeOU0fGVrNPA3D6tb8wCWyPncdX3tFBX8
	UnxEWcXk7BmeEw+zNNn39Vy+zEoi7+GaMBsBRhYdpNlu5zTS12ytTI0PU12D0g8598jlEUCDGB4
	qQdf9qCZgakv4UAl7i+1spZmaVckYizlYhWO5ZLCNIti2wsVCsgsB2rwRwXTAqDG/6Fqkfm4Xmn
	gwxEdSOGR6fxphBNwc09Sn3Bp0Z4aUWoSk2vtxVZRyGRDsCmwpPxbY2grj0pYFjTiskMTuo4rD4
	5jsvZdEMY1RntC4lxR7ecS/FqjHVmkVo5L4k51YlDMUJ2pBW6svKvO1t9qtGKNhvWT2zq2+xttc
	ONbsIqcbmAq38KXPW541tEs2vMX59XBEmDY5SYIXSxyzgINzP4qNZKMng53K4FOlg/bAxuAkR8Y
	Z96bDV90rbHZMeNy23e2oL3S2R7zKbMGsFRqANImj13M2w4Tz/Il05Z51FYipg==
X-Received: by 2002:a05:7300:f894:b0:351:207d:bff4 with SMTP id 5a478bee46e88-36a202bc360mr7083860eec.4.1793264464275;
        Thu, 29 Oct 2026 02:01:04 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009 ([27.60.20.232])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a23641e78sm16497937eec.0.2026.10.29.02.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:01:03 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Sebastian Reichel <sre@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Mimi Zohar <zohar@linux.ibm.com>,
	Roberto Sassu <roberto.sassu@huawei.com>,
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	Eric Snowberg <eric.snowberg@oracle.com>,
	Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-hwmon@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-leds@vger.kernel.org,
	mfd@lists.linux.dev,
	platform-driver-x86@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org
Subject: [RFC PATCH 11/14] acpi: disable battery and adapter for x86 apple machines
Date: Thu, 29 Oct 2026 04:52:08 -0400
Message-ID: <20261029085504.3547-12-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261029085504.3547-1-atharvatiwarilinuxdev@gmail.com>
References: <20261029085504.3547-1-atharvatiwarilinuxdev@gmail.com>
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

When macsmc-power is enabled on an Intel Mac, skip acpi-sbs
and the ACPI battery and adapter drivers, since macsmc-power
now provides them. This avoids duplicate devices.

Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
 drivers/acpi/sbs.c       | 17 +++++++++--------
 drivers/acpi/x86/utils.c |  4 ++++
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/acpi/sbs.c b/drivers/acpi/sbs.c
index f10bbf13c..b12f2acc0 100644
--- a/drivers/acpi/sbs.c
+++ b/drivers/acpi/sbs.c
@@ -634,6 +634,9 @@ static int acpi_sbs_probe(struct platform_device *pdev)
 	int result = 0;
 	int id;
 
+	if (IS_ENABLED(CONFIG_MACSMC_POWER) && x86_apple_machine)
+		return -ENODEV;
+
 	device = ACPI_COMPANION(&pdev->dev);
 	if (!device)
 		return -ENODEV;
@@ -655,14 +658,12 @@ static int acpi_sbs_probe(struct platform_device *pdev)
 
 	result = 0;
 
-	if (!x86_apple_machine) {
-		result = acpi_manager_get_info(sbs);
-		if (!result) {
-			sbs->manager_present = 1;
-			for (id = 0; id < MAX_SBS_BAT; ++id)
-				if ((sbs->batteries_supported & (1 << id)))
-					acpi_battery_add(sbs, id);
-		}
+	result = acpi_manager_get_info(sbs);
+	if (!result) {
+		sbs->manager_present = 1;
+		for (id = 0; id < MAX_SBS_BAT; ++id)
+			if ((sbs->batteries_supported & (1 << id)))
+				acpi_battery_add(sbs, id);
 	}
 
 	if (!sbs->manager_present)
diff --git a/drivers/acpi/x86/utils.c b/drivers/acpi/x86/utils.c
index 418951639..9f3b9b7d9 100644
--- a/drivers/acpi/x86/utils.c
+++ b/drivers/acpi/x86/utils.c
@@ -14,6 +14,7 @@
 #include <linux/dmi.h>
 #include <linux/pci.h>
 #include <linux/platform_device.h>
+#include <linux/platform_data/x86/apple.h>
 #include <asm/cpu_device_id.h>
 #include <asm/intel-family.h>
 #include "../internal.h"
@@ -608,6 +609,9 @@ bool acpi_quirk_skip_acpi_ac_and_battery(void)
 	long quirks = 0;
 	int i;
 
+	if (IS_ENABLED(CONFIG_MACSMC_POWER) && x86_apple_machine)
+		return true;
+
 	dmi_id = dmi_first_match(acpi_quirk_skip_dmi_ids);
 	if (dmi_id)
 		quirks = (unsigned long)dmi_id->driver_data;
-- 
2.55.0

